-- https://github.com/LuaLS/lua-language-server
return {
    settings = {
        Lua = {
            telemetry = {
                enable = false
            },
            runtime = {
                version = "LuaJIT"
            },
            diagnostics = {
                globals = {
                    "vim",
                    "astronvim",
                    "astronvim_installation",
                    "packer_plugins",
                    "bit"
                }
            },
            workspace = {
                library = {
                    vim.fn.expand "$VIMRUNTIME/lua",
                    astronvim.install.home .. "/lua",
                    astronvim.install.config .. "/lua"
                }
            },
            hint = {
                enable = true
            },
            format = {
                enable = true,
                defaultConfig = {
                    indent_style = "space",
                    indent_size = 4,
                }
            }
        }
    }
}
