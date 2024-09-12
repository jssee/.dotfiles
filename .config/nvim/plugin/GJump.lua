vim.api.nvim_create_user_command("GJump", function(opts)
    vim.api.nvim_exec_autocmds("QuickFixCmdPre", { pattern = "cgetexpr", modeline = false })
    vim.g._gjump_lines = vim.fn.system("git jump --stdout " .. vim.fn.expand(opts.args))
    vim.cmd [[:cexpr g:_gjump_lines]]
    vim.api.nvim_exec_autocmds("QuickFixCmdPost", { pattern = "cgetexpr", modeline = false })
end, {
    nargs = "*",
    bar = true,
})
