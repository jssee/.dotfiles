local api = vim.api
local format = string.format
local M = {}

-----@param autocmds string[], name string
--M.augroup = function(autocmds, name)
--    vim.cmd("augroup " .. name)
--    vim.cmd "autocmd!"
--    for _, autocmd in ipairs(autocmds) do
--        vim.cmd("autocmd " .. table.concat(autocmd, " "))
--    end
--    vim.cmd "augroup END"
--end

M.augroup = function(name, event, fn, ft)
    api.nvim_exec(
        format(
            [[
    augroup %s
        autocmd!
        autocmd %s %s %s
    augroup END
    ]],
            name,
            event,
            ft or "*",
            fn
        ),
        false
    )
end

return M.augroup
