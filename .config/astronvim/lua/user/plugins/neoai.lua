-- https://github.com/Bryley/neoai.nvim
return {
    "Bryley/neoai.nvim",
    dependencies = {
        "MunifTanjim/nui.nvim",
    },
    cmd = {
        "NeoAI",
        "NeoAIOpen",
        "NeoAIClose",
        "NeoAIToggle",
        "NeoAIContext",
        "NeoAIContextOpen",
        "NeoAIContextClose",
        "NeoAIInject",
        "NeoAIInjectCode",
        "NeoAIInjectContext",
        "NeoAIInjectContextCode",
    },
    keys = {
        { "<leader>ans", desc = "󱙺 Summarize text" },
        { "<leader>anm", desc = "󱙺 Generate git message" },
    },
    config = function()
        require("neoai").setup({
            -- Options go here
        })
    end,
}
