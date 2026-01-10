local colors = {
    background = "#1e252a",
    foreground = "#c6c8c9",
    text = "#c6c8c9",
    cursor = "#c6c8c9",
    black = "#1e252a",
    red = "#A89EB6",
    green = "#F8959C",
    yellow = "#FE94A0",
    blue = "#FEAEA2",
    magenta = "#FCDBAC",
    cyan = "#ACAFDF",
    white = "#c6c8c9",
    bright_black = "#64727b",
    bright_red = "#A89EB6",
    bright_green = "#F8959C",
    bright_yellow = "#FE94A0",
    bright_blue = "#FEAEA2",
    bright_magenta = "#FCDBAC",
    bright_cyan = "#ACAFDF",
    bright_white = "#c6c8c9",
}

-- terminal background comes through
vim.api.nvim_set_hl(0, "Normal", { bg = "NONE", fg = colors.foreground })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE", fg = colors.foreground })
vim.api.nvim_set_hl(0, "EndOfbuffer", { bg = "NONE", fg = colors.foreground })

vim.api.nvim_set_hl(0, "Error",{ bg = "NONE", fg = colors.red})
vim.api.nvim_set_hl(0, "Todo",{ bg = "NONE", fg = colors.red})
vim.api.nvim_set_hl(0, "PreProc",{ fg = colors.green})
vim.api.nvim_set_hl(0, "Special",{ fg = colors.green})
vim.api.nvim_set_hl(0, "Function",{ fg = colors.yellow})
vim.api.nvim_set_hl(0, "Identifier",{ fg = colors.cyan})
vim.api.nvim_set_hl(0, "Type",{ fg = colors.cyan})
vim.api.nvim_set_hl(0, "Statement",{ fg = colors.blue})
vim.api.nvim_set_hl(0, "Constant",{ fg = colors.magenta})

vim.api.nvim_set_hl(0, "ColorColumn",{ bg = colors.bright_black })
vim.api.nvim_set_hl(0, "CursorColumn",{ bg = colors.bright_black })
vim.api.nvim_set_hl(0, "CursorLine",{ bg = colors.bright_black })
vim.api.nvim_set_hl(0, "Comment",{ fg = colors.bright_red })
vim.api.nvim_set_hl(0, "Cursor",{ bg = "NONE", fg = colors.cursor })
vim.api.nvim_set_hl(0, "CursorLineNr",{ bg = "NONE", fg = colors.cursor, bold = true })
vim.api.nvim_set_hl(0, "Delimiter",{ fg = colors.cursor })

-- vim.api.nvim_set_hl(0, "",{ bg = colors., fg = colors.})
