return {
    "jssee/vim-delight",
    "machakann/vim-sandwich",
    "sheerun/vim-polyglot",
    "tpope/vim-commentary",
    "tpope/vim-eunuch",
    "tpope/vim-fugitive",
    "tpope/vim-repeat",
    "tpope/vim-unimpaired",
    "wellle/targets.vim",
    {
        "cormacrelf/dark-notify",
        config = function()
            require("dark_notify").run()
        end,
    },
    {
        "steelsojka/pears.nvim",
        config = function()
            require("pears").setup(function(conf)
                conf.preset "tag_matching"
            end)
        end,
    },
    {
        "strash/everybody-wants-that-line.nvim",
        config = true,
    },
    {
        "sainnhe/gruvbox-material",
        init = function()
            vim.g.gruvbox_material_background = "hard"
            vim.cmd.colo "gruvbox-material"
        end,
    },
}
