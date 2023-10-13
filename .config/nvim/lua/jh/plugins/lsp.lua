return {
    "vonheikemen/lsp-zero.nvim",
    branch = "v2.x",
    dependencies = {
        { "neovim/nvim-lspconfig" },
        { "williamboman/mason.nvim" },
        { "williamboman/mason-lspconfig.nvim" },
        { "nvimtools/none-ls.nvim" },
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

        lsp.format_mapping("gq", {
            format_opts = {
                async = false,
                timeout_ms = 10000,
            },
            servers = {
                ["null-ls"] = {
                    "css",
                    "html",
                    "javascript",
                    "lua",
                    "python",
                    "svelte",
                    "typescript",
                },
            },
        })

        lsp.setup()

        local null_ls = require "null-ls"
        null_ls.setup {
            sources = {
                null_ls.builtins.formatting.stylua,
                null_ls.builtins.formatting.prettier.with {
                    extra_filetypes = { "svelte" },
                },
                null_ls.builtins.diagnostics.eslint_d.with {
                    condition = function(utils)
                        return utils.root_has_file { ".eslintrc", ".eslintrc.js" }
                    end,
                },
                null_ls.builtins.formatting.mix.with {
                    extra_filetypes = { "eelixir" },
                },
                null_ls.builtins.diagnostics.credo.with {
                    extra_filetypes = { "eelixir" },
                },
            },
        }
    end,
}
