vim.cmd [[packadd packer.nvim]]
local has_packer, packer = pcall(require, "packer")

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
    use "sheerun/vim-polyglot"
    use "jssee/vim-delight"

    -- navigation
    use "justinmk/vim-dirvish"
    use "romainl/vim-qf"
    use "gelguy/wilder.nvim"

    -- ui
    use "jssee/vim-cortado"
    use "folke/tokyonight.nvim"
    use "arzg/vim-substrata"
    use {
        "nvim-lualine/lualine.nvim",
        config = with_config "lualine",
    }
    use {
        "sidebar-nvim/sidebar.nvim",
        config = with_config "sidebar",
    }

    -- treesitter
    use {
        "nvim-treesitter/nvim-treesitter",
        config = with_config "treesitter",
    }
    use "windwp/nvim-ts-autotag"
    use "windwp/nvim-autopairs"

    --lsp
    use {
        "neovim/nvim-lspconfig",
        config = with_config "lsp",
    }
    use {
        "ms-jpq/coq.artifacts",
        branch = "artifacts",
    }
    use {
        "ms-jpq/coq_nvim",
        branch = "coq",
        config = with_config "completion",
    }
    use "jose-elias-alvarez/null-ls.nvim"
    use "jose-elias-alvarez/nvim-lsp-ts-utils"
    use "folke/trouble.nvim"

    -- misc
    use "nvim-lua/plenary.nvim"
    use "rktjmp/lush.nvim"
end)
