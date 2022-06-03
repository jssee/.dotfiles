local has_trouble, trouble = pcall(require, "trouble")

local M = {}

function M.setup()
    if not has_trouble then
        return
    end

    local config = {
        icons = false,
        indent_lines = false,
        auto_close = true,
        fold_open = "⌄",
        fold_closed = "›",
        signs = {
            error = "❌ ",
            warning = "🚧 ",
            information = "💡 ",
            hint = "🔎 ",
            other = "💬 ",
        },
    }

    My.nmap { "gr", [[<cmd>Trouble lsp_references<CR>]] }
    -- My.nmap { "gd", [[<cmd>Trouble lsp_definitions<CR>]] }
    My.nmap { "gi", [[<cmd>Trouble lsp_implementations<CR>]] }
    My.nmap { "<leader>t", [[<cmd>TroubleToggle<CR>]] }

    trouble.setup(config)
end

return M
