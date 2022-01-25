local has_sidebar, sidebar = pcall(require, "sidebar-nvim")
local nmap = require("utils.map").nmap

if not has_sidebar then
    return
end

nmap {"_", [[<cmd>SidebarNvimToggle<cr>]]}

sidebar.setup {
    side = "right",
    hide_statusline = true,
    sections = { "git", "files" },
    disable_closing_prompt = true,
    files = {
        show_hidden = true,
        ignored_paths = { "%.git$" },
    },
}
