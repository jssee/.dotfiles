return {
    "sheerun/vim-polyglot",
    "stevearc/dressing.nvim",
    {
        "cormacrelf/dark-notify",
        config = function()
            require("dark_notify").run {}
        end,
    },
    {
        "strash/everybody-wants-that-line.nvim",
        config = true,
        opts = {
            filename = {
                enabled = false,
            },
        },
    },
    {
        "j-hui/fidget.nvim",
        opts = {
            notification = {
                override_vim_notify = true,
            },
        },
    },
    {
        "bekaboo/dropbar.nvim",
        event = "UIEnter",
        keys = {
            {
                "<leader>-",
                function()
                    require("dropbar.api").pick()
                end,
            },
        },
    },
    {
        "zenbones-theme/zenbones.nvim",
        lazy = false,
        priority = 1000,
        init = function()
            vim.cmd.colo [[zenwritten]]
        end,
        dependencies = {
            "rktjmp/lush.nvim",
        },
    },
}
