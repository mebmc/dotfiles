-- https://github.com/nvimdev/lspsaga.nvim
return {
    "glepnir/lspsaga.nvim",
    event = "LspAttach",
    dependencies = {
        { "nvim-tree/nvim-web-devicons" },
        --Please make sure you install markdown and markdown_inline parser
        { "nvim-treesitter/nvim-treesitter" }
    },
    keys = {
        { "<leader>Lh", "<cmd>Lspsaga lsp_finder<cr>",                 desc = "Lspsaga LSP Finder" },
        { "<leader>Lv", "<cmd>Lspsaga code_action<cr>",                desc = "Lspsaga Code Action" },
        { "<leader>Lr", "<cmd>Lspsaga rename<cr>",                     desc = "Lspsaga Rename" },
        { "<leader>LR", "<cmd>Lspsaga rename ++project<cr>",           desc = "Lspsaga Rename Project" },
        { "<leader>Ld", "<cmd>Lspsaga peek_definition<cr>",            desc = "Lspsaga Peak Definition" },
        { "<leader>LD", "<cmd>Lspsaga goto_definition<cr>",            desc = "Lspsaga Goto Definition" },
        { "<leader>Lt", "<cmd>Lspsaga peek_type_definition<cr>",       desc = "Lspsaga Peak Type Def" },
        { "<leader>LT", "<cmd>Lspsaga goto_type_definition<cr>",       desc = "Lspsaga Goto Type Def" },
        { "<leader>Ll", "<cmd>Lspsaga show_line_diagnostics<cr>",      desc = "Lspsaga Line Diagnostics" },
        { "<leader>Lb", "<cmd>Lspsaga show_buf_diagnostics<cr>",       desc = "Lspsaga Buf Diagnostics" },
        { "<leader>Lw", "<cmd>Lspsaga show_workspace_diagnostics<cr>", desc = "Lspsaga Workspace Diagnostics" },
        { "<leader>Lc", "<cmd>Lspsaga show_cursor_diagnostics<cr>",    desc = "Lspsaga Cursor Diagnostics" },
        { "<leader>Lo", "<cmd>Lspsaga outline<cr>",                    desc = "Lspsaga Outline" },
        { "[e",         "<cmd>Lspsaga diagnostic_jump_prev<cr>",       desc = "Lspsaga Diagnostic jump" },
        { "]e",         "<cmd>Lspsaga diagnostic_jump_next<cr>",       desc = "Lspsaga Diagnostics jump" },
        { "<leader>Lk", "<cmd>Lspsaga hover_doc<cr>",                  desc = "Lspsaga Hover Doc" },
        { "<leader>LK", "<cmd>Lspsaga hover_doc ++keep<cr>",           desc = "Lspsaga Hover Doc (Keep)" },
        { "<leader>LI", "<cmd>Lspsaga incoming_calls<cr>",             desc = "Lspsaga Incoming Calls" },
        { "<leader>LO", "<cmd>Lspsaga outgoing_calls<cr>",             desc = "Lspsaga Outgoing Calls" },
        { "<leader>Lt", "<cmd>Lspsaga term_toggle<cr>",                desc = "Lspsaga Term Toggle" },
    },
    opts = {
        outline = {
            keys = {
                expand_or_jump = '<CR>'
            }
        }
    },
    -- config = function()
    --     require("lspsaga").setup({})
    -- end,
}
