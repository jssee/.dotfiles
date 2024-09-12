for o, v in pairs {
    breakindent = true,
    copyindent = true,
    clipboard = vim.opt.clipboard:append "unnamedplus",
    cursorline = true,
    cursorlineopt = { "number" },
    expandtab = true,
    exrc = true,
    fillchars = vim.opt.fillchars:append { diff = " " },
    -- the default grep includes `-uu` which is really slow
    -- especially with node_modules
    grepprg = "rg --vimgrep",
    ignorecase = true,
    infercase = true,
    laststatus = 3,
    list = true,
    listchars = {
        tab = "⁚⁚",
        -- space  = "·",
        trail = "·",
        extends = "→",
        precedes = "←",
    },
    number = true,
    ruler = false,
    scrolloff = 999,
    shiftround = true,
    signcolumn = "number",
    showcmd = false,
    showmode = false,
    smartcase = true,
    smartindent = true,
    splitbelow = true,
    splitright = true,
    swapfile = false,
    tabstop = 4,
    textwidth = 80,
    undodir = vim.fn.stdpath "cache" .. "/undo",
    undofile = true,
    completeopt = {
        "menuone", -- only show popup when theres more than one item
        "popup", -- show extra info in popup
        "noselect", -- do not auto select a match
        "fuzzy", -- enable fuzzy-matching
    },
} do
    vim.opt[o] = v
end
