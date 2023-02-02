return {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
        { "rrethy/nvim-treesitter-endwise" },
    },
    build = ":TSUpdate",
    config = function()
        local ts = require "nvim-treesitter.configs"

        ts.setup {
            highlight = { enable = true },
            endwise = { enable = true },
        }
    end,
}
