return {
    "vonheikemen/lsp-zero.nvim",
    branch = "v3.x",
    dependencies = {
        { "neovim/nvim-lspconfig" },
        { "williamboman/mason.nvim" },
        { "williamboman/mason-lspconfig.nvim" },
    },
    config = function()
        local lsp_zero = require("lsp-zero").preset { name = "lsp-only" }

        lsp_zero.on_attach(function(_, bufnr)
            -- :help lsp-zero-keybindings
            lsp_zero.default_keymaps { buffer = bufnr }
        end)

        lsp_zero.set_sign_icons {
            error = "✘",
            warn = "▲",
            hint = "⚑",
            info = "»",
        }

        require("mason").setup {}
        require("mason-lspconfig").setup {
            ensure_installed = {
                "lua_ls",
                "tsserver",
            },
            handlers = {
                lsp_zero.default_setup,
                lua_ls = function()
                    -- configure lua language server
                    local lua_opts = lsp_zero.nvim_lua_ls()
                    require("lspconfig").lua_ls.setup(lua_opts)
                end,
            },
        }
    end,
}
