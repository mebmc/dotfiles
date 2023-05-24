-- https://github.com/dhruvmanila/browser-bookmarks.nvim
return {
    "dhruvmanila/browser-bookmarks.nvim",
    dependencies = {
        -- "kkharji/sqlite.lua", -- Only if your selected browser is Firefox, Waterfox or buku
        "nvim-telescope/telescope.nvim"
    },
    cmd = {
        "BrowserBookmarks"
    },
    keys = {
        { "<leader>fB", "<cmd>Telescope bookmarks<cr>", desc = "  Bookmarks" },
    },
    opts = {
        selected_browser = 'brave'
    },
    config = function()
        require('telescope').load_extension('bookmarks')
    end
}
