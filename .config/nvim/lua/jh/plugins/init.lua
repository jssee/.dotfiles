return {
    "jssee/vim-delight",
    "machakann/vim-sandwich",
    "sheerun/vim-polyglot",
    "tpope/vim-commentary",
    "tpope/vim-eunuch",
    "tpope/vim-fugitive",
    "tpope/vim-repeat",
    "tpope/vim-unimpaired",
    {
        "chrisgrieser/nvim-various-textobjs",
        lazy = false,
        opts = { useDefaultKeymaps = true },
    },

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
        "steelsojka/pears.nvim",
        config = function()
            require("pears").setup(function(conf)
                local R = require "pears.rule"
                conf.preset "tag_matching"

                conf.pair("%", {
                    close = "%",
                    should_expand = R.start_of_context "{"
                })
            end)
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
        "p00f/alabaster.nvim",
        url = "https://git.sr.ht/~p00f/alabaster.nvim/",
    },
    {
        "projekt0n/github-nvim-theme",
        lazy = false,
        priority = 1000
    },
}
