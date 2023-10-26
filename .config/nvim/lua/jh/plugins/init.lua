return {
    "jssee/vim-delight",
    {
        "cormacrelf/dark-notify",
        config = function()
            require("dark_notify").run {
                schemes = {
                    dark = "github_dark_dimmed",
                    light = "github_light",
                },
            }
        end,
    },
    {
        "strash/everybody-wants-that-line.nvim",
        config = true,
    },
    {
        "sainnhe/gruvbox-material",
    },
    {
        "projekt0n/github-nvim-theme",
        lazy = false,
        priority = 1000,
    },
}
