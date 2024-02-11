-- https://github.com/ggandor/leap.nvim
return {
    {
        "ggandor/leap.nvim",
        dependencies = {
            'tpope/vim-repeat',
        },
        event = {
            "BufReadPre",
            "BufNewFile"
        },
        config = function(_)
            require('leap').add_default_mappings()
        end,
        opts = {},
    },
    {
        "ggandor/flit.nvim",
        dependencies = {
            "ggandor/leap.nvim",
        },
        event = {
            "BufReadPre",
            "BufNewFile"
        },
    }
}
