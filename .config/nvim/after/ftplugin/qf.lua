vim.opt_local.number = false
vim.opt_local.scrolloff = 2
vim.wo.wrap = false
vim.keymap.set("n", "<cr>", "<cr>", { buffer = true })
vim.keymap.set("n", "<tab>", "<nop>", { buffer = true })
vim.cmd.packadd "cfilter"
