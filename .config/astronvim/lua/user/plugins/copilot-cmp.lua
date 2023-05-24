-- https://github.com/zbirenbaum/copilot-cmp
return {
	"zbirenbaum/copilot-cmp",
	dependencies = {
		"copilot.lua"
	},
	config = function(_, opts)
		local copilot_cmp = require("copilot_cmp")

		opts = {
			formatters = {
				label       = require("copilot_cmp.format").format_label_text,
				insert_text = require("copilot_cmp.format").remove_existing,
				preview     = require("copilot_cmp.format").deindent,
			},
		}

		copilot_cmp.setup(opts)

		local function on_attach(on_attach)
			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(args)
					local buffer = args.buf
					local client = vim.lsp.get_client_by_id(args.data.client_id)
					on_attach(client, buffer)
				end,
			})
		end

		-- attach cmp source whenever copilot attaches
		-- fixes lazy-loading issues with the copilot cmp source
		on_attach(function(client)
			if client.name == "copilot" then
				copilot_cmp._on_insert_enter()
			end
		end)
	end,
}
