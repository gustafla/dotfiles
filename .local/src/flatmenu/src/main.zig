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
    const arena = init.arena.allocator();
    const environ = init.minimal.environ;

    // Get menu program name
    const dmenu = if (environ.getPosix("DMENU")) |value|
        value
    else if (environ.containsUnemptyConstant("WAYLAND_DISPLAY"))
        "wmenu"
    else
        "dmenu";

    std.log.debug("Initializing program arguments", .{});
    const argv = try init.minimal.args.toSlice(arena);
    @constCast(argv)[0] = dmenu;

    std.log.debug("Listing flatpak packages", .{});
    const listing = try std.process.run(arena, io, .{ .argv = &.{ "flatpak", "list", "--json", "--app" } });
    if (!listing.term.success()) {
        std.log.err("Cannot list flatpak packages: {f}", .{listing.term});
        return error.FlatpakListFailed;
    }

    std.log.debug("Parsing the flatpak listing", .{});
    const packages = try std.json.parseFromSliceLeaky(
        []FlatpackPackageInfo,
        arena,
        listing.stdout,
        .{ .ignore_unknown_fields = true },
    );
    deduplicatePackageNames(packages);

    std.log.debug("Spawning {s}", .{dmenu});
    var dmenu_process = try std.process.spawn(io, .{
        .argv = argv,
        .stdin = .pipe,
        .stdout = .pipe,
    });

    var stdin = dmenu_process.stdin.?.writer(io, &writer_buffer);
    for (packages) |package| {
        stdin.interface.writeAll(package.name) catch return stdin.err.?;
        stdin.interface.writeByte('\n') catch return stdin.err.?;
    }
    try stdin.flush();
    dmenu_process.stdin.?.close(io);
    dmenu_process.stdin = null;

    std.log.debug("Receiving the selection from {s}", .{dmenu});
    var cursor: usize = 0;
    while (true) {
        cursor += dmenu_process.stdout.?.readStreaming(io, &.{reader_buffer[cursor..]}) catch |err|
            if (err == error.EndOfStream) break else return err;
        if (cursor >= reader_buffer.len) return error.PackageNameTooLong;
    }
    const selection_name = std.mem.trim(u8, reader_buffer[0..cursor], " \t\n\r");

    std.log.debug("Waiting for {s}", .{dmenu});
    const dmenu_result = try dmenu_process.wait(io);
    if (!dmenu_result.success()) {
        std.log.err("{s} exited unsuccessfully: {f}", .{ dmenu, listing.term });
        return error.MenuSelectionFailed;
    }

    std.log.debug("Mapping {s} to package id", .{selection_name});
    const selection_id = mapPackageNameToId(packages, selection_name) orelse
        return error.InvalidPackageName;

    std.log.debug("Spawning {s}", .{selection_id});
    _ = try std.process.spawn(io, .{
        .argv = &.{ "flatpak", "run", selection_id },
    });
}
