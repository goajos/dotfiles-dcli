vim.opt.clipboard = "unnamedplus" -- use system clipboard

vim.opt.ignorecase = true -- case-insensitive search
vim.opt.smartcase = true  -- case-sensitive if uppercase in search term
vim.opt.hlsearch = true   -- highlight search results
vim.opt.incsearch = true -- incremental search results

vim.opt.shiftwidth = 4 -- tab size for indentation
vim.opt.tabstop = 4 -- tab size
vim.opt.softtabstop = 4 -- tab size insert mode
vim.opt.expandtab = true -- use spaces for tabs
vim.opt.autoindent = true -- copy indent form cursorline
vim.opt.smartindent = true -- smart auto indenting

-- vim.opt.number = true -- show line numbers
-- vim.opt.relativenumber = true -- show relative line numbers
-- vim.opt.cursorline = true -- highlight cursor line
-- vim.opt.signcolumn = "number" -- show sign column in the number column
vim.opt.termguicolors = true -- enable true colors
vim.opt.colorcolumn = "100" -- show column line at 100 chars
vim.opt.cmdheight = 1 -- linesize of the cmdline
vim.opt.scrolloff = 10 -- keep 10 lines above/below cursor
vim.opt.sidescrolloff = 5 -- keep 5 columns left/right of cursor
vim.opt.splitbelow = true -- split windows below by default
vim.opt.splitright = true -- split windows right by default
vim.opt.laststatus = 3 -- global status line

vim.opt.wrap = true -- enable word wrap
vim.opt.breakindent = true -- wrap lines continue visually

vim.opt.swapfile = false -- disable swapfiles
vim.opt.backup = false -- disable backup files
vim.opt.undofile = true -- persistent undo

vim.opt.grepprg = "rg --vimgrep" -- use ripgrep
-- vim.opt.path:append("**") -- buildin fuzzy finding

vim.opt.foldmethod = "expr"
vim.opt.foldexpr =  "v:lua.vim.treesitter.foldexpr()"
-- vim.opt.foldexpr = "v:lua.vim.lsp.foldexpr()"
vim.opt.foldlevel = 99
-- vim.opt.foldcolumn = "auto"
vim.opt.fillchars = [[fold: ,foldopen:▼,foldclose:▶,foldsep: ,foldinner: ]]

vim.opt.winborder = 'rounded'
vim.opt.winblend = 0 -- no floating window transparency

