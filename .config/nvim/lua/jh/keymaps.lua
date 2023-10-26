for _, m in ipairs {
    -- { mode/s, lhs, rhs }
    { { "n", "x" }, ";", ":" },
    { { "i", "c" }, "kj", "<esc>" },
    { { "i", "c" }, "kj", "<esc>" },
    { "n", "j", [[gj]] },
    { "n", "k", [[gk]] },
    { "n", "n", [[nzvzz]] },
    { "n", "N", [[Nzvzz]] },
    { "n", "*", [[*zvzzN]] },
    { "n", "<tab>", [[:bn<cr>]] },
    { "n", "<s-tab>", [[:bp<cr>]] },
    { "n", "<backspace>", [[^]] },
    { "n", "q", "<nop>" },
    { "n", "<left>", [[:wincmd h<cr>]] },
    { "n", "<down>", [[:wincmd j<cr>]] },
    { "n", "<up>", [[:wincmd k<cr>]] },
    { "n", "<right>", [[:wincmd l<cr>]] },
    { "n", "<leader>/", [[:Rg<space>]] },
    { "n", "<leader>.", [[:Rg <C-R>=expand("<cword>")<CR><CR>]] },
    { "n", "[<space>", [[<cmd>call append(line('.') - 1, repeat([''], v:count1))<CR>]] },
    { "n", "]<space>", [[<cmd>call append(line('.'),     repeat([''], v:count1))<CR>]] },
    {
        "n",
        "gV",
        [["`[" . strpart(getregtype(), 0, 1) . "`]"]],
        { expr = true, replace_keycodes = false },
    },
} do
    local mode, lhs, rhs = m[1], m[2], m[3]
    opts = vim.tbl_deep_extend("force", { silent = true }, m[4] or {})

    vim.keymap.set(mode, lhs, rhs, opts)
end
