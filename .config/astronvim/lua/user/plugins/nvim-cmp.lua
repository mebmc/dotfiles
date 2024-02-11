-- https://github.com/hrsh7th/nvim-cmp
return {
    -- override nvim-autopairs plugin
    "hrsh7th/nvim-cmp",
    dependencies = {
        "onsails/lspkind.nvim",
        "lukas-reineke/cmp-under-comparator",
        "davidsierradz/cmp-conventionalcommits",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-nvim-lsp-document-symbol",
        "hrsh7th/cmp-nvim-lsp-signature-help",
        "hrsh7th/cmp-nvim-lsp-signature-help",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/cmp-emoji",
        "hrsh7th/cmp-calc",
        -- "zbirenbaum/copilot-cmp",
        -- "jcdickinson/codeium.nvim",
        "chrisgrieser/cmp-nerdfont",
        "Saecki/crates.nvim",
        "ray-x/cmp-treesitter",
        "rafamadriz/friendly-snippets",
        "uga-rosa/cmp-dictionary",
        -- "f3fora/cmp-spell",
        -- -- Snippet Engine & its associated nvim-cmp source
        -- "L3MON4D3/LuaSnip",
        -- "saadparwaiz1/cmp_luasnip",
        "andersevenrud/cmp-tmux",
        "petertriho/cmp-git",
        "David-Kunz/cmp-npm",
        "hrsh7th/cmp-nvim-lua",
        "KadoBOT/cmp-plugins",
    },
    -- override the options table that is used in the `require("cmp").setup()` call
    opts = function(_, opts)
        -- opts parameter is the default options table
        -- the function is lazy loaded so cmp is able to be required
        local cmp = require("cmp")

        -- local has_words_before = function()
        -- 	if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
        -- 		return false
        -- 	end
        -- 	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        -- 	return col ~= 0 and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match("^%s*$") == nil
        -- end

        opts.completion = {
            keyword_length = 0,
        }

        -- fix issues with copilot-cmp
        opts.mapping = cmp.mapping.preset.insert({
            ["<CR>"] = cmp.mapping.confirm({
                -- this is the important line
                behavior = cmp.ConfirmBehavior.Replace,
                select = false,
            }),
            ["<tab>"] = vim.schedule_wrap(function(fallback)
                fallback()
            end),
            -- ["<Tab>"] = vim.schedule_wrap(function(fallback)
            -- 	if cmp.visible() and has_words_before() then
            -- 		cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
            -- 	else
            -- 		fallback()
            -- 	end
            -- end),
            ["<C-j>"] = cmp.mapping.select_next_item(),
            ["<C-k>"] = cmp.mapping.select_prev_item(),
            -- ["<CR>"] = cmp.mapping.confirm({ select = false }),
            ["<C-a>"] = cmp.mapping.complete(),
            ["<Up>"] = vim.schedule_wrap(function(fallback)
                if cmp.visible() then
                    cmp.mapping.abort();
                    fallback()
                else
                    fallback()
                end
            end),
            ["<Down>"] = vim.schedule_wrap(function(fallback)
                if cmp.visible() then
                    cmp.mapping.abort();
                    fallback()
                else
                    fallback()
                end
            end),
        })

        -- modify the sources part of the options table
        opts.sources = cmp.config.sources({
            { name = "nvim_lsp",                 priority = 1500, keyword_length = 0 },
            { name = "nvim_lsp_document_symbol", priority = 1500, keyword_length = 0 },
            { name = "nvim_lsp_signature_help",  priority = 1500, keyword_length = 0 },
            -- { name = "copilot",             priority = 1000, keyword_length = 1 },
            -- { name = "codeium",             priority = 1000, keyword_length = 1 },
            { name = "luasnip",                  priority = 750,  keyword_length = 1 },
            { name = "buffer",                   priority = 500,  keyword_length = 1 },
            { name = "nerdfont",                 priority = 300,  keyword_length = 1 },
            { name = "path",                     priority = 250,  keyword_length = 1 },
            { name = "calc",                     priority = 250,  keyword_length = 1 },
            { name = "crates",                   priority = 200,  keyword_length = 1 },
            { name = "conventionalcommits",      priority = 200,  keyword_length = 1 },
            { name = "treesitter",               priority = 200,  keyword_length = 2 },
            { name = "emoji",                    priority = 100,  keyword_length = 1 },
            { name = "dictionary",               priority = 100,  keyword_length = 1 },
            { name = "spell",                    priority = 100,  keyword_length = 3 },
            { name = "tmux",                     priority = 100,  keyword_length = 2, option = { label = '[tmux]' } },
            { name = "git",                      priority = 200,  keyword_length = 2 },
            { name = "npm",                      priority = 200,  keyword_length = 2 },
            { name = "nvim_lua",                 priority = 200,  keyword_length = 2 },
            { name = "plugins",                  priority = 200,  keyword_length = 2 },
        })

        local lspkind = require("lspkind")
        opts.formatting = {
            format = lspkind.cmp_format({
                with_text = true,
                maxwidth = 50,
                mode = "symbol_text",
                menu = {
                    copilot = "[ copilot]",
                    codeium = "[ codeium]",
                    nvim_lsp = "[ lsp]",
                    nvim_lsp_document_symbol = "[ lsp]",
                    nvim_lsp_signature_help = "[ lsp]",
                    luasnip = "[ luasnip]",
                    buffer = "[ buffer]",
                    emoji = "[ emoji]",
                    nerdfont = "[ nerdfont]",
                    path = "[ path]",
                    calc = "[ calc]",
                    crates = "[󱘗 crates]",
                    conventionalcommits = "[󰊢 cc]",
                    treesitter = "[ treesitter]",
                    dictionary = "[ dict]",
                    spell = "[󰓆 spell]",
                    tmux = "[󰓩 tmux]",
                    git = "[󰓩 git]",
                    npm = "[󰓩 npm]",
                    cmdline = "[󰓩 cmdline]",
                    nvim_lua = "[󰓩 nvim_lua]",
                    plugins = "[󰓩 plugins]",
                },
            }),
        }

        opts.sorting = {
            priority_weight = 2,
            comparators = {
                -- Below is the default comparitor list and order for nvim-cmp
                cmp.config.compare.offset,
                -- cmp.config.compare.scopes, --this is commented in nvim-cmp too
                cmp.config.compare.exact,
                -- require("copilot_cmp.comparators").prioritize,
                cmp.config.compare.score,
                require("cmp-under-comparator").under,
                cmp.config.compare.kind,
                cmp.config.compare.sort_text,
                cmp.config.compare.length,
                cmp.config.compare.order,
            },
        }

        -- `/` cmdline setup.
        cmp.setup.cmdline('/', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = 'buffer' }
            }
        })

        -- `:` cmdline setup.
        cmp.setup.cmdline(':', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = 'path' }
            }, {
                {
                    name = 'cmdline',
                    option = {
                        ignore_cmds = { 'Man', '!' }
                    }
                }
            })
        })

        -- local dict = require("cmp_dictionary")
        -- dict.switcher({
        --     filetype = {
        --         lua = "~/.config/astronvim/lua/user/spell/lua.dict",
        --         javascript = "~/.config/astronvim/lua/user/spell/js.dict",
        --     },
        --     filepath = {
        --         ["plugins/*.lua"] = "~/.config/astronvim/lua/user/spell/lua-lazy.dict",
        --     },
        --     spelllang = {
        --         en = "~/.config/astronvim/lua/user/spell/en.utf-8.dict",
        --     }
        -- })

        return opts
    end,
}



