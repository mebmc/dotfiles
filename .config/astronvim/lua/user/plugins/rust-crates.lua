-- https://github.com/Saecki/crates.nvim
return {
    "Saecki/crates.nvim",
    dependencies = {
        'nvim-lua/plenary.nvim'
    },
    event = { "BufRead Cargo.toml" },
    config = function()
        require('crates').setup()

        local wk = require("which-key")

        wk.register({
            ["<leader>lC"] = {
                name = "󱘗 Cargo"
            }
        })

        -- Crates mappings:
        local map = vim.api.nvim_set_keymap
        map("n", "<leader>lCt", ":lua require('crates').toggle()<cr>", { desc = "Toggle extra crates.io information" })
        map("n", "<leader>lCr", ":lua require('crates').reload()<cr>", { desc = "Reload information from crates.io" })
        map("n", "<leader>lCU", ":lua require('crates').upgrade_crate()<cr>", { desc = "Upgrade a crate" })
        map("v", "<leader>lCU", ":lua require('crates').upgrade_crates()<cr>", { desc = "Upgrade selected crates" })
        map("n", "<leader>lCA", ":lua require('crates').upgrade_all_crates()<cr>", { desc = "Upgrade all crates" })
    end,
}
