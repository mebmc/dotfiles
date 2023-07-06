return {
    -- control auto formatting on save
    format_on_save = {
        enabled = true,     -- enable or disable format on save globally
        allow_filetypes = { -- enable format on save for specified filetypes only
            "go",
            "rust",
            "lua",
            "python",
            "yaml"
        },
        ignore_filetypes = { -- disable format on save for specified filetypes
            "javascript",
        },
    },
    disabled = { -- disable formatting capabilities for the listed language servers
        "tsserver"
    },
    timeout_ms = 2000,        -- default format timeout
    filter = function(client) -- fully override the default formatting function
        print(client.name)
        --     if vim.bo.filetype == "javascript" then
        --         return client.name == "null-ls"
        --     end
        --
        -- enable all other clients
        return true
    end
}
