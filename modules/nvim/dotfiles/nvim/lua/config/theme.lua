local colors = {
    background = "#221d44",
    foreground = "#c7c6d0",
    text = "#c7c6d0",
    cursor = "#c7c6d0",
    black = "#221d44",
    red = "#D56DE5",
    green = "#7B83EA",
    yellow = "#9B95EE",
    blue = "#E793EE",
    magenta = "#C8AEF3",
    cyan = "#F2B6F2",
    white = "#c7c6d0",
    bright_black = "#6f6c84",
    bright_red = "#D56DE5",
    bright_green = "#7B83EA",
    bright_yellow = "#9B95EE",
    bright_blue = "#E793EE",
    bright_magenta = "#C8AEF3",
    bright_cyan = "#F2B6F2",
    bright_white = "#c7c6d0",
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

vim.api.nvim_set_hl(0, "netrwDir",{ fg = colors.cyan })
vim.api.nvim_set_hl(0, "netrwExe",{ fg = colors.red })
vim.api.nvim_set_hl(0, "netrwSymlink",{ fg = colors.green })
-- vim.api.nvim_set_hl(0, "",{ bg = colors., fg = colors.})
