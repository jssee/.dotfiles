local g = vim.g
local has_pears, pears = pcall(require, "pears")

-- pears setup
if has_pears then
    pears.setup()
end

g.coq_settings = {
    ["auto_start"] = "shut-up",
    ["display.icons.mode"] = "short",
    ["keymap"] = {
        ["jump_to_mark"] = "<C-f>",
    },
}

My.imap { "<esc>", [[pumvisible() ? "<c-e><esc>" : "<esc>"]], expr = true }
My.imap { "<c-c>", [[pumvisible() ? "<c-e><c-c>" : "<c-c>"]], expr = true }
My.imap { "<tab>", [[pumvisible() ? "<c-n>" : "<tab>"]], expr = true }
My.imap { "<s-tab>", [[pumvisible() ? "<c-p>" : "<bs>"]], expr = true }
