-- User autocmds

vim.api.nvim_create_autocmd("FileType", {
    command = "TwilightEnable",
    pattern = {
        "go",
        "lua",
        "python",
        "rust",
        "typescript",
        "yaml",
        "zig",
    },
})
