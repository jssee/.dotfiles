local g = vim.g
local has_npairs, npairs = pcall(require, "nvim-autopairs")
local u = require "jh.utils.map"

if not has_npairs then
    return
end

g.coq_settings = {
    ["auto_start"] = "shut-up",
    ["display.icons.mode"] = "short",
    ["keymap"] = {
        ["jump_to_mark"] = "<C-f>",
    },
}

npairs.setup {
    map_bs = false,
    map_cr = false,
}

-- these mappings are coq recommended mappings unrelated to nvim-autopairs
u.imap { "<esc>", [[pumvisible() ? "<c-e><esc>" : "<esc>"]], expr = true }
u.imap { "<c-c>", [[pumvisible() ? "<c-e><c-c>" : "<c-c>"]], expr = true }
u.imap { "<tab>", [[pumvisible() ? "<c-n>" : "<tab>"]], expr = true }
u.imap { "<s-tab>", [[pumvisible() ? "<c-p>" : "<bs>"]], expr = true }

_G.MUtils = {}

MUtils.CR = function()
    if vim.fn.pumvisible() ~= 0 then
        if vim.fn.complete_info({ "selected" }).selected ~= -1 then
            return npairs.esc "<c-y>"
        else
            return npairs.esc "<c-e>" .. npairs.autopairs_cr()
        end
    else
        return npairs.autopairs_cr()
    end
end
u.imap { "<cr>", [[v:lua.MUtils.CR()]], expr = true }

MUtils.BS = function()
    if
        vim.fn.pumvisible() ~= 0
        and vim.fn.complete_info({ "mode" }).mode == "eval"
    then
        return npairs.esc "<c-e>" .. npairs.autopairs_bs()
    else
        return npairs.autopairs_bs()
    end
end
u.imap { "<bs>", "v:lua.MUtils.BS()", expr = true }
