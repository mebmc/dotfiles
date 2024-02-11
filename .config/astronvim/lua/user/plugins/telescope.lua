-- https://github.com/nvim-telescope/telescope.nvim
return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            -- NOTE: If you are having trouble with this installation,
            --       refer to the README for telescope-fzf-native for more instructions.
            build = 'make',
            cond = function()
                return vim.fn.executable 'make' == 1
            end,
        },
    },
    cmd = "Telescope",
    keys = {
        { "<C-o>",           "<cmd>Telescope oldfiles<cr>",                          desc = "Previous files" },
        { "<C-p>",           "<cmd>Telescope fd<cr>",                                desc = "Local files" },
        { "<leader>?",       function() require("telescope.builtin").oldfiles() end, desc = "Find recently opened files" },
        { "<leader><space>", function() require("telescope.builtin").buffers() end,  desc = "Find existing buffers" },
        {
            "<leader>/",
            function()
                -- You can pass additional configuration to telescope to change theme, layout, etc.
                require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
                    winblend = 10,
                    previewer = false,
                })
            end,
            desc = "Fuzzily search in current buffer"
        },
        {
            "<leader>s/",
            function()
                -- See `:help telescope.builtin`
                local function telescope_live_grep_open_files()
                    require('telescope.builtin').live_grep {
                        grep_open_files = true,
                        prompt_title = 'Live Grep in Open Files',
                    }
                end
                telescope_live_grep_open_files()
            end,
            desc = "Search in Open Files"
        },
        { "<leader>ss", function() require("telescope.builtin").builtin() end,     desc = "Search Select Telescope" },
        { "<leader>gf", function() require("telescope.builtin").git_files() end,   desc = "Search Git Files" },
        { "<leader>sf", function() require("telescope.builtin").find_files() end,  desc = "Search Files" },
        { "<leader>sh", function() require("telescope.builtin").help_tags() end,   desc = "Search Help" },
        { "<leader>sw", function() require("telescope.builtin").grep_string() end, desc = "Search current Word" },
        { "<leader>sg", function() require("telescope.builtin").live_grep() end,   desc = "Search by Grep" },
        { "<leader>sG", ":LiveGrepGitRoot<cr>",                                    desc = "Search by Grep on Git Root" },
        { "<leader>sd", function() require("telescope.builtin").diagnostics() end, desc = "Search Diagnostics" },
        { "<leader>sr", function() require("telescope.builtin").resume() end,      desc = "Search Resume" },
    },
    -- vim.keymap.set('n', '<leader>s/', , { desc = '[S]earch [/] in Open Files' })
    -- vim.keymap.set('n', '<leader>ss', require('telescope.builtin').builtin, { desc = '[S]earch [S]elect Telescope' })
    -- vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
    -- vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
    -- vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
    -- vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
    -- vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
    -- vim.keymap.set('n', '<leader>sG', ':LiveGrepGitRoot<cr>', { desc = '[S]earch by [G]rep on Git Root' })
    -- vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
    -- vim.keymap.set('n', '<leader>sr', require('telescope.builtin').resume, { desc = '[S]earch [R]esume' })
    opts = function()
        local actions = require "telescope.actions"
        -- local get_icon = require("astronvim.utils").get_icon

        -- require("telescope").load_extension('fzf')
        -- Enable telescope fzf native, if installed
        pcall(require('telescope').load_extension, 'fzf')

        -- Telescope live_grep in git root
        -- Function to find the git root directory based on the current buffer's path
        local function find_git_root()
            -- Use the current buffer's path as the starting point for the git search
            local current_file = vim.api.nvim_buf_get_name(0)
            local current_dir
            local cwd = vim.fn.getcwd()
            -- If the buffer is not associated with a file, return nil
            if current_file == '' then
                current_dir = cwd
            else
                -- Extract the directory from the current file's path
                current_dir = vim.fn.fnamemodify(current_file, ':h')
            end

            -- Find the Git root directory from the current file's path
            local git_root = vim.fn.systemlist('git -C ' ..
                vim.fn.escape(current_dir, ' ') .. ' rev-parse --show-toplevel')[1]
            if vim.v.shell_error ~= 0 then
                print 'Not a git repository. Searching on current working directory'
                return cwd
            end
            return git_root
        end

        -- Custom live_grep function to search in git root
        local function live_grep_git_root()
            local git_root = find_git_root()
            if git_root then
                require('telescope.builtin').live_grep {
                    search_dirs = { git_root },
                }
            end
        end

        vim.api.nvim_create_user_command('LiveGrepGitRoot', live_grep_git_root, {})

        return {
            defaults = {
                git_worktrees = vim.g.git_worktrees,
                prompt_prefix = "> ",
                selection_caret = "> ",
                path_display = { "truncate" },
                sorting_strategy = "ascending",
                layout_config = {
                    horizontal = { prompt_position = "top", preview_width = 0.55 },
                    vertical = { mirror = false },
                    width = 0.87,
                    height = 0.80,
                    preview_cutoff = 120,
                },
                mappings = {
                    i = {
                        ["<C-n>"] = actions.cycle_history_next,
                        ["<C-p>"] = actions.cycle_history_prev,
                        ["<C-j>"] = actions.move_selection_next,
                        ["<C-k>"] = actions.move_selection_previous,
                    },
                    n = {
                        ["<C-j>"] = actions.move_selection_next,
                        ["<C-k>"] = actions.move_selection_previous,
                        q = actions.close
                    },
                },
                pickers = {
                    find_files = {
                        find_command = { "fd", "--type", "f", "--strip-cwd-prefix" }
                    },
                },
                extensions = {
                    fzf = {
                        fuzzy = true,                   -- false will only do exact matching
                        override_generic_sorter = true, -- override the generic sorter
                        override_file_sorter = true,    -- override the file sorter
                        case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
                        -- the default case_mode is "smart_case"
                    }
                }
            },
        }
    end,
}
