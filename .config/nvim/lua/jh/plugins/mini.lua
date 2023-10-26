return {
    {
        "echasnovski/mini.pick",
        version = false,
        config = true,
        keys = {
            {
                "<leader><space>",
                function()
                    require("mini.pick").builtin.files()
                end,
            },
            {
                "<c-f>",
                function()
                    require("mini.pick").builtin.grep_live()
                end,
            },
        },
    },
    {
        "echasnovski/mini.files",
        version = false,
        config = function()
            local MiniFiles = require "mini.files"
            local map_split = function(buf_id, lhs, direction)
                local rhs = function()
                    -- Make new window and set it as target
                    local new_target_window
                    vim.api.nvim_win_call(MiniFiles.get_target_window(), function()
                        vim.cmd(direction .. " split")
                        new_target_window = vim.api.nvim_get_current_win()
                    end)

                    MiniFiles.set_target_window(new_target_window)
                end

                -- Adding `desc` will result into `show_help` entries
                local desc = "Split " .. direction
                vim.keymap.set("n", lhs, rhs, { buffer = buf_id, desc = desc })
            end

            vim.api.nvim_create_autocmd("User", {
                pattern = "MiniFilesBufferCreate",
                callback = function(args)
                    local buf_id = args.data.buf_id
                    -- Tweak keys to your liking
                    map_split(buf_id, "<c-s>", "belowright horizontal")
                    map_split(buf_id, "<c-v>", "belowright vertical")
                    vim.keymap.set("n", "<tab>", "<nop>", { buffer = buf_id })
                end,
            })
        end,
        keys = {
            {
                "-",
                function()
                    if not require("mini.files").close() then
                        require("mini.files").open()
                    end
                end,
            },
        },
        opts = {
            windows = {
                preview = true,
                width_preview = 100,
            },
        },
    },
    { "echasnovski/mini.ai", version = false, config = true },
    { "echasnovski/mini.align", version = false, config = true },
    { "echasnovski/mini.comment", version = false, config = true },
    { "echasnovski/mini.move", version = false, config = true },
    { "echasnovski/mini.operators", version = false, config = true },
    { "echasnovski/mini.pairs", version = false, config = true },
    { "echasnovski/mini.splitjoin", version = false, config = true },
    {
        "echasnovski/mini.starter",
        version = false,
        config = function()
            local starter = require "mini.starter"
            starter.setup {
                evaluate_single = true,
                silent = true,
                items = {
                    starter.sections.recent_files(4, true),
                    starter.sections.recent_files(4, false),
                    starter.sections.builtin_actions(),
                },
            }
        end,
    },
    { "echasnovski/mini.surround", version = false, config = true },
}
