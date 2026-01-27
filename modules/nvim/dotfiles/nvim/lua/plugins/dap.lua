vim.pack.add { "https://github.com/mfussenegger/nvim-dap" }
local dap = require("dap")
dap.adapters.lldb = {
    type = "executable",
    command = "/usr/sbin/lldb-dap",
    name = "lldb"
}
dap.configurations.c = {
    {
        name = "launch",
        type = "lldb",
        request = "launch",
        program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end,
        cwd = "${workspaceFolder}",
        args = {}
    },
}
