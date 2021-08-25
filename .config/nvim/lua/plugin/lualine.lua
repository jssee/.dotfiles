local has_lualine, lualine = pcall(require, "lualine")

if not has_lualine then
    return
end

local function lsp_progress()
    local messages = vim.lsp.util.get_progress_messages()
    if #messages == 0 then
        return
    end
    local status = {}
    for _, msg in pairs(messages) do
        table.insert(
            status,
            (msg.percentage or 0) .. "%% " .. (msg.title or "")
        )
    end
    local spinners = {
        "⠋",
        "⠙",
        "⠹",
        "⠸",
        "⠼",
        "⠴",
        "⠦",
        "⠧",
        "⠇",
        "⠏",
    }
    local ms = vim.loop.hrtime() / 1000000
    local frame = math.floor(ms / 120) % #spinners
    return table.concat(status, " | ") .. " " .. spinners[frame + 1]
end

vim.cmd [[autocmd User LspProgressUpdate let &ro = &ro]]

lualine.setup {
    options = {
        theme = "tokyonight",
        section_separators = { " ", " " },
        component_separators = { " ", " " },
    },
    sections = {
        lualine_a = { "mode" },
        lualine_b = { "filename", "branch" },
        lualine_c = { { "diagnostics", sources = { "nvim_lsp" } } },
        lualine_x = { "diff" },
        lualine_y = { "filetype", lsp_progress },
        lualine_z = { "location" },
    },
}
