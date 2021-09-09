local has_lspconfig, lspconfig = pcall(require, "lspconfig")
local lsp = vim.lsp
local nmap, vmap = require("utils.map").nmap, require("utils.map").vmap

if not has_lspconfig then
    return
end

lsp.handlers["textDocument/publishDiagnostics"] = lsp.with(
    lsp.diagnostic.on_publish_diagnostics,
    {
        underline = true,
        signs = true,
        virtual_text = false,
    }
)

local popup_opts = { border = "single", focusable = false }

lsp.handlers["textDocument/signatureHelp"] = lsp.with(
    lsp.handlers.signature_help,
    popup_opts
)

lsp.handlers["textDocument/hover"] = lsp.with(lsp.handlers.hover, popup_opts)

local on_attach = function(client)
    vim.api.nvim_buf_set_option(0, "omnifunc", "v:lua.vim.lsp.omnifunc")
    require("lspkind").init()
    nmap { "gq", [[<cmd>lua vim.lsp.buf.formatting()<CR>]] }
    vmap { "gq", [[<esc><cmd>lua vim.lsp.buf.range_formatting()<CR>]] }
end

lspconfig.cssls.setup {}
lspconfig.html.setup {}
lspconfig.tailwindcss.setup {}
require("plugin.lsp.elixir-ls").setup(on_attach)
require("plugin.lsp.null-ls").setup(on_attach)
require("plugin.lsp.sumneko").setup(on_attach)
require("plugin.lsp.tsserver").setup(on_attach)
require("plugin.trouble").setup()
require("plugin.saga").setup()
require("plugin.completion").setup()
