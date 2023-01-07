return {
    "vonheikemen/lsp-zero.nvim",
    dependencies = {
        { "neovim/nvim-lspconfig" },
        { "williamboman/mason.nvim" },
        { "williamboman/mason-lspconfig.nvim" },
        { "jose-elias-alvarez/null-ls.nvim" },
        { "nvim-lua/plenary.nvim" },
    },
    config = function()
        local lsp = require "lsp-zero"
        local builtin = require "null-ls.builtins"
        local null_ls = require "null-ls"
        local lsp_group = vim.api.nvim_create_augroup("lsp_formatting", {})
        lsp.preset "lsp-only"

        lsp.nvim_workspace {
            library = vim.api.nvim_get_runtime_file("", true),
        }

        null_ls.setup {
            sources = {
                builtin.formatting.stylua,
                builtin.formatting.prettierd,
                builtin.diagnostics.eslint_d,
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
                            vim.lsp.buf.format { bufnr = bufnr }
                        end,
                    })
                end
            end,
        }

        lsp.setup()
    end,
}
