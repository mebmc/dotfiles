--
return {
    "nvim-neo-tree/neo-tree.nvim",
    keys = {
        { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "Focus explorer" },
        { "<leader>o", "<cmd>Neotree focus<cr>",  desc = "Toggle explorer" },
    },
    opts = {
        close_if_last_window = true,
        filesystem = {
            filtered_items = {
                visible = true
            },
            follow_current_file = {
                enabled = true,
                leave_dirs_open = true,
            }
        },
        use_libuv_file_watcher = true,
    }
}
