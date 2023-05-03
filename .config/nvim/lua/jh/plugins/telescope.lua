return {
    "nvim-telescope/telescope.nvim",
    dependencies = { { "nvim-lua/plenary.nvim" } },
    lazy = false,
    opts = {
        defaults = {
            layout_strategy = "bottom_pane",
            layout_config = {
                height = 0.2,
            },
            prompt_title = false,
            preview_title = false,
            height = 0.2,
        },
        pickers = {
            find_files = {
                theme = "ivy",
                prompt_title = false,
                preview_title = false,
                height = 0.2,
            },
        },
    },
    keys = {
        {
            "<leader><space>",
            function()
                require("telescope.builtin").find_files()
            end,
        },
        {
            "<leader>b",
            function()
                require("telescope.builtin").buffers()
            end,
        },
    },
}
