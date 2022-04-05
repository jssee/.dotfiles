call wilder#enable_cmdline_enter()
cmap <expr> <Tab> wilder#in_context() ? wilder#next() : "\<Tab>"
cmap <expr> <S-Tab> wilder#in_context() ? wilder#previous() : "\<S-Tab>"

" only / and ? are enabled by default
call wilder#set_option('modes', [':', '/'])

call wilder#set_option('pipeline', [
      \   wilder#branch(
      \     wilder#python_file_finder_pipeline({
      \       'file_command': {_, arg -> stridx(arg, '.') != -1 ? ['fd', '-tf', '-H'] : ['fd', '-tf']},
      \       'dir_command': ['fd', '-td'],
      \       'filters': ['fuzzy_filter', 'difflib_sorter'],
      \       'cache_timestamp': {-> 1},}),
      \     wilder#cmdline_pipeline({
      \       'language': 'python',
      \       'fuzzy': 1,
      \     }),
      \     wilder#python_search_pipeline({
      \       'pattern': wilder#python_fuzzy_pattern(),
      \       'sorter': wilder#python_difflib_sorter(),
      \       'engine': 're',
      \     }),
      \   ),
      \ ])

" let s:scale = ['#f4468f', '#fd4a85', '#ff507a', '#ff566f', '#ff5e63',
"       \ '#ff6658', '#ff704e', '#ff7a45', '#ff843d', '#ff9036',
"       \ '#f89b31', '#efa72f', '#e6b32e', '#dcbe30', '#d2c934',
"       \ '#c8d43a', '#bfde43', '#b6e84e', '#aff05b']
" let s:gradient = map(s:scale, {i, fg -> wilder#make_hl(
"       \ 'WilderGradient' . i, 'Pmenu', [{}, {}, {'foreground': fg}]
"       \ )})

" " 'highlighter' : applies highlighting to the candidates
" call wilder#set_option('renderer', wilder#popupmenu_renderer({
"       \ 'highlighter': wilder#basic_highlighter(),
"       \ 'left': [
"       \   ' ', wilder#popupmenu_devicons(),
"       \ ],
"       \ }))

" call wilder#set_option('renderer', wilder#popupmenu_renderer(wilder#popupmenu_border_theme({
"       \ 'highlights': {
"       \   'border': 'Normal',
"       \   'gradient': s:gradient,
"       \ },
"       \ 'border': 'rounded',
"       \ })))

let s:popupmenu_renderer = wilder#popupmenu_renderer(wilder#popupmenu_border_theme({
      \ 'border': 'rounded',
      \ 'empty_message': wilder#popupmenu_empty_message_with_spinner(),
      \ 'highlighter': wilder#basic_highlighter(),
      \ 'left': [
      \   ' ',
      \   wilder#popupmenu_devicons(),
      \   wilder#popupmenu_buffer_flags({
      \     'flags': ' a + ',
      \     'icons': {'+': '', 'a': '', 'h': ''},
      \   }),
      \ ],
      \ 'right': [
      \   ' ',
      \ ],
      \ }))

let s:wildmenu_renderer = wilder#wildmenu_renderer({
      \ 'highlighter': wilder#basic_highlighter(),
      \ 'separator': ' · ',
      \ 'left': [' ', wilder#wildmenu_spinner(), ' '],
      \ 'right': [' ', wilder#wildmenu_index()],
      \ })

call wilder#set_option('renderer', wilder#renderer_mux({
      \ ':': s:popupmenu_renderer,
      \ '/': s:wildmenu_renderer,
      \ 'substitute': s:wildmenu_renderer,
      \ }))
