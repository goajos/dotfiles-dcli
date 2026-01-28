-- leader
vim.keymap.set("n", "<Space>", "<Nop>", { desc = "Don't move cursor when using leader key" })
vim.keymap.set({"n", "v"}, "<Leader>p", '"_dP', { desc = "Paste without overwriting the register", noremap = true, silent = true })

-- search
vim.keymap.set("n", "<Leader>/", ":noh<CR>", { desc = "Clear search highlighting" })

-- diagnostics
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
vim.keymap.set("n", "<Leader>f", ":find ", { desc = "Built-in fuzzy finding files" })

-- term
vim.keymap.set("n", "<Leader>t", ":term<CR>", { desc = "Open terminal buffer" })
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Leave terminal buffer insert mode" })
vim.keymap.set("t", "<C-v><Esc>", "<Esc>", { desc = "Send <Esc> to terminal buffer" })

-- buffers
vim.keymap.set("n", "<Tab>", ":bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", { desc = "Previous buffer" })
vim.keymap.set("n", "<Leader>b", ":buffer ", { desc = "Builtin fuzzy finding buffers" })

-- dap
local sidebar_is_open = false
local cur_sidebar
local toggle_dap_sidebar = function()
    if sidebar_is_open then
        cur_sidebar.close()
        sidebar_is_open = false
    else
        local widgets = require("dap.ui.widgets")
        cur_sidebar = widgets.sidebar(widgets.scopes)
        cur_sidebar.open()
        sidebar_is_open = true
    end

end
vim.keymap.set("n", "<Leader>d", toggle_dap_sidebar, { desc = "Toggle the dap sidebar" })
local repl_is_open = false
local repl
local toggle_dap_repl = function()
    if repl_is_open then
        repl.close()
        repl_is_open = false
    else
        repl = require("dap.repl")
        repl.open()
        repl_is_open = true
    end
end
vim.keymap.set("n", "<Leader>r", toggle_dap_repl, { desc = "Toggle the dap repl" })
vim.keymap.set("n", "<F5>", ":DapContinue<CR>", { desc = "Continue the dap debugger" })
vim.keymap.set("n", "<S-F5>", ":DapTerminate<CR>", { desc = "Terminate the dap debugger" })
vim.keymap.set("n", "<F9>", ":DapToggleBreakpoint<CR>", { desc = "Toggle breakpoint on current line" })
vim.keymap.set("n", "<F10>", ":DapStepOver<CR>", { desc = "Step over" })
vim.keymap.set("n", "<F11>", ":DapStepInto<CR>", { desc = "Step into" })
vim.keymap.set("n", "<S-F11>", ":DapStepOut<CR>", { desc = "Step out" })
