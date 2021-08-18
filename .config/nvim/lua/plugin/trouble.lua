local has_trouble, trouble = pcall(require, "trouble")
local nmap = require("utils.map").nmap
local M = {}

function M.setup()
    if not has_trouble then
        return
    end

    local config = {
        icons = false,
        indent_lines = false,
        auto_close = true,
    }

    nmap { "gr", [[<cmd>Trouble lsp_references<CR>]] }
    nmap { "gd", [[<cmd>Trouble lsp_definitions<CR>]] }
    nmap { "gi", [[<cmd>Trouble lsp_implementations<CR>]] }
    nmap { "<leader>t", [[<cmd>TroubleToggle<CR>]] }

    trouble.setup(config)
end

return M
