-- https://github.com/folke/noice.nvim
return {
    "folke/noice.nvim",
    keys = {
        { "<leader>uD", function() require("notify").dismiss { pending = true, silent = true } end, desc = "Dismiss notifications" },
    },
    opts = {
        lsp = {
            signature = {
                enabled = false
            }
        }
    }
}
