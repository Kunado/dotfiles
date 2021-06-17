" airline
nmap <C-p> <Plug>AirlineSelectPrevTab
nmap <C-n> <Plug>AirlineSelectNextTab

set ambiwidth=double
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#whitespace#mixed_indent_algo = 1
let g:airline_theme = 'iceberg'

let g:airline#extensions#tabline#buffer_idx_format = {
  \ '0': '0 ',
  \ '1': '1 ',
  \ '2': '2 ',
  \ '3': '3 ',
  \ '4': '4 ',
  \ '5': '5 ',
  \ '6': '6 ',
  \ '7': '7 ',
  \ '8': '8 ',
  \ '9': '9 '
  \}

let g:airline#extensions#tabline#left_sep = '\'
let g:airline#extensions#tabline#left_alt_sep = '\'

let g:airline_mode_map = {
  \ 'n' : 'Normal',
  \ 'i' : 'Insert',
  \ 'R' : 'Replace',
  \ 'c' : 'Command',
  \ 'v' : 'Visual',
  \ 'V' : 'V-Line',
  \ '^V' : 'V-Block',
  \ }

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'

" powerline symbols
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'

set t_Co=256