-- TODO: Merge/Delete
--
-- -- [[ Configure nvim-cmp ]]
-- -- See `:help cmp`
-- local cmp = require 'cmp'
-- local luasnip = require 'luasnip'
-- require('luasnip.loaders.from_vscode').lazy_load()
-- luasnip.config.setup {}
--
-- cmp.setup {
--   snippet = {
--     expand = function(args)
--       luasnip.lsp_expand(args.body)
--     end,
--   },
--   completion = {
--     completeopt = 'menu,menuone,noinsert',
--   },
--   mapping = cmp.mapping.preset.insert {
--     ['<C-n>'] = cmp.mapping.select_next_item(),
--     ['<C-p>'] = cmp.mapping.select_prev_item(),
--     ['<C-b>'] = cmp.mapping.scroll_docs(-4),
--     ['<C-f>'] = cmp.mapping.scroll_docs(4),
--     ['<C-Space>'] = cmp.mapping.complete {},
--     ['<CR>'] = cmp.mapping.confirm {
--       behavior = cmp.ConfirmBehavior.Replace,
--       select = true,
--     },
--     ['<Tab>'] = cmp.mapping(function(fallback)
--       if cmp.visible() then
--         cmp.select_next_item()
--       elseif luasnip.expand_or_locally_jumpable() then
--         luasnip.expand_or_jump()
--       else
--         fallback()
--       end
--     end, { 'i', 's' }),
--     ['<S-Tab>'] = cmp.mapping(function(fallback)
--       if cmp.visible() then
--         cmp.select_prev_item()
--       elseif luasnip.locally_jumpable(-1) then
--         luasnip.jump(-1)
--       else
--         fallback()
--       end
--     end, { 'i', 's' }),
--   },
--   sources = {
--     { name = 'nvim_lsp' },
--     { name = 'luasnip' },
--     { name = 'path' },
--   },
-- }
