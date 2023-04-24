-- https://github.com/hrsh7th/nvim-cmp
return {
	-- override nvim-autopairs plugin
	"hrsh7th/nvim-cmp",
	dependencies = {
		"onsails/lspkind.nvim",
		"lukas-reineke/cmp-under-comparator",
		"davidsierradz/cmp-conventionalcommits",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-emoji",
		"hrsh7th/cmp-calc",
		"zbirenbaum/copilot-cmp",
		"chrisgrieser/cmp-nerdfont",
		"Saecki/crates.nvim",
		"ray-x/cmp-treesitter",
		"uga-rosa/cmp-dictionary",
		"f3fora/cmp-spell",
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
			["<c-j>"] = cmp.mapping.select_next_item(),
			["<c-k>"] = cmp.mapping.select_prev_item(),
			-- ["<CR>"] = cmp.mapping.confirm({ select = false }),
			["<Up>"] = cmp.mapping.abort(),
			["<Down>"] = cmp.mapping.abort(),
		})

		-- modify the sources part of the options table
		opts.sources = cmp.config.sources({
			{ name = "copilot", priority = 1500, keyword_length = 1 },
			{ name = "nvim_lsp", priority = 1000, keyword_length = 1 },
			{ name = "luasnip", priority = 750, keyword_length = 1 },
			{ name = "buffer", priority = 500, keyword_length = 1 },
			{ name = "emoji", priority = 300, keyword_length = 1 },
			{ name = "nerdfont", priority = 300, keyword_length = 1 },
			{ name = "path", priority = 250, keyword_length = 1 },
			{ name = "calc", priority = 250, keyword_length = 1 },
			{ name = "crates", priority = 200, keyword_length = 1 },
			{ name = "conventionalcommits", priority = 200, keyword_length = 1 },
			{ name = "treesitter", priority = 200, keyword_length = 2 },
			{ name = "dictionary", priority = 100, keyword_length = 1 },
			{ name = "spell", priority = 100, keyword_length = 3 },
		})

		local lspkind = require("lspkind")
		opts.formatting = {
			format = lspkind.cmp_format({
				with_text = true,
				maxwidth = 50,
				mode = "symbol_text",
				menu = {
					copilot = "[ copilot]",
					nvim_lsp = "[ lsp]",
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
				require("copilot_cmp.comparators").prioritize,
				cmp.config.compare.score,
				require("cmp-under-comparator").under,
				cmp.config.compare.kind,
				cmp.config.compare.sort_text,
				cmp.config.compare.length,
				cmp.config.compare.order,
			},
		}

		local dict = require("cmp_dictionary")
		dict.setup({
			-- The following are default values.
			exact = 2,
			first_case_insensitive = false,
			document = false,
			document_command = "wn %s -over",
			async = false,
			max_items = 1000,
			capacity = 5,
			debug = false,
		})

		dict.switcher({
			-- filetype = {
			--     lua = "spell/lua.dict",
			--     javascript = { "spell/js.dict", "/path/to/js2.dict" },
			-- },
			filepath = {
				["*"] = { "../spell/en.utf-8.dict" },
			},
			spelllang = {
				en = "../spell/en.utf-8.dict",
			},
		})

		-- return the new table to be used
		return opts
	end,
}
