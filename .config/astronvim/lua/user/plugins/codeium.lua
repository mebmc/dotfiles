-- https://github.com/jcdickinson/codeium.nvim
return {
    "jcdickinson/codeium.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "hrsh7th/nvim-cmp",
    },
    cmd = "Codeium",
    build = ":Codeium auth",

    config = function()
        require("codeium").setup({
        })
    end
}
