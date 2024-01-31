return {
    "sheerun/vim-polyglot",
    {
        "cormacrelf/dark-notify",
        config = function()
            require("dark_notify").run {
                -- schemes = {
                --     light = "github_light",
                --     dark = "github_dark_default",
                -- },
            }
        end,
    },
    {
        "strash/everybody-wants-that-line.nvim",
        config = true,
    },
    {
        "sainnhe/gruvbox-material",
        -- init = function()
        --     vim.g.gruvbox_material_background = "hard"
        --     vim.cmd.colo "gruvbox-material"
        -- end,
    },
    {
        "neanias/everforest-nvim",
        lazy = false,
        version = false,
        priority = 1000,
        config = function()
            require("everforest").setup {
                background = "hard",
                colours_override = function(palette)
                    palette.green = "#839D00"
                end,
            }
        end,
        init = function()
            vim.cmd.colo "everforest"
        end,
    },
    {
        "projekt0n/github-nvim-theme",
        lazy = false,
        priority = 1000,
        -- init = function()
        --     vim.cmd.colo "github_dark_dimmed"
        -- end,
    },
}
