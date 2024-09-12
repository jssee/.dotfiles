return {
    "stevearc/conform.nvim",
    opts = {
        formatters_by_ft = {
            astro = { "prettier" },
            css = { "prettier" },
            html = { "prettier" },
            javascript = { "prettier" },
            javascriptreact = { "prettier" },
            lua = { "stylua" },
            svelte = { "prettier" },
            typescript = { "prettier" },
            typescriptreact = { "prettier" },
            go = { "gofmt" },
        },
        format_on_save = {
            timeout_ms = 800,
        },
    },
    init = function()
        vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
        vim.g.format_on_save = true

        vim.api.nvim_create_autocmd("BufWritePre", {
            pattern = "*",
            callback = function(args)
                if vim.g.format_on_save then
                    require("conform").format { bufnr = args.buf }
                end
            end,
        })

        vim.api.nvim_create_user_command("Format", function(args)
            local range = nil
            if args.count ~= -1 then
                local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
                range = {
                    start = { args.line1, 0 },
                    ["end"] = { args.line2, end_line:len() },
                }
            end
            require("conform").format { async = true, lsp_fallback = true, range = range }
        end, { range = true })

        vim.api.nvim_create_user_command("ToggleFormatOnSave", function()
            vim.g.format_on_save = not vim.g.format_on_save
        end, {})
    end,
}
