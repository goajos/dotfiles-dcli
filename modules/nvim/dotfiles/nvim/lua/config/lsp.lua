vim.pack.add { "https://github.com/neovim/nvim-lspconfig" }

vim.lsp.enable("clangd")
vim.lsp.enable("lua_ls")
vim.lsp.config("roslyn_ls", {
    cmd = {
        "dotnet",
        "/home/jappe/Documents/roslyn_ls/lib/net10.0/Microsoft.CodeAnalysis.LanguageServer.dll",
        "--logLevel", -- this property is required by the server
        "Information",
        "--extensionLogDirectory", -- this property is required by the server
        vim.fs.joinpath(vim.uv.os_tmpdir(), 'roslyn_ls/logs'),
        "--stdio",
    }
})
vim.lsp.enable("roslyn_ls")
vim.lsp.enable("ts_ls")
vim.lsp.enable("ty")
vim.lsp.inlay_hint.enable(true) -- inlay parameter hints
