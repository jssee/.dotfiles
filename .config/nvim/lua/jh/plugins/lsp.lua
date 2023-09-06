return {
    "vonheikemen/lsp-zero.nvim",
    branch = "v2.x",
    dependencies = {
        { "neovim/nvim-lspconfig" },
        { "williamboman/mason.nvim" },
        { "williamboman/mason-lspconfig.nvim" },
    },
    config = function()
        local lsp = require("lsp-zero").preset { name = "lsp-only" }
        local lspconfig = require "lspconfig"

        lsp.on_attach(function(_, bufnr)
            -- :help lsp-zero-keybindings
            lsp.default_keymaps { buffer = bufnr }
        end)

        lsp.set_sign_icons {
            error = "✘",
            warn = "▲",
            hint = "⚑",
            info = "»",
        }

        -- configure lua_ls for neovim
        lspconfig.lua_ls.setup(lsp.nvim_lua_ls())

        lsp.setup()
    end,
}
