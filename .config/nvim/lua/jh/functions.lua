local M = {}
local loop = vim.loop
local res = {}

M.Rg = function(...)
    vim.api.nvim_exec_autocmds("QuickFixCmdPre", { pattern = "cgetexpr", modeline = false })

    vim.fn.setqflist({}, " ", {
        title = "Rg Results",
        lines = vim.fn.systemlist {
            "rg",
            "--vimgrep",
            ...,
        },
    })

    vim.api.nvim_exec_autocmds("QuickFixCmdPost", { pattern = "cgetexpr", modeline = false })
end

M.Path = function()
    local stdout = loop.new_pipe(false)
    local stderr = loop.new_pipe(false)
    local onread = function(err, data)
        if err then
            print("ERROR: ", err)
        end

        if data then
            local vals = vim.split(data, "\n")
            for _, d in pairs(vals) do
                if d == "" then
                    goto continue
                end
                table.insert(res, d)
                ::continue::
            end
        end
    end

    local setpath = function()
        local paths = { ".," }
        for _, v in pairs(res) do
            table.insert(paths, v .. "/**")
        end

        vim.api.nvim_set_option("path", table.concat(paths, ","))
    end
    handle = loop.spawn(
        "fd",
        {
            args = {
                "--max-depth",
                "2",
                "-t",
                "d",
                "-E",
                "bin/",
                "-E",
                "pack/",
            },
            stdio = { stdout, stderr },
        },
        vim.schedule_wrap(function()
            stdout:read_stop()
            stderr:read_stop()
            stdout:close()
            stderr:close()
            handle:close()
            setpath()
        end)
    )
    loop.read_start(stdout, onread)
    loop.read_start(stderr, onread)
end

return M
