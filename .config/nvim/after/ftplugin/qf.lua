vim.o.number = false
vim.o.scrolloff = 2
vim.o.wrap = false
vim.keymap.set("n", "<cr>", "<cr>")
vim.keymap.set("n", "<tab>", ":cnext", { buffer = true })
vim.keymap.set("n", "<s-tab>", ":cprev", { buffer = true })
