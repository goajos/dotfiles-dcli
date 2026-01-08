vim.pack.add({
  "https://github.com/projekt0n/github-nvim-theme"
})
vim.cmd[[colorscheme github_dark_high_contrast]]

-- remove nvim window background for parent opacity
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })

-- Highlight the divider
vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#7fc8ff", bold = true })

