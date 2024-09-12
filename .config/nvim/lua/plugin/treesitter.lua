return {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
        { "rrethy/nvim-treesitter-endwise" },
        { "joosepalviste/nvim-ts-context-commentstring" },
        { "windwp/nvim-ts-autotag" },
    },
    build = ":TSUpdate",
    config = function()
        local ts = require "nvim-treesitter.configs"

        ts.setup {
            auto_install = true,
            highlight = { enable = true },
            indent = { enable = true },
            endwise = { enable = true },
            autotag = {
                enable = true,
            },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<cr>",
                    node_incremental = "<cr>",
                    node_decremental = "<s-cr>",
                },
            },
        }
    end,
}
