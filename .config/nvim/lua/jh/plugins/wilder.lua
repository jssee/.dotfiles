return {
    "gelguy/wilder.nvim",
    enabled = false,
    opts = {
        modes = { ":", "/", "?" },
        enable_cmdline_enter = 1,
    },
    keys = {
        {
            "<tab>",
            function()
                local wilder = require "wilder"
                if wilder.in_context() then
                    wilder.next()
                else
                    return "<tab>"
                end
            end,
            mode = "c",
        },
        {
            "<s-tab>",
            function()
                local wilder = require "wilder"
                if wilder.in_context() then
                    wilder.previous()
                else
                    return "<s-tab>"
                end
            end,
            mode = "c",
        },
    },
    init = function()
        local wilder = require "wilder"
        local popupmenu_renderer = wilder.popupmenu_renderer(wilder.popupmenu_border_theme {
            border = "rounded",
            empty_message = wilder.popupmenu_empty_message_with_spinner(),
            highlighter = wilder.basic_highlighter(),
            left = {
                wilder.popupmenu_buffer_flags {
                    flags = " a + ",
                    icons = {
                        ["+"] = "M",
                        a = " ",
                        h = " ",
                    },
                },
            },
            right = { " " },
        })

        local wildmenu_renderer = wilder.wildmenu_renderer {
            highlighter = wilder.basic_highlighter(),
            separator = " · ",
            left = { " ", wilder.wildmenu_spinner(), " " },
            right = { " ", wilder.wildmenu_index() },
        }

        wilder.set_option(
            "pipeline",
            wilder.branch(
                wilder.python_file_finder_pipeline {
                    file_command = { "fd", "-tf", "-H" },
                    dir_command = { "fd", "-td" },
                    filters = { "fuzzy_filter", "difflib_sorter" },
                },
                wilder.cmdline_pipeline {
                    language = "python",
                    fuzzy = 2,
                },
                wilder.python_search_pipeline {
                    pattern = wilder.python_fuzzy_pattern(),
                    sorter = wilder.python_difflib_sorter(),
                    engine = "re",
                }
            )
        )

        wilder.set_option(
            "renderer",
            wilder.renderer_mux {
                [":"] = popupmenu_renderer,
                ["/"] = wildmenu_renderer,
                substitute = wildmenu_renderer,
            }
        )
    end,
}
