return {
    "nvim-tree/nvim-tree.lua",
    config = {
        disable_netrw = true,
        view = {
            side = "right",
        },
        actions = {
            open_file = {
                quit_on_open = true,
            },
        },
        renderer = {
            icons = {
                show = {
                    file = false,
                    folder = false,
                    folder_arrow = false,
                    git = true,
                },
            },
        },
    },
    init = function()
        vim.keymap.set("n", "-", vim.cmd.NvimTreeFindFileToggle)
    end,
}
