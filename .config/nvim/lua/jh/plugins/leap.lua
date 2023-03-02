return {
    "ggandor/leap.nvim",
    keys = {
        {
            "<cr>",
            function()
                require("leap").leap {}
            end,
        },
        {
            "<s-cr>",
            function()
                require("leap").leap { backward = true }
            end,
        },
    },
}
