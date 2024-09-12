local on_attach = function(client, _)
    -- disable lsp formatting in favor of conform
    client.server_capabilities.docuementFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
end

return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "yioneko/nvim-vtsls",
    },
    config = function()
        local lsp = require "lspconfig"

        local default_handler = function(server)
            lsp[server].setup {}
        end

        require("mason").setup {}
        require("mason-lspconfig").setup {
            ensure_installed = {
                "lua_ls",
            },
            handlers = {
                default_handler,
            },
        }

        local ICONS = {
            ERROR = "✘",
            WARN = "▲",
            HINT = "⚑",
            INFO = "»",
        }

        vim.diagnostic.config {
            signs = {
                text = {
                    [vim.diagnostic.severity.ERROR] = ICONS.ERROR,
                    [vim.diagnostic.severity.HINT] = ICONS.HINT,
                    [vim.diagnostic.severity.INFO] = ICONS.INFO,
                    [vim.diagnostic.severity.WARN] = ICONS.WARN,
                },
            },
        }
    end,
    init = function()
        vim.api.nvim_create_autocmd("LspAttach", {
            desc = "setup lsp actions",
            group = vim.api.nvim_create_augroup("lsp", { clear = true }),
            callback = function(event)
                local client = vim.lsp.get_client_by_id(event.data.client_id)
                on_attach(client, event.buf)
            end,
        })
    end,
}
