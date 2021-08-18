local has_completion, completion = pcall(require, "compe")
local npairs = require "nvim-autopairs"
local M = {}

npairs.setup {
  check_ts = true,
}

local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col "." - 1
    if col == 0 or vim.fn.getline("."):sub(col, col):match "%s" then
        return true
    else
        return false
    end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
    if vim.fn.pumvisible() == 1 then
        return t "<C-n>"
    elseif require("snippets").has_active_snippet() then
        return t "<cmd>lua return require'snippets'.expand_or_advance(1)<CR>"
    elseif check_back_space() then
        return t "<Tab>"
    else
        return vim.fn["compe#complete"]()
    end
end

_G.s_tab_complete = function()
    if vim.fn.pumvisible() == 1 then
        return t "<C-p>"
    elseif require("snippets").has_active_snippet() then
        return t "<cmd>lua return require'snippets'.advance_snippet(-1)<CR>"
    else
        return t "<S-Tab>"
    end
end

_G.completion_confirm = function()
    if vim.fn.pumvisible() ~= 0 then
        return npairs.esc "<cr>"
    else
        return npairs.autopairs_cr()
    end
end

function M.setup()
    if not has_completion then
        return
    end

    local config = {
        enabled = true,
        autocompletion = true,
        documentation = true,
        source = {
            omni = false,
            treesitter = false,
            path = true,
            buffer = true,
            nvim_lsp = true,
            snippets_nvim = true,
        },
    }

    vim.api.nvim_set_keymap(
        "i",
        "<Tab>",
        "v:lua.tab_complete()",
        { expr = true }
    )
    vim.api.nvim_set_keymap(
        "s",
        "<Tab>",
        "v:lua.tab_complete()",
        { expr = true }
    )
    vim.api.nvim_set_keymap(
        "i",
        "<S-Tab>",
        "v:lua.s_tab_complete()",
        { expr = true }
    )
    vim.api.nvim_set_keymap(
        "s",
        "<S-Tab>",
        "v:lua.s_tab_complete()",
        { expr = true }
    )

    vim.api.nvim_set_keymap(
        "i",
        "<C-y>",
        "compe#confirm('<C-y>')",
        { expr = true }
    )
    vim.api.nvim_set_keymap(
        "i",
        "<CR>",
        "v:lua.completion_confirm()",
        { expr = true, noremap = true }
    )
    completion.setup(config)
end

return M
