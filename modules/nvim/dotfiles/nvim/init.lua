if vim.g.vscode then
    require("config.vscode_options")
else
    require("config.autocmds")
    require("config.globals")
    require("config.keymaps")
    require("config.options")
    require("config.theme")
    require("config.usercmds")

    require("plugins.cmdline")
    -- require("plugins.fzf")
    require("plugins.lsp")
    require("plugins.treesitter")
end
