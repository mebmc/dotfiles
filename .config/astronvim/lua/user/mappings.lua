-- local utils = require "user.utils"
-- local astronvim = require "astronvim"
local astro_utils = require("astronvim.utils")

return {
	n = {
		["<C-o>"] = { "<cmd>Telescope oldfiles<cr>", desc = "Previous files" },
		["<C-p>"] = { "<cmd>Telescope fd<cr>", desc = "Local files" },
		-- second key is the lefthand side of the map
		["<D-/>"] = function() require("Comment.api").toggle.linewise.count(vim.v.count > 0 and vim.v.count or 1) end,
		["<C-/>"] = function() require("Comment.api").toggle.linewise.count(vim.v.count > 0 and vim.v.count or 1) end,
		-- mappings seen under group name "Buffer"
		["<leader>bb"] = { "<cmd>tabnew<cr>", desc = "New tab" },
		["<leader>bc"] = {
			"<cmd>BufferLinePickClose<cr>",
			desc = "Pick to close",
		},
		["<leader>bj"] = { "<cmd>BufferLinePick<cr>", desc = "Pick to jump" },
		["<leader>bt"] = {
			"<cmd>BufferLineSortByTabs<cr>",
			desc = "Sort by tabs",
		},
		-- quick save
		-- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
		["<leader>fA"] = {
			function()
				local cwd = vim.fn.stdpath("config") .. "/.."
				local search_dirs = {
					"$HOME/.config/",
					"$HOME/.ssh/",
					"$HOME/.zimrc",
					"$HOME/.p10k.zsh",
					"$HOME/.gitconfig",
					"$HOME/.gitignore",
				}
				-- search all supported config locations
				for _, dir in ipairs(astronvim.supported_configs) do
					-- don't search the astronvim core files
					if dir == astronvim.install.home then
						dir = dir .. "/lua/user"
					end
					-- add directory to search if exists
					if vim.fn.isdirectory(dir) == 1 then
						table.insert(search_dirs, dir)
					end
				end
				-- if no config folders found, show warning
				if vim.tbl_isempty(search_dirs) then
					astro_utils.notify("No user configuration files found", vim.log.levels.WARN)
				else
					if #search_dirs == 1 then
						cwd = search_dirs[1]
					end -- if only one directory, focus cwd
					require("telescope.builtin").find_files({
						prompt_title = "Config Files",
						search_dirs = search_dirs,
						cwd = cwd,
					}) -- call telescope
				end
			end,
			desc = "Find all config files",
		},
		["<leader>L"] = { name = "󰑷 Lspsaga" },
		["<leader>j"] = { name = " User" },
		["<leader>jt"] = { "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Trouble Document" },
		["<leader>jT"] = { "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Trouble Workspace" },
		["<leader>j2"] = {
			"<cmd>set autoindent expandtab tabstop=2 shiftwidth=2<cr>",
			desc = "Tab size 2",
		},
		["<leader>j4"] = {
			"<cmd>set autoindent expandtab tabstop=4 shiftwidth=4<cr>",
			desc = "Tab size 4",
		},
		["<leader>jz"] = { "<cmd>Twilight<cr>", desc = "Toggle Twilight" },
		["<leader>jZ"] = { "<cmd>ZenMode<cr>", desc = "Toggle Zen Mode" },
		["[Q"] = { "<cmd>cfirst<cr>", desc = "First Quick list" },
		["[q"] = { "<cmd>cprev<cr>", desc = "Previous Quick list" },
		["]q"] = { "<cmd>cnext<cr>", desc = "Next Quick list" },
		["]Q"] = { "<cmd>clast<cr>", desc = "Last Quick list" },
		["[L"] = { "<cmd>lfirst<cr>", desc = "First Location list" },
		["[l"] = { "<cmd>lprev<cr>", desc = "Previous Location list" },
		["]l"] = { "<cmd>lnext<cr>", desc = "Next Location list" },
		["]L"] = { "<cmd>llast<cr>", desc = "Last Location list" },
		["<leader>x"] = { name = " Diagnostics/Quickfix" },
		["<leader>xl"] = { "<cmd>lopen<cr>", desc = "Location List" },
		["<leader>xq"] = { "<cmd>copen<cr>", desc = "Quickfix List" },
		["<leader>a"] = { name = "󱜚 AI" },
		["<leader>ag"] = { "<cmd>ChatGPT<cr>", desc = " ChatGPT" },
		["<leader>aG"] = { "<cmd>ChatGPTActAs<cr>", desc = " ChatGPT ActAs" },
		["<leader>ae"] = { "<cmd>ChatGPTEditWithInstructions<cr>", desc = " ChatGPT EditWith" },
		["<leader>aE"] = { "<cmd>ChatGPTCompleteCode<cr>", desc = " ChatGPT Complete" },
		["<leader>ac"] = {
			function()
				require("copilot.suggestion").toggle_auto_trigger()
			end,
			desc = " Copilot Auto Trigger",
		},
	},
	t = {
		-- setting a mapping to false will disable it
		-- ["<esc>"] = false,
	},
}
