for o, v in pairs {
    breakindent = true,
    clipboard = vim.opt.clipboard:append "unnamedplus",
    completeopt = { "menuone", "noselect" },
    copyindent = true,
    cursorline = true,
    cursorlineopt = { "number", "screenline" },
    expandtab = true,
    grepprg = "rg --vimgrep",
    ignorecase = true,
    infercase = true,
    laststatus = 3,
    listchars = {
        tab = "⁚⁚",
        space = "·",
        trail = "·",
        extends = "→",
        precedes = "←",
    },
    number = true,
    path = vim.fn.systemlist "fd . --type d",
    ruler = false,
    scrolloff = 999,
    shiftround = true,
    shortmess = vim.opt.shortmess:append "c",
    showcmd = false,
    showmode = false,
    signcolumn = "number",
    smartcase = true,
    smartindent = true,
    splitbelow = true,
    splitright = true,
    swapfile = false,
    tabstop = 4,
    termguicolors = true,
    textwidth = 120,
    timeoutlen = 300,
    ttimeoutlen = 100,
    undodir = vim.fn.stdpath "cache" .. "/undo",
    undofile = true,
    updatetime = 300,
    wildmenu = true,
} do
    vim.opt[o] = v
end

for g, v in pairs {
    loaded_netrw = true,
    loaded_netrwPlugin = true,
    mapleader = " ",
    softtabstop = 2,
    showbreak = "↪ ",
} do
    vim.g[g] = v
end