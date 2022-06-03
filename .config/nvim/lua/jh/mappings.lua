My.nmap { ";", ":" }
My.xmap { ";", ":" }
My.nmap { ":", ";" }
My.imap { "kj", "<esc>" }
My.cmap { "kj", "<esc>" }

My.nmap { "j", [[gj]] }
My.nmap { "k", [[gk]] }
My.nmap { "n", [[nzvzz]] }
My.nmap { "N", [[Nzvzz]] }
My.nmap { "*", [[*zvzzN]] }
My.nmap { "0", [[^]] }
My.nmap { "^", [[0]] }

My.nmap { "<BS>", [[<C-^>]] }
My.nmap { "<Tab>", [[:bn<CR>]] }
My.nmap { "<S-Tab>", [[<:bp<CR>]] }

My.nmap { "<C-h>", [[:wincmd h<CR>]] }
My.nmap { "<C-j>", [[:wincmd j<CR>]] }
My.nmap { "<C-k>", [[:wincmd k<CR>]] }
My.nmap { "<C-l>", [[:wincmd l<CR>]] }

My.nmap { "<Leader>/", [[:Grep<space>]] }
My.nmap { "<Leader>*", [[:Grep <C-R>=expand("<cword>")<CR><CR>]] }

My.nmap { "<Leader>.", [[:lua require("ido").module.run("files/search")<cr>]] }

My.nmap { "<Leader><Space>", [[:e<Space>]] }

My.nmap { "so", [[:set opfunc=fun#sortop<cr>g@]] }
My.nmap { "su", [[m':set opfunc=fun#subop<CR>g@]] }
