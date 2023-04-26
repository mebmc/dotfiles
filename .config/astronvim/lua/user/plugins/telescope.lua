-- https://github.com/nvim-telescope/telescope.nvim
return {
    "nvim-telescope/telescope.nvim",
    version = false,
    dependencies = {
        "nvim-lua/plenary.nvim"
    },
    cmd = "Telescope",
    build = "make",
    opts = {
        pickers = {
            find_files = {
                find_command = { "fd", "--type", "f", "--strip-cwd-prefix" }
            },
        }
        -- extensions = {
        --   fzf = {
        --     fuzzy = true,                   -- false will only do exact matching
        --     override_generic_sorter = true, -- override the generic sorter
        --     override_file_sorter = true,    -- override the file sorter
        --     case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
        --     -- the default case_mode is "smart_case"
        --   }
        -- }
    },
    -- config = function(opts)
    --   require('telescope').setup({ opts })
    --   -- require("telescope").load_extension('fzf')
    -- end,
}
