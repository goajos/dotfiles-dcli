-- auto leave insert mode when changing windows or nvim losing focus
vim.api.nvim_create_autocmd({"WinLeave", "FocusLost"}, {
    callback = function()
        if vim.bo.buftype ~= "terminal" then
            vim.cmd("stopinsert")
        end
    end
})

-- show sign/number only in active window
vim.api.nvim_create_autocmd({"WinEnter", "BufEnter"}, {
    callback = function()
        vim.opt_local.cursorline = true
        if vim.bo.filetype ~= "netrw" then
            vim.opt_local.signcolumn = "number"
            vim.opt_local.foldcolumn = "auto"
            vim.opt_local.number = true
            vim.opt_local.relativenumber = true
        end
    end
})
vim.api.nvim_create_autocmd({"WinLeave", "BufLeave"}, {
    callback = function()
        vim.opt_local.cursorline = false
        if vim.bo.filetype ~= "netrw" then
            vim.opt_local.signcolumn = "no"
            vim.opt_local.foldcolumn = "0"
            vim.opt_local.number = false
            vim.opt_local.relativenumber = false
        end
    end
})

-- remap esc for closing the fzf terminal buffer
vim.api.nvim_create_autocmd("FileType", {
    pattern = "fzf",
    callback = function()
        vim.keymap.set("t", "<Esc>", "<Esc>")
    end
})
