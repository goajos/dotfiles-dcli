if vim.g.vscode then
    require("config.vscode_options")
else
    require("config.autocmds")
    require("config.fzf")
    require("config.globals")
    require("config.keymaps")
    require("config.lsp")
    require("config.options")
    require("config.theme")
    require("config.treesitter")
end
