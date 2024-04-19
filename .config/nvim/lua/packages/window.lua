return {
    "ten3roberts/window-picker.nvim",
    keys = {
        { "<leader>ww", vim.cmd.WindowPick, desc = "pick window" },
        { "<leader>wx", vim.cmd.WindowSwap, desc = "swap current window" },
        { "<leader>wq", vim.cmd.WindowZap, desc = "close other windows" },
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
            desc = "[w]indow [v]ertical split",
        },
        {
            "<leader>ws",
            function()
                vim.cmd.wincmd "s"
            end,
            desc = "[w]indow split",
        },
    },
}
