local has_treesitter, treesitter = pcall(require, "nvim-treesitter.configs")
local has_autotag, autotag = pcall(require, "nvim-ts-autotag")

if not has_treesitter then
    return
end
if has_autotag then
    autotag.setup()
end

treesitter.setup {
    ensure_install = { "maintained" },
    highlight = {
        enable = true,
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "<CR>",
            node_incremental = "<CR>",
            node_decremental = "<S-CR>",
        },
    },
    --plugins
    autotag = {
        enable = has_autotag,
    },
}
