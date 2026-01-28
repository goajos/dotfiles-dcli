vim.pack.add { "https://github.com/neovim/nvim-lspconfig" }

vim.lsp.enable("clangd")
vim.lsp.config("clangd", {
    init_options = {
        fallbackFlags = { "--std=c23" }
    }
})
vim.lsp.enable("lua_ls")
vim.lsp.enable("rust_analyzer")
vim.lsp.enable("ts_ls")
vim.lsp.enable("ty")
-- vim.lsp.inlay_hint.enable(true) -- inlay parameter hints
