local has_leap, _ = pcall(require, "leap")

if not has_leap then
    return
end

local M = {}

function M.setup()
    My.nmap { "f", "<Plug>(leap-forward)", remap = true }
    My.nmap { "F", "<Plug>(leap-backward)", remap = true }
    My.nmap { "#", "<Plug>(leap-cross-window)", remap = true }
end

return M
