local M = {}

function M.Grep(...)
    return vim.fn.system(vim.opt.grepprg .. vim.fn.expandcmd() .. " ")
end

return M
