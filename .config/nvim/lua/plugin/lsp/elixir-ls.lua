local has_lspconfig, lspconfig = pcall(require, "lspconfig")

local cmd = vim.fn.stdpath "cache" .. "/lspconfig/elixir-ls/language_server.sh"

if not has_lspconfig then
    return
end

local M = {}

M.setup = function(on_attach)
    lspconfig.elixirls.setup {
        on_attach = function(client, bufnr)
            on_attach(client)
        end,
        cmd = { cmd },
        settings = {
            dialyzerEnabled = false,
            fetchDeps = false,
        },
    }
end

return M
