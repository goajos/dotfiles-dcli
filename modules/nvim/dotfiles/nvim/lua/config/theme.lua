-- vim.pack.del { "https://github.com/projekt0n/github-nvim-theme" }
local colors = {
    background = "#110d20",
    foreground = "#c3c2c7",
    text = "#c3c2c7",
    cursor = "#c3c2c7",
    black = "#110d20",
    red = "#452f89",
    green = "#603390",
    yellow = "#68419a",
    blue = "#5a5dae",
    magenta = "#9d51ab",
    cyan = "#7a72b3",
    white = "#92909b",
    bright_black = "#615d71",
    bright_red = "#5c3fb7",
    bright_green = "#8145c1",
    bright_yellow = "#8b57ce",
    bright_blue = "#787de9",
    bright_magenta = "#d26ce5",
    bright_cyan = "#a399ef",
    bright_white = "#c3c2c7",
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
