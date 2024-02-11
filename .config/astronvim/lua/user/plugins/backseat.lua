-- https://github.com/james1236/backseat.nvim
return {
    "james1236/backseat.nvim",
    cmd = {
        "Backseat",
        "BackseatAsk",
        "BackseatClear",
        "BackseatClearLine",
    },
    keys = {
        { "<leader>abb", "<cmd>Backseat<cr>", desc = "󱙺 Backseat" },
        { "<leader>abB", "<cmd>BackseatAsk<cr>", desc = "󱙺 Backseat Ask" },
    },
    opts = {
        openai_model_id = 'gpt-3.5-turbo', --gpt-4 (If you do not have access to a model, it says "The model does not exist")
        language = 'english',              -- Such as 'japanese', 'french', 'pirate', 'LOLCAT'
        split_threshold = 100,
        -- additional_instruction = "Respond snarkily", -- (GPT-3 will probably deny this request, but GPT-4 complies)
        highlight = {
            icon = '', -- ''
            group = 'Comment',
        }
    }
}
