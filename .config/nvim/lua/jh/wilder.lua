local has_wilder, wilder = pcall(require, "wilder")

if not has_wilder then
    return
end

wilder.setup {
    modes = { ":", "/", "?" },
    enable_cmdline_enter = 1,
}

My.cmap {
    "<Tab>",
    [[wilder#in_context() ? wilder#next() : '<tab>']],
    expr = true,
}
My.cmap {
    "<S-Tab>",
    [[wilder#in_context() ? wilder#previous() : '<s-tab>']],
    expr = true,
}

local popupmenu_renderer = wilder.popupmenu_renderer(
    wilder.popupmenu_border_theme {
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
    }
)

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
