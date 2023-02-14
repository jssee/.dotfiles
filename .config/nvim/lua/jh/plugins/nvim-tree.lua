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
    init = function()
        vim.keymap.set("n", "-", vim.cmd.NvimTreeFindFileToggle)
    end,
}
