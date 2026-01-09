if vim.fn.executable "rg" == 1 then
    function _G.RgFindFiles(cmdarg, _cmdcomplete)
        local fnames = vim.fn.systemlist('rg --files --hidden --color=never --glob="!.git"')
        if #cmdarg == 0 then
            return fnames
        else
            return vim.fn.matchfuzzy(fnames, cmdarg)
        end
    end

    vim.opt.findfunc = "v:lua.RgFindFiles"
end


vim.api.nvim_create_autocmd({ "CmdlineChanged", "CmdlineLeave" }, {
    pattern = { "*" },
    group = vim.api.nvim_create_augroup("CmdlineAutocompletion", { clear = true }),
    callback = function(e)
        local function should_enable_autocomplete()
            local cmdline_cmd = vim.fn.split(vim.fn.getcmdline(), " ")[1]
            return cmdline_cmd == "find" or cmdline_cmd == "fin" 
                or cmdline_cmd == "help" or cmdline_cmd == "h"
        end

        if e.event == "CmdlineChanged" and should_enable_autocomplete() then
            vim.opt.wildmode = "noselect:lastused,full"
            vim.fn.wildtrigger()
        end

        if e.event == "CmdlineLeave" then
            vim.opt.wildmode = "full"
        end
    end
})
