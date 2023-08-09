return {
    "neogitorg/neogit",
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
        signs = {
            -- { CLOSED, OPENED }
            section = { "▸", "▾" },
            item = { "▸", "▾" },
        },
    },
    keys = {
        {
            "<leader>gg",
            function()
                require("neogit").open()
            end,
        },
        {
            "<leader>gc",
            function()
                require("neogit").open { "commit" }
            end,
        },
    },
}
