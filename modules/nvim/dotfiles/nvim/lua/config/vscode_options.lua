local vscode = require("vscode")
-- vscode neovim options
-- leader key
vim.g.mapleader = " "      -- space leader key
vim.g.maplocalleader = " " -- space local leader key

vim.opt.clipboard = "unnamedplus" -- use system clipboard:

-- search options
vim.opt.ignorecase = true -- case-insensitive search
vim.opt.smartcase = true  -- case-sensitive if uppercase in search term
vim.opt.hlsearch = true   -- highlight search results
vim.opt.incsearch = true -- incremental search results

vim.keymap.set("n", "<Space>", "<Nop>", { desc = "Don't move cursor when using leader key" })

vim.keymap.set({"n", "v"}, "<Leader>p", '"_dP', { desc = "Paste without overwriting the register" })

vim.keymap.set("n", "<Leader>/", ":noh<CR>", { desc = "Clear search highlighting" })

vim.keymap.set("n", "<Leader>w", function()
    vscode.action("workbench.action.files.save")
end)
vim.keymap.set("n", "<Leader>q", function()
    vscode.action("workbench.action.closeActiveEditor")
end)

vim.keymap.set("n", "<Tab>", function()
    vscode.action("workbench.action.nextEditor")
    -- vscode.action("workbench.action.nextEditorInGroup")
end)
vim.keymap.set("n", "<S-Tab>", function()
    vscode.action("workbench.action.previousEditor")
    -- vscode.action("workbench.action.previousEditorInGroup")
end)

vim.keymap.set({ "n", "v" }, "]q", function()
    vscode.action("search.action.focusNextSearchResult")
    vscode.action("vscode-neovim.escape")
end)
vim.keymap.set({ "n", "v" }, "[q", function()
    vscode.action("search.action.focusPreviousSearchResult")
    vscode.action("vscode-neovim.escape")
end)

vim.keymap.set({ "n", "v" }, "]d", function()
    vscode.action("go-to-next-error.next.error")
    -- vscode.action("vscode-neovim.escape")
end)
vim.keymap.set({ "n", "v" }, "[d", function()
    vscode.action("go-to-next-error.prev.error")
    -- vscode.action("vscode-neovim.escape")
end)

-- auto leave insert mode when changing buffers or window losing focus
vim.api.nvim_create_autocmd({"BufLeave", "FocusLost"}, {
    pattern = "*",
    command = "stopinsert"
})
