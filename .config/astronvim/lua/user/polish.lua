--     -- This function is run last and is a good place to configuring
--     -- augroups/autocommands and custom filetypes also this just pure lua so
--     -- anything that doesn't fit in the normal config locations above can go here
return function()
    local aug = vim.api.nvim_create_augroup("buf_large", { clear = true })

    vim.api.nvim_create_autocmd({ "BufReadPre" }, {
        callback = function()
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf()))
            if ok and stats and (stats.size > 1000000) then
                vim.b.large_buf = true
                vim.cmd("syntax off")
                vim.cmd("IlluminatePauseBuf") -- disable vim-illuminate
                vim.cmd("IndentBlanklineDisable") -- disable indent-blankline.nvim
                vim.opt_local.foldmethod = "manual"
                vim.opt_local.spell = false
            else
                vim.b.large_buf = false
            end
        end,
        group = aug,
        pattern = "*",
    })

    local function yaml_ft(path, bufnr)
        -- get content of buffer as string
        local content = vim.filetype.getlines(bufnr)
        if type(content) == "table" then
            content = table.concat(content, "\n")
        end

        -- check if file is in roles, tasks, or handlers folder
        local path_regex = vim.regex "(tasks\\|roles\\|handlers)/"
        if path_regex and path_regex:match_str(path) then
            return "yaml.ansible"
        end
        -- check for known ansible playbook text and if found, return yaml.ansible
        local regex = vim.regex "hosts:\\|tasks:"
        if regex and regex:match_str(content) then
            return "yaml.ansible"
        end

        -- return yaml if nothing else
        return "yaml"
    end

    vim.filetype.add {
        extension = {
            yml = yaml_ft,
            yaml = yaml_ft,
            kdl = "kdl"
        }
    }

    vim.g.neovide_transparency = 0.9

    require "user.autocmds"
end
