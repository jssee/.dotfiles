local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup("user_cmds", { clear = true })

autocmd("TextYankPost", {
    desc = "highlight on yank",
    group = augroup,
    callback = function()
        vim.highlight.on_yank { higroup = "Visual", timeout = 300 }
    end,
})

autocmd("FileType", {
    desc = "close window with <q>",
    group = augroup,
    pattern = {
        "help",
        "qf",
        "man",
        "scratch",
    },
    callback = function(args)
        vim.keymap.set("n", "q", [[<cmd>close<cr>]], { buffer = args.buf })
    end,
})

autocmd("WinResized", {
    desc = "rebalance window sizes",
    group = augroup,
    callback = function()
        vim.cmd.wincmd [[=]]
    end,
})

autocmd("QuickFixCmdPost", {
    desc = "auto toggle (qf|loc)list",
    group = augroup,
    callback = function()
        vim.cmd [[cwindow]]
    end,
    pattern = { "cgetexpr", "lgetexpr" },
})

autocmd({ "BufRead", "BufEnter" }, {
    group = augroup,
    pattern = { "*.astro" },
    callback = function()
        vim.o.filetype = "astro"
    end,
})
