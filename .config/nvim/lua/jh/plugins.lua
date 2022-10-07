-- install packer.nvim if its not already available
local install_path = vim.fn.stdpath "data"
    .. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.fn.execute(
        "!git clone https://github.com/wbthomason/packer.nvim " .. install_path
    )
end

-- load it
vim.cmd [[packadd packer.nvim]]
local has_packer, packer = pcall(require, "packer")

if not has_packer then
    return
end

local packer_group = vim.api.nvim_create_augroup("Packer", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
    command = "source <afile> | PackerCompile",
    group = packer_group,
    pattern = vim.fn.stdpath "config" .. "lua/jh/plugins.lua",
})

packer.startup(function(use)
    -- plugin manager
    use { "wbthomason/packer.nvim" }

    -- editing
    use "jssee/vim-delight"
    use "jssee/vim-infest"
    use "machakann/vim-sandwich"
    use "sheerun/vim-polyglot"
    use "tpope/vim-commentary"
    use "tpope/vim-eunuch"
    use "tpope/vim-fugitive"
    use "tpope/vim-repeat"
    use "tpope/vim-unimpaired"
    use "wellle/targets.vim"

    -- navigation
    use {
        "gelguy/wilder.nvim",
        config = function()
            require "jh.wilder"
        end,
    }
    use "justinmk/vim-dirvish"
    use "romainl/vim-qf"
    use {
        "ggandor/leap.nvim",
        config = function()
            require("jh.leap").setup()
        end,
    }

    -- ui
    use "folke/tokyonight.nvim"
    use "ryanoasis/vim-devicons"
    use {
        "strash/everybody-wants-that-line.nvim",
        config = function()
            require("everybody-wants-that-line").setup()
        end,
    }

    --lsp
    use {
        "neovim/nvim-lspconfig",
        config = function()
            require "jh.lsp"
        end,
    }
    use {
        "ms-jpq/coq.artifacts",
        branch = "artifacts",
    }
    use {
        "ms-jpq/coq_nvim",
        branch = "coq",
        config = function()
            require "jh.completion"
        end,
    }
    use "steelsojka/pears.nvim"
    use "jose-elias-alvarez/null-ls.nvim"
    use "jose-elias-alvarez/nvim-lsp-ts-utils"
    use "folke/trouble.nvim"

    -- misc
    use "nvim-lua/plenary.nvim"
    use "rktjmp/lush.nvim"
    use {
        "cormacrelf/dark-notify",
        config = function()
            require("dark_notify").run()
        end,
    }
end)
