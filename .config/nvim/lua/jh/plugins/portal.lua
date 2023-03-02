return {
    "cbochs/portal.nvim",
    dependencies = {
        { "cbochs/grapple.nvim" },
        { "theprimeagen/harpoon" },
    },
    opts = {
        query = { "modified", "grapple", "harpoon" },
    },
    keys = {
        {
            "<leader>o",
            function()
                require("portal").jump_backward()
            end,
        },
        {
            "<leader>i",
            function()
                require("portal").jump_forward()
            end,
        },
        {
            "<leader>ha",
            function()
                require("harpoon.mark").add_file()
            end,
        },
    },
}
