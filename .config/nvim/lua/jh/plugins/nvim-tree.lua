return {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
        { "nvim-tree/nvim-web-devicons" },
    },
    opts = {
        disable_netrw = true,
        view = {
            side = "right",
            width = 40,
            centralize_selection = true,
        },
        actions = {
            open_file = {
                quit_on_open = false,
            },
        },
    },
    keys = {
        { "-", vim.cmd.NvimTreeFindFileToggle },
    },
}
