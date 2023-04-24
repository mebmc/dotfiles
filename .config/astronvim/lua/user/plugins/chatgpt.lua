-- https://github.com/jackMort/ChatGPT.nvim
return {
	"jackMort/ChatGPT.nvim",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
	},
	cmd = {
		"ChatGPT",
		"ChatGPTActAs",
		"ChatGPTCompleteCode",
		"ChatGPTEditWithInstructions",
		"ChatGPTRun",
		"ChatGPTRunCustomCode",
	},
	opts = {
		keymaps = {
			close = { "<C-c>" },
			submit = "<cr>",
			yank_last = "<M-y>",
			yank_last_code = "<M-k>",
			scroll_up = "<M-u>",
			scroll_down = "<M-d>",
			toggle_settings = "<M-o>",
			new_session = "<M-n>",
			cycle_windows = "<Tab>",
			-- in the Sessions pane
			select_session = "<Space>",
			rename_session = "r",
			delete_session = "d",
		},
	},
}
