-- nnoremap <buffer> q <cmd>quit<CR>
-- nnoremap <buffer> <CR> <CR>

vim.keymap.set("n", "q", "<cmd>quit<cr>", { silent = true, buffer = 0 })

vim.opt.number = false
vim.opt.scrolloff = 2
vim.opt.wrap = false
