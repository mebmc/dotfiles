-- https://github.com/lewis6991/gitsigns.nvim
return {
    "lewis6991/gitsigns.nvim",
    event = "VeryLazy",
    opts = {
        signs                        = {
            add          = { text = '│' },
            change       = { text = '│' },
            delete       = { text = '_' },
            topdelete    = { text = '‾' },
            changedelete = { text = '~' },
            untracked    = { text = '┆' },
            --       add = { text = '+' },
            --       change = { text = '~' },
            --       delete = { text = '_' },
            --       topdelete = { text = '‾' },
            --       changedelete = { text = '~' },
        },
        signcolumn                   = true,  -- Toggle with `:Gitsigns toggle_signs`
        numhl                        = false, -- Toggle with `:Gitsigns toggle_numhl`
        linehl                       = false, -- Toggle with `:Gitsigns toggle_linehl`
        word_diff                    = false, -- Toggle with `:Gitsigns toggle_word_diff`
        watch_gitdir                 = {
            interval = 1000,
            follow_files = true
        },
        attach_to_untracked          = true,
        current_line_blame           = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
        current_line_blame_opts      = {
            virt_text = true,
            virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
            delay = 1000,
            ignore_whitespace = false,
        },
        current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
        sign_priority                = 6,
        update_debounce              = 100,
        status_formatter             = nil,   -- Use default
        max_file_length              = 40000, -- Disable if file is longer than this (in lines)
        preview_config               = {
            -- Options passed to nvim_open_win
            border = 'single',
            style = 'minimal',
            relative = 'cursor',
            row = 0,
            col = 1
        },
        yadm                         = {
            enable = true
        },
        on_attach                    = function(bufnr)
            local gs = package.loaded.gitsigns

            local function map(mode, l, r, opts)
                opts = opts or {}
                opts.buffer = bufnr
                vim.keymap.set(mode, l, r, opts)
            end

            -- Navigation
            map({ 'n', 'v' }, ']c', function()
                if vim.wo.diff then
                    return ']c'
                end
                vim.schedule(function()
                    gs.next_hunk()
                end)
                return '<Ignore>'
            end, { expr = true, desc = 'Jump to next hunk' })

            map({ 'n', 'v' }, '[c', function()
                if vim.wo.diff then
                    return '[c'
                end
                vim.schedule(function()
                    gs.prev_hunk()
                end)
                return '<Ignore>'
            end, { expr = true, desc = 'Jump to previous hunk' })

            -- Actions
            -- visual mode
            -- map('v', '<leader>hs', function()
            --     gs.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
            -- end, { desc = 'stage git hunk' })
            -- map('v', '<leader>hr', function()
            --     gs.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
            -- end, { desc = 'reset git hunk' })
            -- normal mode
            -- map('n', '<leader>hs', gs.stage_hunk, { desc = 'git stage hunk' })
            -- map('n', '<leader>hr', gs.reset_hunk, { desc = 'git reset hunk' })
            -- map('n', '<leader>hS', gs.stage_buffer, { desc = 'git Stage buffer' })
            -- map('n', '<leader>hu', gs.undo_stage_hunk, { desc = 'undo stage hunk' })
            -- map('n', '<leader>hR', gs.reset_buffer, { desc = 'git Reset buffer' })
            -- map('n', '<leader>hp', gs.preview_hunk, { desc = 'preview git hunk' })
            -- map('n', '<leader>hb', function()
            --     gs.blame_line { full = false }
            -- end, { desc = 'git blame line' })
            -- map('n', '<leader>hd', gs.diffthis, { desc = 'git diff against index' })
            -- map('n', '<leader>hD', function()
            --     gs.diffthis '~'
            -- end, { desc = 'git diff against last commit' })

            -- Toggles
            -- map('n', '<leader>tb', gs.toggle_current_line_blame, { desc = 'toggle git blame line' })
            -- map('n', '<leader>td', gs.toggle_deleted, { desc = 'toggle git show deleted' })

            -- Text object
            map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>', { desc = 'select git hunk' })
        end,
    },
    keys = {
        { "<leader>hs", function() require("gitsigns").stage_hunk { vim.fn.line '.', vim.fn.line 'v' } end, mode = "v", desc = "git stage hunk" },
        { "<leader>hr", function() require("gitsigns").reset_hunk { vim.fn.line '.', vim.fn.line 'v' } end, mode = "v", desc = "git reset hunk" },
        { "<leader>hs", function() require("gitsigns").stage_hunk() end, mode = "n", desc = "git stage hunk" },
        { "<leader>hr", function() require("gitsigns").reset_hunk() end, mode = "n", desc = "git reset hunk" },
        { "<leader>hS", function() require("gitsigns").stage_buffer() end, mode = "n", desc = "git stage buffer" },
        { "<leader>hu", function() require("gitsigns").undo_stage_hunk() end, mode = "n", desc = "git undo stage hunk" },
        { "<leader>hR", function() require("gitsigns").reset_buffer() end, mode = "n", desc = "git reset buffer" },
        { "<leader>hp", function() require("gitsigns").preview_hunk() end, mode = "n", desc = "git preview buffer" },
        { "<leader>hb", function() require("gitsigns").blame_line({ full = false }) end, mode = "n", desc = "git blame line" },
        { "<leader>hd", function() require("gitsigns").diffthis() end, mode = "n", desc = "git diff against index" },
        { "<leader>hD", function() require("gitsigns").diffthis('~') end, mode = "n", desc = "git diff against last commit" },
        { "<leader>ub", function() require("gitsigns").toggle_current_line_blame() end, mode = "n", desc = "git toggle blame line" },
        { "<leader>ud", function() require("gitsigns").toggle_deleted() end, mode = "n", desc = "git toggle show deleted" },
    },
}
