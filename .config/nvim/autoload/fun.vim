scriptencoding utf-8

" Trims empty white spaces
" ========================
function! fun#trim()
  let save_cursor = getpos(".")
  let old_query = getreg('/')
  silent! %s/\s\+$//e
  call setpos('.', save_cursor)
  call setreg('/', old_query)
endfunction

function! fun#grep(...)
  return system(join([&grepprg] + [expandcmd(join(a:000, ' '))], ' '))
endfunction

function! fun#subop(type, ...)
  let cur = getpos("''")
  call cursor(cur[1], cur[2])
  let cword = expand('<cword>')
  execute "'[,']s/" . cword . "/" . input(cword . '/')
  call cursor(cur[1], cur[2])
endfunction

function! fun#sortop(type, ...)
  '[,']sort
endfunction

