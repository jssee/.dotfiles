return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = {
        highlight = { enable = true },
    },
}
