local has_sidebar, sidebar = pcall(require, "sidebar-nvim")
local u = require "jh.utils.map"

if not has_sidebar then
    return
end

u.nmap { "_", [[<cmd>SidebarNvimToggle<cr>]] }

sidebar.setup {
    open = true,
    side = "right",
    hide_statusline = true,
    sections = { "git", "buffers", "files" },
    disable_closing_prompt = true,
    files = {
        show_hidden = true,
        ignored_paths = { "%.git$" },
    },
    buffers = {
        ignored_buffers = {
            "Wilder",
            "packer",
        },
    },
}