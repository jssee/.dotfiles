return {
    "vonheikemen/lsp-zero.nvim",
    branch = "v2.x",
    dependencies = {
        { "neovim/nvim-lspconfig" },
        { "williamboman/mason.nvim" },
        { "williamboman/mason-lspconfig.nvim" },
        { "jose-elias-alvarez/null-ls.nvim" },
    },
    config = function()
        local lsp = require("lsp-zero").preset { name = "lsp-only" }
        local lspconfig = require "lspconfig"
        local null_ls = require "null-ls"

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

        lsp.format_on_save {
            servers = {
                ["null-ls"] = {
                    "javascript",
                    "typescript",
                    "svelte",
                    "lua",
                    "eelixir",
                    "elixir",
                },
            },
        }

        lspconfig.tailwindcss.setup {
            settings = {
                tailwindCSS = {
                    experimental = {
                        classRegex = {
                            { "cva\\(([^)]*)\\)", "[\"'`]([^\"'`]*).*?[\"'`]" },
                        },
                    },
                },
            },
        }

        -- configure lua_ls for neovim
        lspconfig.lua_ls.setup(lsp.nvim_lua_ls())

        lsp.setup()

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
