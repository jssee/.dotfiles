return {
    "romainl/vim-qf",
    lazy = false,
    dependencies = {
        {
            "yorickpeterse/nvim-pqf",
            config = true,
            opts = {
                signs = {
                    error = { text = "✘", hl = "DiagnosticSignError" },
                    warning = { text = "▲", hl = "DiagnosticSignWarn" },
                    info = { text = "»", hl = "DiagnosticSignInfo" },
                    hint = { text = "⚑", hl = "DiagnosticSignHint" },
                },
            },
        },
    },
    init = function()
        vim.g.qf_mapping_ack_style = 1
    end,
    keys = {
        {
            [[\]],
            [[<Plug>(qf_qf_toggle_stay)]],
        },
        {
            [[|]],
            [[<Plug>(qf_loc_toggle_stay)]],
        },
    },
}
