return {
    -- {
    --         "cormacrelf/dark-notify",
    --         config = function()
    --                 require("dark_notify").run()
    --         end,
    -- },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        init = function()
            vim.cmd.colo "catppuccin"
        end,
    },
    {
        "strash/everybody-wants-that-line.nvim",
        config = true,
    },
}
