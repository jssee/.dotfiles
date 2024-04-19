return {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
        { "rrethy/nvim-treesitter-endwise" },
        { "joosepalviste/nvim-ts-context-commentstring" },
        { "windwp/nvim-ts-autotag" },
    },
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup {
            highlight = { enable = true },
            indent = { enable = true },
            endwise = { enable = true },
            autotag = {
                enable = true,
            },
        }
    end,
}
