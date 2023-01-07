local M = {}

M.Rg = function(...)
    if not vim.fn.executable "rg" then
        print "Error: rg required"
        return
    end

    local data = vim.fn.systemlist {
        "rg",
        "--vimgrep",
        ...,
    }
    vim.fn.setqflist({}, "r", { title = "Rg Results", lines = data })
    -- until i can find a way to call this as function with `cgetexpr`
    -- we'll have to settle for calling the autocmd manually.
    vim.cmd.doautocmd "QuickFixCmdPost"
end

return M
