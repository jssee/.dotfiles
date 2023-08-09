return {
    "ten3roberts/window-picker.nvim",
    keys = {
        { "<leader>ww", vim.cmd.WindowPick },
        { "<leader>wx", vim.cmd.WindowSwap },
        { "<leader>wq", vim.cmd.WindowZap },
        {
            "<leader>wo",
            function()
                vim.cmd.wincmd "o"
            end,
        },
        {
            "<leader>wv",
            function()
                vim.cmd.wincmd "v"
            end,
        },
        {
            "<leader>ws",
            function()
                vim.cmd.wincmd "s"
            end,
        },
    },
}
