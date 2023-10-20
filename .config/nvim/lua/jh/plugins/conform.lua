return {
    "stevearc/conform.nvim",
    opts = {
        formatters_by_ft = {
            astro = { "prettierd" },
            css = { "prettierd" },
            html = { "prettierd" },
            javascript = { "prettierd" },
            lua = { "stylua" },
            python = { "isort", "black" },
            typescript = { "prettierd" },
        },
        format_on_save = {
            timeout_ms = 800,
            lsp_fallback = true,
        },
    },
    init = function()
        vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
        vim.api.nvim_create_autocmd("BufWritePre", {
            pattern = "*",
            callback = function(args)
                require("conform").format { bufnr = args.buf }
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
    end,
}
