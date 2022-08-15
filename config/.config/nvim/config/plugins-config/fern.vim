nmap <C-l> :Fern . -reveal=% -drawer -toggle -width=35<CR>
let g:fern#renderer = 'nerdfont'
let g:fern#default_hidden = 1

augroup my-glyph-palette
  autocmd! *
  autocmd FileType fern call glyph_palette#apply()
  autocmd FileType nerdtree,startify call glyph_palette#apply()
augroup END
