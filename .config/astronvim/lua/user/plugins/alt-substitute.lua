-- https://github.com/chrisgrieser/nvim-alt-substitute
return {
    "chrisgrieser/nvim-alt-substitute",
    opts = true,
    -- lazy-loading with `cmd =` does not work well with incremental preview
    event = "CmdlineEnter",
}
