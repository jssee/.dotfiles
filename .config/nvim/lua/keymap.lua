for _, m in ipairs {
    -- { mode/s, lhs, rhs }
    { { "n", "x" }, ";", ":" },
    { { "i", "c" }, "kj", "<esc>" },
    { { "i", "c" }, "kj", "<esc>" },
    { "n", "j", [[gj]] },
    { "n", "k", [[gk]] },
    { "n", "*", [[*zvzzN]] },
    { "n", "<tab>", [[<c-i>]] },
    { "n", "<s-tab>", [[<c-o>]] },
    { "n", "<backspace>", [[^]] },
    { "n", "q", "<nop>" },
    { "n", "<leader>/", [[:Rg<space>]] },
    { "n", "<leader>.", [[:Rg <C-R>=expand("<cword>")<CR><CR>]] },
} do
    local mode, lhs, rhs = m[1], m[2], m[3]
    opts = vim.tbl_deep_extend("force", { silent = true }, m[4] or {})

    vim.keymap.set(mode, lhs, rhs, opts)
end
