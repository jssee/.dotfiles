return {
    "ten3roberts/window-picker.nvim",
    keys = {
        { "<leader>ww", vim.cmd.WindowPick, desc = "pick window" },
        { "<leader>wx", vim.cmd.WindowSwap, desc = "swap window" },
        { "<leader>wq", vim.cmd.WindowZap, desc = "close windows" },
        {
            "<leader>wo",
            function()
                vim.cmd.wincmd "o"
            end,
            desc = "keep only current window",
        },
        {
            "<leader>wv",
            function()
                vim.cmd.wincmd "v"
            end,
            desc = "new vsplit window",
        },
        {
            "<leader>ws",
            function()
                vim.cmd.wincmd "s"
            end,
            desc = "new split window",
        },
    },
}
