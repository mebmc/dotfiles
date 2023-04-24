-- https://github.com/ggandor/leap.nvim
return {
    {
        "ggandor/leap.nvim",
        dependencies = {
            'tpope/vim-repeat',
        },
        lazy = false,
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
        lazy = false,
    }
}
