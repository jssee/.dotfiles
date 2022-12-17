local has_leap, _ = pcall(require, "leap")

if not has_leap then
    return
end

local M = {}

function M.setup()
    My.nmap { "<cr>", "<Plug>(leap-forward)", remap = true }
    My.nmap { "<s-cr>", "<Plug>(leap-backward)", remap = true }
    My.nmap { "#", "<Plug>(leap-cross-window)", remap = true }
end

return M
