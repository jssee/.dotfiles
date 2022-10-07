local has_leap, _ = pcall(require, "leap")

if not has_leap then
    return
end

local M = {}

function M.setup()
    My.nmap { "q", "<Plug>(leap-forward)", remap = true }
    My.nmap { "Q", "<Plug>(leap-backward)", remap = true }
    My.nmap { "qg", "<Plug>(leap-cross-window)", remap = true }
end

return M
