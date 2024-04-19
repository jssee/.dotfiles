-- mappings to open files in splits from mini.files explorer
local function map_split(buf_id, lhs, direction)
    local MiniFiles = require "mini.files"

    local function rhs()
        local window = MiniFiles.get_target_window()

        -- Noop if the explorer isn't open or the cursor is on a directory.
        if window == nil or MiniFiles.get_fs_entry().fs_type == "directory" then
            return
        end

        -- Make a new window and set it as target.
        local new_target_window
        vim.api.nvim_win_call(window, function()
            vim.cmd(direction .. " split")
            new_target_window = vim.api.nvim_get_current_win()
        end)

        MiniFiles.set_target_window(new_target_window)
        -- Go in and close the explorer.
        MiniFiles.go_in()
        MiniFiles.close()
    end

    vim.keymap.set("n", lhs, rhs, { buffer = buf_id, desc = "Split " .. string.sub(direction, 12) })
end

return {
    {
        "echasnovski/mini.pick",
        dependencies = {
            { "echasnovski/mini.extra", version = false, config = true },
        },
        version = false,
        config = true,
        lazy = false,
        opts = {
            window = {
                config = {
                    relative = "cursor",
                    anchor = "NW",
                    row = 0,
                    col = 0,
                    width = 40,
                    height = 20,
                },
            },
        },
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
        config = true,
        opts = {
            mappings = {
                go_in = "L",
                go_in_plus = "l",
            },
        },
        keys = {
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
                    map_split(buf_id, "<C-s>", "belowright horizontal")
                    map_split(buf_id, "<C-v>", "belowright vertical")
                end,
            })
        end,
    },
    {
        "echasnovski/mini.starter",
        version = false,
        config = function()
            local starter = require "mini.starter"
            starter.setup {
                evaluate_single = true,
                silent = true,
                items = {
                    starter.sections.pick(),
                    starter.sections.recent_files(4, false),
                    starter.sections.builtin_actions(),
                },
            }
        end,
    },
    { "echasnovski/mini.surround", version = false, config = true },
    { "echasnovski/mini.ai", version = false, config = true },
    { "echasnovski/mini.align", version = false, config = true },
    { "echasnovski/mini.comment", version = false, config = true },
    { "echasnovski/mini.operators", version = false, config = true },
    { "echasnovski/mini.pairs", version = false, config = true },
}
