-- https://github.com/ThePrimeagen/harpoon
return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    event = {
        "BufReadPre",
        "BufNewFile"
    },
    config = function()
        local harpoon = require("harpoon")
        harpoon:setup()

        vim.keymap.set("n", ";l", function() harpoon:list():append() end, { desc = "Add mark" })
        vim.keymap.set("n", ";f", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Menu" })
        vim.keymap.set("n", ";1", function() harpoon:list():select(1) end, { desc = "Jump to 1" })
        vim.keymap.set("n", ";2", function() harpoon:list():select(2) end, { desc = "Jump to 2" })
        vim.keymap.set("n", ";3", function() harpoon:list():select(3) end, { desc = "Jump to 3" })
        vim.keymap.set("n", ";4", function() harpoon:list():select(4) end, { desc = "Jump to 4" })
        vim.keymap.set("n", ";5", function() harpoon:list():select(5) end, { desc = "Jump to 5" })
        vim.keymap.set("n", ";6", function() harpoon:list():select(6) end, { desc = "Jump to 6" })
        vim.keymap.set("n", ";7", function() harpoon:list():select(7) end, { desc = "Jump to 7" })
        vim.keymap.set("n", ";8", function() harpoon:list():select(8) end, { desc = "Jump to 8" })

        -- Toggle previous & next buffers stored within Harpoon list
        vim.keymap.set("n", ";j", function() harpoon:list():prev() end, { desc = "Next mark" })
        vim.keymap.set("n", ";k", function() harpoon:list():next() end, { desc = "Previous mark" })
    end
}
