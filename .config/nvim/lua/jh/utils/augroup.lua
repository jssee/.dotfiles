local com = vim.api.nvim_command

local M = {}

function M.augroup(group, autocmds)
    com("augroup " .. group)
    com "autocmd!"
    for _, autocmd in ipairs(autocmds) do
        com("autocmd " .. autocmd)
    end
    com "augroup END"
end

return M.augroup
