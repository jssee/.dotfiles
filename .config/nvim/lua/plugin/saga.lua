local has_saga, saga = pcall(require, "lspsaga")
local augroup = require "utils.augroup"
local command = require "utils.command"
local nmap, vmap = require("utils.map").nmap, require("utils.map").vmap
local M = {}

function M.setup()
    if not has_saga then
        return
    end

    saga.init_lsp_saga {
        border_style = "round",
    }

    nmap { "gh", [[<cmd>LspFinder<CR>]] }
    nmap { "ga", [[<cmd>Lspsaga code_action<CR>]] }
    vmap { "ga", [[<cmd>Lspsaga code_action<CR>]] }
    nmap { "ge", [[<cmd>Lspsaga show_line_diagnostics<CR>]] }
    nmap { "gR", [[<cmd>Lspsaga rename<CR>]] }
    nmap { "K", [[<cmd>Lspsaga hover_doc<CR>]] }

    nmap {"[e", [[<cmd>Lspsaga diagnostic_jump_prev<CR>]]}
    nmap {"]e", [[<cmd>Lspsaga diagnostic_jump_next<CR>]]}

    command {
        "LspDiagLine",
        [[lua require('lspsaga.diagnostic').show_cursor_diagnostics()<cr>]],
    }
    command {
        "LspFinder",
        [[lua require('lspsaga.provider').lsp_finder()<cr>]],
    }

    augroup("Lsp", "CursorHold", "LspDiagLine")
end

return M
