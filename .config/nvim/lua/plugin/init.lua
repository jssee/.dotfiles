vim.cmd [[packadd packer.nvim]]
local has_packer, packer = pcall(require, "packer")

-- short circuit this if packer is not avaiable
if not has_packer then
    return
end

-- a helper to make loading configs a bit less verbose
local with_config = function(name)
    return string.format("require('plugin.%s')", name)
end

packer.startup(function(use)
    -- plugin manager
    use { "wbthomason/packer.nvim", opt = true }

    -- editing
    use "machakann/vim-sandwich"
    use "tpope/vim-commentary"
    use "tpope/vim-eunuch"
    use "tpope/vim-fugitive"
    use "tpope/vim-repeat"
    use "tpope/vim-unimpaired"
    use "wellle/targets.vim"
    use "jssee/vim-infest"
    use "elixir-editors/vim-elixir"

    -- navigation
    use "justinmk/vim-dirvish"
    use "romainl/vim-qf"
    use "gelguy/wilder.nvim"

    -- ui
    use "jssee/vim-cortado"
    use "folke/tokyonight.nvim"
    use "rrethy/nvim-base16"
    use {
        "rose-pine/neovim",
        as = "rose-pine",
    }

    -- treesitter
    use {
        "nvim-treesitter/nvim-treesitter",
        config = with_config "treesitter",
    }
    use "windwp/nvim-ts-autotag"

    --lsp
    use {
        "neovim/nvim-lspconfig",
        config = with_config "lsp",
    }
    use "jose-elias-alvarez/null-ls.nvim"
    use "folke/trouble.nvim"
    use "glepnir/lspsaga.nvim"
    use "hrsh7th/nvim-compe"
    use "norcalli/snippets.nvim"
    use "windwp/nvim-autopairs"
    use "onsails/lspkind-nvim"

    -- misc
    use "nvim-lua/plenary.nvim"
    use "rktjmp/lush.nvim"
end)
