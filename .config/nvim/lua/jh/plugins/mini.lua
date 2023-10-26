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
                function(...)
                    if not require("mini.files").close() then
                        require("mini.files").open(...)
                    end
                end,
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
                    starter.sections.recent_files(6, true),
                    starter.sections.recent_files(4, false),
                    starter.sections.builtin_actions(),
                },
            }
        end,
    },
    { "echasnovski/mini.surround", version = false, config = true },
}
