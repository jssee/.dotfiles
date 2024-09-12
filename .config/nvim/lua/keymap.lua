for _, m in ipairs {
    -- { mode/s, lhs, rhs }
    { { "n", "x" }, ";", ":", { desc = "command mode" } },
    { { "i", "c" }, "kj", "<esc>" },
    { { "i", "c" }, "kj", "<esc>" },
    { "n", "j", [[gj]] },
    { "n", "k", [[gk]] },
    { "n", "*", [[*zvzzN]] },
    { "n", "n", [[nzvzz]] },
    { "n", "N", [[Nzvzz]] },
    { "n", "<tab>", [[<cmd>bnext<cr>]], { desc = "next buffer" } },
    { "n", "<s-tab>", [[<cmd>bprev<cr>]], { desc = "prev buffer" } },
    { "n", "<backspace>", [[^]] },
    { "n", "q", "<nop>" },
} do
    local mode, lhs, rhs = m[1], m[2], m[3]
    local opts = vim.tbl_deep_extend("force", { silent = true }, m[4] or {})
    vim.keymap.set(mode, lhs, rhs, opts)
end
