-- https://github.com/nvim-neorg/neorg
return {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    dependencies = {
        "nvim-lua/plenary.nvim"
    },
    cmd = { "Neorg" },
    config = function()
        require("neorg").setup {
            load = {
                ["core.defaults"] = {},  -- Loads default behaviour
                ["core.concealer"] = {}, -- Adds pretty icons to your documents
                ["core.dirman"] = {      -- Manages Neorg workspaces
                    config = {
                        workspaces = {
                            notes = "~/git/notes",
                            work = "~/work/notes",
                            technotes = "~/git/technotes"
                        },
                        default_workspace = "notes"
                    },
                },
            },
        }
    end,
}
