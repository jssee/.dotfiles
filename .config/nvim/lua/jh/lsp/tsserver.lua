local has_lspconfig, lspconfig = pcall(require, "lspconfig")
local has_ts_utils, ts_utils = pcall(require, "nvim-lsp-ts-utils")

if not has_lspconfig then
    return
end

local ts_utils_settings = {
    -- debug = true,
    enable_import_on_completion = true,
    import_all_scan_buffers = 100,
    eslint_bin = "eslint_d",
    eslint_enable_diagnostics = true,
    eslint_show_rule_id = true,
}

local M = {}

M.setup = function(on_attach)
    lspconfig.tsserver.setup {
        on_attach = function(client)
            client.resolved_capabilities.document_formatting = false
            on_attach(client)

            if has_ts_utils then
                ts_utils.setup(ts_utils_settings)
                ts_utils.setup_client(client)
                My.nmap { "gs", [[:TSLspOrganize<CR>]] }
                My.nmap { "qq", [[:TSLspFixCurrent<CR>]] }
            end
        end,
        flags = {
            debounce_text_changes = 150,
        },
    }
end

return M
