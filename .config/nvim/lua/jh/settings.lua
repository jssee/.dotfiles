local g, o, cmd, fn = vim.g, vim.opt, vim.cmd, vim.fn
local augroup = require "jh.utils.augroup"

cmd [[ filetype plugin indent on ]]
cmd [[ syntax on ]]

-- colorscheme
o.termguicolors = true
g.gruvbox_material_background = "hard"
cmd [[ colo gruvbox-material ]]

-- options
o.backup = false
o.breakindent = true
o.clipboard:append "unnamedplus"
o.completeopt = { "menuone", "noselect" }
o.copyindent = true
o.cmdheight = 0
o.cursorline = true
o.expandtab = true
o.foldexpr = "nvim_treesitter#foldexpr()"
o.foldlevelstart = 99
o.foldmethod = "expr"
o.foldnestmax = 10
o.hidden = true
o.ignorecase = true
o.infercase = true
o.laststatus = 3
o.list = true
o.listchars = {
    tab = "⁚⁚",
    space = "·",
    trail = "·",
    extends = "→",
    precedes = "←",
}
o.mouse = "a"
o.number = true
o.ruler = false
o.scrolloff = 999
o.shiftround = true
o.shortmess:append "c"
o.showcmd = false
o.showmode = false
o.signcolumn = "number"
o.smartcase = true
o.smartindent = true
o.splitbelow = true
o.splitright = true
o.swapfile = false
o.tabstop = 2
o.textwidth = 80
o.timeoutlen = 300
o.ttimeoutlen = 100
o.undodir = os.getenv "HOME" .. "/.cache/nvim/undo/"
o.undofile = true
o.updatetime = 300
o.wildmenu = true

g.loaded_netrw = true
g.loaded_netrwPlugin = true
g.mapleader = " "
g.softtabstop = 2
g.showbreak = "↪ "

if fn.executable "rg" then
    o.grepprg = "rg --vimgrep"
end
cmd [[command! -nargs=+ -complete=file_in_path -bar Grep  cgetexpr fun#grep(<f-args>)]]
cmd [[command! -nargs=+ -complete=file_in_path -bar LGrep lgetexpr fun#grep(<f-args>)]]

augroup("general", {
    [[BufEnter *.txt if &buftype == 'help' | wincmd L | endif]],
    [[BufWritePre * call fun#trim()]],
    [[CompleteDone * if pumvisible() == 0 | pclose | endif]],
    [[VimResized * :wincmd =]],
})

augroup("quickfix", {
    [[QuickFixCmdPost cgetexpr cwindow]],
    [[QuickFixCmdPost lgetexpr lwindow]],
})
