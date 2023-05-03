return {
    "vonheikemen/lsp-zero.nvim",
    branch = "v2.x",
    dependencies = {
        { "neovim/nvim-lspconfig" },
        { "williamboman/mason.nvim" },
        { "williamboman/mason-lspconfig.nvim" },
        { "jose-elias-alvarez/null-ls.nvim" },
        { "nvim-lua/plenary.nvim" },
        { "glepnir/lspsaga.nvim" },
    },
    config = function()
        local lsp = require "lsp-zero"
        local has_lsp_saga, lsp_saga = pcall(require, "lspsaga")
        local lsp_group = vim.api.nvim_create_augroup("lsp", {})

        lsp.preset {
            name = "lsp-only",
            -- only use lsp-zero keymaps if we dont have lspsaga available
            set_lsp_keymaps = has_lsp_saga == false,
        }

        lsp.nvim_workspace {
            library = vim.api.nvim_get_runtime_file("", true),
        }

        lsp.on_attach(function(_, bufnr)
            local opts = { buffer = bufnr }

            vim.keymap.set("n", "gd", "<cmd>Lspsaga lsp_finder<cr>", opts)
            vim.keymap.set("n", "gr", "<cmd>Lspsaga rename<cr>", opts)
            vim.keymap.set("n", "gR", "<cmd>Lspsaga rename ++project<cr>", opts)
            vim.keymap.set("n", "ga", "<cmd>Lspsaga code_action<cr>", opts)
            vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<cr>", opts)
            vim.keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<cr>", opts)
            vim.keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<cr>", opts)
            vim.keymap.set("n", "}d", "<cmd>Lspsaga show_buf_diagnostics<cr>", opts)
            vim.keymap.set("n", "{d", "<cmd>Lspsaga show_workspace_diagnostics<cr>", opts)
        end)

        lsp.set_sign_icons {
            error = "✘",
            warn = "▲",
            hint = "⚑",
            info = "»",
        }

        lsp.setup()

        lsp_saga.setup()

        local null_ls = require "null-ls"
        local builtin = require "null-ls.builtins"
        null_ls.setup {
            sources = {
                builtin.formatting.stylua,
                builtin.formatting.prettierd.with {
                    extra_filetypes = { "svelte" },
                },
                builtin.diagnostics.eslint_d.with {
                    condition = function(utils)
                        return utils.root_has_file { ".eslintrc", ".eslintrc.js" }
                    end,
                },
                builtin.formatting.mix.with {
                    extra_filetypes = { "eelixir" },
                },
                builtin.diagnostics.credo.with {
                    extra_filetypes = { "eelixir" },
                },
            },
            on_attach = function(client, bufnr)
                if client.supports_method "textDocument/formatting" then
                    vim.api.nvim_clear_autocmds {
                        group = lsp_group,
                        buffer = bufnr,
                    }
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        group = lsp_group,
                        buffer = bufnr,
                        callback = function()
                            vim.lsp.buf.format {
                                id = client.id,
                                async = false,
                                bufnr = bufnr,
                            }
                        end,
                    })
                end
            end,
        }
    end,
}
