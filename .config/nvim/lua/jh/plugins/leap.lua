return {
    "ggandor/leap.nvim",
    init = function()
        vim.keymap.set("n", "<cr>", function()
            require("leap").leap {}
        end)
        vim.keymap.set("n", "<s-cr>", function()
            require("leap").leap { backward = true }
        end)
        vim.keymap.set("n", "#", function()
            require("leap").leap {
                target_windows = require("leap.util").get_enterable_windows(),
            }
        end)
    end,
}
