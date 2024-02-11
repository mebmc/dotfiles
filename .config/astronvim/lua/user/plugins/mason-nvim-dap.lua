-- https://github.com/jay-babu/mason-nvim-dap.nvim
return {
    "jay-babu/mason-nvim-dap.nvim",
    dependencies = {
        "williamboman/mason.nvim",
        "mfussenegger/nvim-dap",
    },
    events = {
        "VeryLazy",
    },
    opts = {
        automatic_installation = true,
        ensure_installed = {
            "bash",
            "cppdbg",
            "delve",
            "php",
            "python"
        },
        -- automatic_setup = true,
        automatic_setup = true,
        -- handlers = {
        --   php = function(source_name)
        --     local dap = require "dap"
        --     dap.adapters.python = {
        --
        --     }
        --
        --     dap.configurations.php = {
        --       {
        --         type = "php",
        --         request = "launch",
        --         name = "Listen for Xdebug",
        --         port = 9003
        --       }
        --     }
        --   end
        -- }
    }
    -- config = function(_, opts)
    --     local mason_nvim_dap = require "mason-nvim-dap"
    --     mason_nvim_dap.setup(opts) -- run setup
    --     -- do more configuration as needed
    --     mason_nvim_dap.setup_handlers {
    --         python = function(_)
    --             local dap = require "dap"
    --             dap.adapters.python = {
    --                 type = "executable",
    --                 command = "/usr/bin/python3",
    --                 args = {
    --                     "-m",
    --                     "debugpy.adapter",
    --                 },
    --             }
    --
    --             dap.configurations.python = {
    --                 {
    --                     type = "python",
    --                     request = "launch",
    --                     name = "Launch file",
    --                     program = "${file}", -- This configuration will launch the current file if used.
    --                 },
    --             }
    --         end,
    --     }
    -- end,
}
