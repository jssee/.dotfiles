return {
    "romainl/vim-qf",
    event = "QuickFixCmdPre",
    keys = {
        -- <Plug>(qf_qf_toggle_stay)
        -- <Plug>(qf_qf_switch)
        -- <Plug>(qf_qf_previous)
        -- <Plug>(qf_qf_next)

        -- <Plug>(qf_loc_toggle_stay)
        -- <Plug>(qf_qf_switch)
        -- <Plug>(qf_loc_previous)
        -- <Plug>(qf_loc_next)
        { "<c-n>", [[<Plug>(qf_qf_next)]] },
        { "<c-p>", [[<Plug>(qf_qf_previous)]] },
        { [[\]],   [[<Plug>(qf_qf_toggle_stay)]] },
    },
    init = function()
        -- Ack.vim-inspired mappings available only in location/quickfix windows:
        -- s - open entry in a new horizontal window
        -- v - open entry in a new vertical window
        -- t - open entry in a new tab
        -- o - open entry and come back
        -- o - open entry and close the location/quickfix window
        -- p - open entry in a preview window
        vim.g.qf_mapping_ack_style = 1
    end,
}
