" Ack.vim-inspired mappings available only in location/quickfix windows:
"    s - open entry in a new horizontal window
"    v - open entry in a new vertical window
"    t - open entry in a new tab
"    o - open entry and come back
"    o - open entry and close the location/quickfix window
"    p - open entry in a preview window
let g:qf_mapping_ack_style = 1

nmap )( <Plug>(qf_qf_toggle_stay)
nmap () <Plug>(qf_qf_switch)
nmap (( <Plug>(qf_qf_previous)
nmap )) <Plug>(qf_qf_next)

nmap ][ <Plug>(qf_loc_toggle_stay)
nmap [] <Plug>(qf_qf_switch)
nmap [[ <Plug>(qf_loc_previous)
nmap ]] <Plug>(qf_loc_next)
