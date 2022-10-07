local has_lspconfig, lspconfig = pcall(require, "lspconfig")
local lsp = vim.lsp

if not has_lspconfig then
    return
end

lsp.handlers["textDocument/publishDiagnostics"] = lsp.with(
    lsp.diagnostic.on_publish_diagnostics,
    {
        underline = true,
        signs = true,
        virtual_text = false,
        update_in_insert = false,
    }
)

local popup_opts = { border = "single", focusable = false }

lsp.handlers["textDocument/signatureHelp"] = lsp.with(
    lsp.handlers.signature_help,
    popup_opts
)

lsp.handlers["textDocument/hover"] = lsp.with(lsp.handlers.hover, popup_opts)

local on_attach = function()
    vim.api.nvim_buf_set_option(0, "omnifunc", "v:lua.vim.lsp.omnifunc")

    My.nmap { "ga", [[<cmd>lua vim.lsp.buf.code_action()<CR>]] }
    My.vmap { "ga", [[<cmd>lua vim.lsp.buf.range_code_action()<CR>]] }
    My.nmap { "gq", [[<cmd>lua vim.lsp.buf.format({ async = true })<CR>]] }
    My.vmap { "gq", [[<esc><cmd>lua vim.lsp.buf.range_formatting()<CR>]] }

    My.nmap { "gd", [[<cmd>lua vim.lsp.buf.definition()<CR>]] }
    My.nmap { "K", [[<cmd>lua vim.lsp.buf.hover()<CR>]] }
    My.nmap { "gR", [[<cmd>lua vim.lsp.buf.rename()<CR>]] }

    augroup("format_lsp", {
        [[BufWritePre * silent! lua vim.lsp.buf.format()]],
    })

    require("jh.trouble").setup()
end

lspconfig.cssls.setup {}
lspconfig.html.setup {}
lspconfig.tailwindcss.setup {}

for _, server in ipairs {
    "elixir-ls",
    "null-ls",
    "sumneko",
    "tsserver",
} do
    require("jh.lsp." .. server).setup(on_attach)
end
