return {
    opt = {
        -- set to true or false etc.
        relativenumber = true, -- sets vim.opt.relativenumber
        number         = true, -- sets vim.opt.number
        spell          = true, -- sets vim.opt.spell
        -- spellfile      = vim.fn.expand "~/.config/astronvim/lua/user/spell/en.utf-8.add",
        -- dictionary     = {
        --     "~/.config/astronvim/lua/user/spell/en.utf-8.dict",
        -- },
        signcolumn     = "yes", -- sets vim.opt.signcolumn to auto
        wrap           = false, -- sets vim.opt.wrap
        list           = true,  -- show whitespace characters
        clipboard      = "",    -- not using 'unnammedplus'
        conceallevel   = 2
    },
    g = {
        mapleader                  = " ",  -- sets vim.g.mapleader
        autoformat_enabled         = true, -- enable or disable auto formatting at start (lsp.formatting.format_on_save needed)
        cmp_enabled                = true, -- enable completion at start
        autopairs_enabled          = true, -- enable autopairs at start
        diagnostics_enabled        = true, -- enable diagnostics at start
        status_diagnostics_enabled = true, -- enable diagnostics in statusline
        icons_enabled              = true, -- disable icons in the UI (disable if no nerd font is available)
        ui_notifications_enabled   = true, -- disable notifications when toggling UI elements
        heirline_bufferline        = true  -- enable new heirline based bufferline (requires :PackerSync after changing)
    }
}
