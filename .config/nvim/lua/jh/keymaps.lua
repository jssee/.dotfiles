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
    -- { "n", "<c-h>", [[:wincmd h<cr>]] },
    -- { "n", "<c-j>", [[:wincmd j<cr>]] },
    -- { "n", "<c-k>", [[:wincmd k<cr>]] },
    -- { "n", "<c-l>", [[:wincmd l<cr>]] },
    { "n", "<leader><space>", [[:edit<space>]] },
    { "n", "<leader>/", [[:Rg<space>]] },
    { "n", "<leader>.", [[:Rg <C-R>=expand("<cword>")<CR><CR>]] },
} do
    local mode, lhs, rhs = m[1], m[2], m[3]
    vim.keymap.set(mode, lhs, rhs)
end
