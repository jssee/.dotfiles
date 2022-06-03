local has_lspconfig, lspconfig = pcall(require, "lspconfig")
local root = vim.fn.stdpath "cache"
    .. "/lspconfig/sumneko_lua/lua-language-server/"
local binary = root .. "bin/lua-language-server"

if not has_lspconfig then
    return
end

local settings = {
    Lua = {
        runtime = {
            version = "LuaJIT",
            path = vim.split(package.path, ";"),
        },
        diagnostics = {
            globals = { "vim" },
        },
        workspace = {
            library = vim.api.nvim_get_runtime_file("", true),
        },
        telemetry = {
            enable = false,
        },
    },
}

local M = {}

M.setup = function(on_attach)
    lspconfig.sumneko_lua.setup {
        on_attach = function(client, bufnr)
            -- we are using null-ls + stylua for formatting
            client.resolved_capabilities.document_formatting = false
            on_attach(client)
        end,
        cmd = { binary, "-E", root .. "main.lua" },
        settings = settings,
        flags = {
            debounce_text_changes = 150,
        },
    }
end

return M
