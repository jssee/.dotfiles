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
    desc = "Close these windows with `q`",
    pattern = { "help", "man", "qf" },
    group = group,
    command = "nnoremap <buffer> q <cmd>quit<cr>",
})

autocmd("QuickFixCmdPost", {
    desc = "Automatically open the quickfix window",
    group = group,
    command = "cwindow",
    pattern = { "cgetexpr", "lgetexpr" },
})

autocmd("WinResized", {
    desc = "Keep window sizes equal on resize",
    group = group,
    command = "wincmd =",
})

autocmd("VimEnter", {
    desc = "Set path using fd",
    group = group,
    callback = function()
        require("functions").Path()
    end,
})

autocmd({ "BufRead", "BufEnter" }, {
    group = group,
    pattern = { "*.astro" },
    callback = function()
        vim.o.filetype = "astro"
    end,
})

autocmd("VimEnter", {
    group = group,
    desc = "Remove hlsearch when no longer needed",
    callback = function()
        local listener = vim.api.nvim_create_namespace "key_listener"
        vim.on_key(require("functions").KeyListener, listener)
    end,
})
