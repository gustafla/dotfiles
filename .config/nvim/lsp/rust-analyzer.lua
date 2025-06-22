return {
    cmd = { "rust-analyzer" },
    filetypes = { "rust" },
    settings = {
        checkOnSave = {
            command = "clippy",
        },
    },
    root_markers = {
        "Cargo.toml",
        "Cargo.lock",
    },
}
