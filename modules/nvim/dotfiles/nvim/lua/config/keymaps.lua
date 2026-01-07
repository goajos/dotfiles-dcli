vim.keymap.set("n", "<Space>", "<Nop>", { desc = "Don't move cursor when using leader key" })

vim.keymap.set({"n", "v"}, "<Leader>p", '"_dP', { desc = "Paste without overwriting the register", noremap = true, silent = true })

-- search
vim.keymap.set("n", "<Leader>/", ":noh<CR>", { desc = "Clear search highlighting" })

local diagnostic_goto = function(next)
    return function()
        vim.diagnostic.jump({ count = next and 1 or -1, float = true })
    end
end
vim.keymap.set("n", "]d", diagnostic_goto(true), { desc = "Next diagnostics" })
vim.keymap.set("n", "[d", diagnostic_goto(false), { desc = "Previous diagnostics" })
vim.keymap.set("n", "<Leader>d", vim.diagnostic.open_float, { desc = "Floating line diagnostics" })

-- file
vim.keymap.set("n", "<Leader>w", ":w<CR>", { desc = "Save current buffer" })
vim.keymap.set("n", "<Leader>q", ":bd<CR>", { desc = "Close current buffer" })

-- term
vim.keymap.set("n", "<Leader>t", ":term<CR>", { desc = "Open terminal buffer" })
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Leave terminal buffer insert mode" })
vim.keymap.set("t", "<Leader><Esc>", "<Esc>", { desc = "Send <Esc> to terminal buffer" })

-- buffers
vim.keymap.set("n", "<Tab>", ":bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", { desc = "Previous buffer" })

