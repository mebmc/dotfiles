-- https://git.sr.ht/~whynothugo/lsp_lines.nvim
--
-- Disable the plugin in Lazy.nvim
vim.api.nvim_create_autocmd("FileType", {
    pattern = "lazy",
    callback = function()
        local previous = not require("lsp_lines").toggle()
        if not previous then require("lsp_lines").toggle() end
    end
})

return {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    event = "LspAttach",
    config = function()
        require("lsp_lines").setup()

        -- require("lsp_lines").toggle() -- Comment to disable on startup
        local previously = not require("lsp_lines").toggle()

        local group = vim.api.nvim_create_augroup("LspLinesToggleInsert", { clear = false })
        vim.api.nvim_create_autocmd("InsertEnter", {
            group = group,
            callback = function()
                previously = not require("lsp_lines").toggle()
                if not previously then
                    require("lsp_lines").toggle()
                end
            end,
        })

        vim.api.nvim_create_autocmd("InsertLeave", {
            group = group,
            callback = function()
                if require("lsp_lines").toggle() ~= previously then
                    require("lsp_lines").toggle()
                end
            end,
        })
    end,
}
