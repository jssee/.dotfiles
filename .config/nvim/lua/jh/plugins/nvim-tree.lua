return {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
        { "nvim-tree/nvim-web-devicons" },
    },
    opts = {
        disable_netrw = true,
        view = {
            side = "right",
        },
        actions = {
            open_file = {
                quit_on_open = true,
            },
        },
    },
    keys = {
        { "-", vim.cmd.NvimTreeFindFileToggle },
    },
}
