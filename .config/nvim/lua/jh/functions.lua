local M = {}

M.Rg = function(...)
    vim.api.nvim_exec_autocmds(
        "QuickFixCmdPre",
        { pattern = "Rg", modeline = false }
    )

    vim.fn.setqflist({}, " ", {
        title = "Rg Results",
        lines = vim.fn.systemlist {
            "rg",
            "--vimgrep",
            ...,
        },
    })

    vim.api.nvim_exec_autocmds(
        "QuickFixCmdPost",
        { pattern = "Rg", modeline = false }
    )
end

return M
