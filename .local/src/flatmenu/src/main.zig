const std = @import("std");
const Environ = std.process.Environ;

const FlatpackPackageInfo = struct {
    name: []const u8,
    application_id: []const u8,
};

var writer_buffer: [1024]u8 = undefined;
var reader_buffer: [1024]u8 = undefined;

fn mapPackageNameToId(packages: []const FlatpackPackageInfo, name: []const u8) ?[]const u8 {
    for (packages) |package| {
        if (std.mem.eql(u8, package.name, name)) {
            return package.application_id;
        }
        if (std.mem.eql(u8, package.application_id, name)) {
            return package.application_id;
        }
    }
    return null;
}

fn deduplicatePackageNames(packages: []FlatpackPackageInfo) void {
    for (packages[1..], 1..) |*current, i| {
        for (packages[0..i]) |previous| {
            if (std.mem.eql(u8, current.name, previous.name)) {
                current.name = current.application_id;
                break;
            }
        }
    }
}

pub fn main(init: std.process.Init) !void {
    const io = init.io;
    const arena: std.mem.Allocator = init.arena.allocator();

    std.log.debug("Collecting CLI arguments", .{});
    const args = try init.minimal.args.toSlice(arena);

    std.log.debug("Getting menu program name from $DMENU", .{});
    const dmenu = if (init.minimal.environ.getAlloc(arena, "DMENU")) |value|
        value
    else |err| if (err == Environ.GetAllocError.EnvironmentVariableMissing)
        "wmenu"
    else
        return err;

    std.log.debug("Listing flatpak packages", .{});
    const listing = try std.process.run(arena, io, .{ .argv = &.{ "flatpak", "list", "--json", "--app" } });
    if (!listing.term.success()) {
        std.log.err("Cannot list flatpak packages: {f}", .{listing.term});
        return error.FlatpakListFailed;
    }

    std.log.debug("Parsing the flatpak listing", .{});
    const packages = try std.json.parseFromSlice(
        []const FlatpackPackageInfo,
        arena,
        listing.stdout,
        .{ .ignore_unknown_fields = true },
    );
    deduplicatePackageNames(@constCast(packages.value));

    std.log.debug("Spawning {s}", .{dmenu});
    const argv = try std.mem.concat(arena, []const u8, &.{ &.{dmenu}, args[1..] });
    var dmenu_process = try std.process.spawn(io, .{
        .argv = argv,
        .stdin = .pipe,
        .stdout = .pipe,
    });

    var stdin = dmenu_process.stdin.?.writer(io, &writer_buffer);
    for (packages.value) |package| {
        stdin.interface.writeAll(package.name) catch return stdin.err.?;
        stdin.interface.writeByte('\n') catch return stdin.err.?;
    }
    try stdin.flush();
    dmenu_process.stdin.?.close(io);
    dmenu_process.stdin = null;

    std.log.debug("Receiving the selection from {s}", .{dmenu});
    var stdout = dmenu_process.stdout.?.readerStreaming(io, &reader_buffer);
    const selection_name_raw = try stdout.interface.allocRemaining(arena, .limited(4096));
    const selection_name = std.mem.trim(u8, selection_name_raw, " \t\n\r");

    std.log.debug("Waiting for {s}", .{dmenu});
    const dmenu_result = try dmenu_process.wait(io);
    if (!dmenu_result.success()) {
        std.log.err("{s} exited unsuccessfully: {f}", .{ dmenu, listing.term });
        return error.MenuSelectionFailed;
    }

    std.log.debug("Mapping {s} to package id", .{selection_name});
    const selection_id = mapPackageNameToId(packages.value, selection_name) orelse
        return error.InvalidPackageName;

    std.log.debug("Spawning {s}", .{selection_id});
    _ = try std.process.spawn(io, .{
        .argv = &.{ "flatpak", "run", selection_id },
    });
}
