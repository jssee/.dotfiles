return {
    "timuntersberger/neogit",
    dependencies = {
        { "sindrets/diffview.nvim" },
        { "nvim-lua/plenary.nvim" },
    },
    config = true,
    opts = {
        integrations = {
            diffview = true,
        },
        sections = {
            recent = { folded = false },
        },
    },
    init = function()
        vim.keymap.set("n", "<leader>gg", function()
            require("neogit").open { kind = "replace" }
        end)
        vim.keymap.set("n", "<leader>gc", function()
            require("neogit").open { "commit" }
        end)
    end,
}
