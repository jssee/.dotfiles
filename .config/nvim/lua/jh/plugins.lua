vim.cmd [[packadd packer.nvim]]
local has_packer, packer = pcall(require, "packer")

if not has_packer then
    return
end

-- a helper to make loading configs a bit less verbose
local with_config = function(name)
    return string.format("require('jh.%s')", name)
end

packer.startup(function(use)
    -- plugin manager
    use { "wbthomason/packer.nvim", opt = true }

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
    use "gelguy/wilder.nvim"
    use "justinmk/vim-dirvish"
    use "romainl/vim-qf"

    -- ui
    use "folke/tokyonight.nvim"
    use "lambdalisue/nerdfont.vim"
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
    use {
        "cormacrelf/dark-notify",
        config = function()
            require("dark_notify").run()
        end,
    }
end)
