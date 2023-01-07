local autocmd = vim.api.nvim_create_autocmd
local group = vim.api.nvim_create_augroup("user_cmds", { clear = true })

autocmd("TextYankPost", {
    desc = "Highlight on yank",
    group = group,
    callback = function()
        vim.highlight.on_yank { higroup = "Visual", timeout = 200 }
    end,
})

autocmd("FileType", {
    pattern = { "help", "man", "qf" },
    group = group,
    command = "nnoremap <buffer> q <cmd>quit<cr>",
})

autocmd("QuickFixCmdPost", {
    group = group,
    command = "cwindow",
})
