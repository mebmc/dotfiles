-- https://github.com/christoomey/vim-tmux-navigator
return {
    "christoomey/vim-tmux-navigator",
    cmd = {
        "TmuxNavigateLeft",
        "TmuxNavigateDown",
        "TmuxNavigateUp",
        "TmuxNavigateRight",
        "TmuxNavigatePrevious",
    },
    keys = {
        { "<M-h>",  "<cmd>TmuxNavigateLeft<cr>" },
        { "<M-j>",  "<cmd>TmuxNavigateDown<cr>" },
        { "<M-k>",  "<cmd>TmuxNavigateUp<cr>" },
        { "<M-l>",  "<cmd>TmuxNavigateRight<cr>" },
        { "<M-\\>", "<cmd>TmuxNavigatePrevious<cr>" },
    },
    -- init = function()
    --     vim.g.tmux_navigator_no_mappings = 1
    -- end
    setup = function()
        vim.g.tmux_navigator_no_mappings = 1
        vim.g.tmux_navigator_disable_when_zoomed = 1
    end
    -- opts = {
    --     tmux_navigator_no_mappings = 1
    -- },
}
