-- vim.pack.del { "" }
vim.pack.add { "https://github.com/rose-pine/neovim" }
require("rose-pine").setup({})
vim.cmd("colorscheme rose-pine")

local colors = {
    background = "#191724",
    foreground = "#e0def4",
    text = "#e0def4",
    cursor = "#524f67",
    black = "#26233a",
    red = "#eb6f92",
    green = "#31748f",
    yellow = "#f6c177",
    blue = "#9ccfd8",
    magenta = "#c4a7e7",
    cyan = "#ebbcba",
    white = "#e0def4",
    bright_black = "#6e6a86",
    bright_red = "#eb6f92",
    bright_green = "#31748f",
    bright_yellow = "#f6c177",
    bright_blue = "#9ccfd8",
    bright_magenta = "#c4a7e7",
    bright_cyan = "#ebbcba",
    bright_white = "#e0def4",
}

-- terminal background comes through
-- vim.api.nvim_set_hl(0, "Normal", { bg = "NONE", fg = colors.foreground })
-- vim.api.nvim_set_hl(0, "NormalNC", { bg = "NONE", fg = colors.foreground })
-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE", fg = colors.foreground })
-- vim.api.nvim_set_hl(0, "EndOfbuffer", { bg = "NONE", fg = colors.foreground })

vim.api.nvim_set_hl(0, "netrwDir",{ fg = colors.green })
vim.api.nvim_set_hl(0, "netrwExe",{ fg = colors.red })
vim.api.nvim_set_hl(0, "netrwSymlink",{ fg = colors.yellow })
