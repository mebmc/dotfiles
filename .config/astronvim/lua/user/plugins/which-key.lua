-- https://github.com/folke/which-key.nvim
return {
    "folke/which-key.nvim",
    event = {
        "BufReadPre",
        "BufNewFile"
    },

    opts = {
        mode = "n",
        noremap = true,
        icons = {
            breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
            separator  = "➜", -- symbol used between a key and it's label
            group      = "", -- symbol prepended to a group
        },
        -- defaults = {
        --     ["<leader>f"]     = { name = "󰍉 File/Find" },
        --     ["<leader>p"]     = { name = "󰏖 Packages" },
        --     ["<leader>l"]     = { name = " LSP" },
        --     ["<leader>u"]     = { name = " UI" },
        --     ["<leader>b"]     = { name = "󰓩 Buffers" },
        --     ["<leader>bs"]    = { name = "󰒺 Sort Buffers" },
        --     ["<leader>d"]     = { name = " Debugger" },
        --     ["<leader>g"]     = { name = "󰊢 Git" },
        --     ["<leader>t"]     = { name = " Terminal" },
        --     ["<leader><tab>"] = { name = "󰫍 Tabs" },
        --     ["<leader>c"]     = { name = " Code" },
        --     ["<leader>gh"]    = { name = " Hunks" },
        --     ["<leader>q"]     = { name = "󱂬 Quit/Session" },
        --     ["<leader>s"]     = { name = " Search" },
        --     ["<leader>w"]     = { name = " Windows" },
        --     ["<leader>x"]     = { name = " Diagnostics/Quickfix" },
        --     ["<leader>k"]     = { name = " User" },
        -- }
    },
    config = function()
        -- document existing key chains
        require('which-key').register {
            ['<leader>a'] = { name = 'AI', _ = 'which_key_ignore' },
            ['<leader>ab'] = { name = 'Backseat', _ = 'which_key_ignore' },
            ['<leader>ac'] = { name = 'Cody', _ = 'which_key_ignore' },
            ['<leader>ad'] = { name = 'Codeium', _ = 'which_key_ignore' },
            ['<leader>ag'] = { name = 'Gen', _ = 'which_key_ignore' },
            ['<leader>an'] = { name = 'NeoAI', _ = 'which_key_ignore' },
            ['<leader>ap'] = { name = 'Copilot', _ = 'which_key_ignore' },
            ['<leader>at'] = { name = 'ChatGPT', _ = 'which_key_ignore' },
            ['<leader>b'] = { name = 'Buffers', _ = 'which_key_ignore' },
            ['<leader>d'] = { name = 'Document', _ = 'which_key_ignore' },
            ['<leader>f'] = { name = 'Find', _ = 'which_key_ignore' },
            ['<leader>g'] = { name = 'Git', _ = 'which_key_ignore' },
            ['<leader>h'] = { name = 'Git Hunk', _ = 'which_key_ignore' },
            ['<leader>j'] = { name = 'User', _ = 'which_key_ignore' },
            ['<leader>l'] = { name = 'Lsp', _ = 'which_key_ignore' },
            ['<leader>O'] = { name = 'Obsidian', _ = 'which_key_ignore' },
            ['<leader>p'] = { name = 'Packages', _ = 'which_key_ignore' },
            ['<leader>r'] = { name = 'Rename', _ = 'which_key_ignore' },
            ['<leader>S'] = { name = 'Session', _ = 'which_key_ignore' },
            ['<leader>s'] = { name = 'Search', _ = 'which_key_ignore' },
            ['<leader>t'] = { name = 'Terminal', _ = 'which_key_ignore' },
            ['<leader>u'] = { name = 'UI', _ = 'which_key_ignore' },
            -- ['<leader>w'] = { name = 'Workspace', _ = 'which_key_ignore' },
            ['<leader>x'] = { name = 'Quickfix', _ = 'which_key_ignore' },
        }
        -- register which-key VISUAL mode
        -- required for visual <leader>hs (hunk stage) to work
        require('which-key').register({
            ['<leader>'] = { name = 'VISUAL <leader>' },
            ['<leader>h'] = { 'Git Hunk' },
        }, { mode = 'v' })
    end,
}
