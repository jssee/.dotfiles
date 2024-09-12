return {
    "hrsh7th/nvim-cmp",
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = {
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-nvim-lsp-signature-help",
        "hrsh7th/cmp-path",
        {
            "supermaven-inc/supermaven-nvim",
            config = true,
            lazy = false,
            opts = {
                color = {
                    suggestion_color = "#AA58A9",
                    cterm = 244,
                },
                keymaps = {
                    accept_suggestion = "<c-;>",
                    clear_suggestion = "<c-,>",
                    accept_word = "<down>",
                },
            },
        },
        {
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
        },
    },
    config = function()
        local cmp = require "cmp"
        local luasnip = require "luasnip"

        local supertab = function(select_opts)
            return cmp.mapping(function(fallback)
                local col = vim.fn.col "." - 1

                if cmp.visible() then
                    cmp.select_next_item(select_opts)
                elseif luasnip.expand_or_jumpable() then
                    luasnip.expand_or_jump()
                elseif col == 0 or vim.fn.getline("."):sub(col, col):match "%s" then
                    fallback()
                else
                    cmp.complete()
                end
            end, { "i", "s" })
        end

        local shift_supertab = function(select_opts)
            return cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item(select_opts)
                elseif luasnip.jumpable(-1) then
                    luasnip.jump(-1)
                else
                    fallback()
                end
            end, { "i", "s" })
        end

        cmp.setup {
            sources = cmp.config.sources({
                { name = "nvim_lua" },
                { name = "nvim_lsp" },
                { name = "nvim_lsp_signature_help" },
                { name = "luasnip" },
                { name = "path" },
            }, {
                { name = "buffer", keyword_length = 2 },
            }),
            mapping = {
                ["<c-y>"] = cmp.mapping.confirm { select = false },
                ["<c-e>"] = cmp.mapping.abort(),
                ["<up>"] = cmp.mapping.select_prev_item { behavior = "select" },
                ["<down>"] = cmp.mapping.select_next_item { behavior = "select" },
                ["<tab>"] = supertab(),
                ["<s-tab>"] = shift_supertab(),
            },
            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body)
                end,
            },
        }
    end,
}
