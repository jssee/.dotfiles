-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system {
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    }
end
vim.opt.rtp:prepend(lazypath)

require "jh.options"
require "jh.keymaps"
require "jh.autocmds"
require "jh.commands"

require("lazy").setup "jh.plugins"
