-- https://github.com/simrat39/rust-tools.nvim
return {
	"simrat39/rust-tools.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"neovim/nvim-lspconfig",
		"mfussenegger/nvim-dap",
	},
	ft = "rust",
}
