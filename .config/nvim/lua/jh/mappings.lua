local u = require "jh.utils.map"

u.nmap { ";", ":" }
u.xmap { ";", ":" }
u.nmap { ":", ";" }
u.imap { "kj", "<esc>" }
u.cmap { "kj", "<esc>" }

u.nmap { "j", [[gj]] }
u.nmap { "k", [[gk]] }
u.nmap { "n", [[nzvzz]] }
u.nmap { "N", [[Nzvzz]] }
u.nmap { "*", [[*zvzzN]] }
u.nmap { "0", [[^]] }
u.nmap { "^", [[0]] }

u.nmap { "<BS>", [[<C-^>]] }
u.nmap { "<Tab>", [[:bn<CR>]] }
u.nmap { "<S-Tab>", [[<:bp<CR>]] }

u.nmap { "<C-h>", [[:wincmd h<CR>]] }
u.nmap { "<C-j>", [[:wincmd j<CR>]] }
u.nmap { "<C-k>", [[:wincmd k<CR>]] }
u.nmap { "<C-l>", [[:wincmd l<CR>]] }

u.nmap { "<Leader>/", [[:Grep<space>]] }
u.nmap { "<Leader>*", [[:Grep <C-R>=expand("<cword>")<CR><CR>]] }

u.nmap { "<Leader>.", [[:lua require("ido").module.run("files/search")<cr>]] }

u.nmap { "<Leader><Space>", [[:e<Space>]] }

u.nmap { "so", [[:set opfunc=fun#sortop<cr>g@]] }
u.nmap { "su", [[m':set opfunc=fun#subop<CR>g@]] }
