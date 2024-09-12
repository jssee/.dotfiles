return {
    "echasnovski/mini.nvim",
    version = false,
    config = function()
        require("mini.ai").setup {}
        require("mini.align").setup {}
        require("mini.diff").setup {}
        require("mini.diff").setup {}
        require("mini.extra").setup {}
        require("mini.icons").setup {}
        require("mini.pairs").setup {}
        require("mini.surround").setup {}
        require("mini.bracketed").setup {}
        require("mini.indentscope").setup {
            symbol = "│",
        }
        require("mini.pick").setup {
            window = {
                config = {
                    height = math.floor(vim.o.lines * 0.2),
                    border = "none",
                },
            },
        }
    end,
    keys = {
        {
            "<leader><space>",
            function()
                require("mini.pick").builtin.files()
            end,
            desc = "open file picker",
        },
        {
            "-",
            function()
                local MiniFiles = require "mini.files"
                if not MiniFiles.close() then
                    MiniFiles.open(vim.api.nvim_buf_get_name(0))
                    MiniFiles.reveal_cwd()
                end
            end,
        },
    },
    init = function()
        vim.api.nvim_create_autocmd("User", {
            desc = "Add minifiles split keymaps",
            pattern = "MiniFilesBufferCreate",
            callback = function(args)
                local buf_id = args.data.buf_id
                local MiniFiles = require "mini.files"
                local map_split = function(buf, lhs, direction)
                    local rhs = function()
                        -- Make new window and set it as target
                        local new_target_window
                        vim.api.nvim_win_call(MiniFiles.get_target_window(), function()
                            vim.cmd(direction .. " split")
                            new_target_window = vim.api.nvim_get_current_win()
                        end)
                        MiniFiles.set_target_window(new_target_window)
                        MiniFiles.go_in()
                        MiniFiles.close()
                    end
                    local desc = "Split " .. direction
                    vim.keymap.set("n", lhs, rhs, { buffer = buf, desc = desc })
                end

                map_split(buf_id, "s", "belowright horizontal")
                map_split(buf_id, "v", "belowright vertical")
            end,
        })
    end,
}
