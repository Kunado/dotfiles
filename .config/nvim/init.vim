if &compatible
  set nocompatible
endif

set runtimepath+=~/dev/src/github.com/Shougo/dein.vim

if dein#load_state('~/dev/src')
  call dein#begin('~/dev/src')
  call dein#load_toml('~/.config/nvim/dein.toml', {'lazy': 0})
  call dein#load_toml('~/.config/nvim/dein_lazy.toml', {'lazy': 1})
  call dein#end()
  call dein#save_state()
endif
if dein#check_install()
  call dein#install()
endif

filetype plugin indent on
syntax enable

set number             "行番号を表示
set autoindent         "改行時に自動でインデントする
set tabstop=2          "タブを何文字の空白に変換するか
set shiftwidth=2       "自動インデント時に入力する空白の数
set expandtab          "タブ入力を空白に変換
set splitright         "画面を縦分割する際に右に開く
set clipboard=unnamed  "yank した文字列をクリップボードにコピー
set hls                "検索した文字をハイライトする
set laststatus=2
set t_Co=254
set encoding=UTF-8

let g:indent_guides_enable_on_vim_startup = 1

function! ZenkakuSpace()
  highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
endfunction

if has('syntax')
  augroup ZenkakuSpace
    autocmd!
    autocmd ColorScheme * call ZenkakuSpace()
    autocmd VimEnter,WinEnter,BufRead * let w:m1=matchadd('ZenkakuSpace', '　')
  augroup END
  call ZenkakuSpace()
endif

colorscheme molokai
let g:airline_theme = 'molokai'

let g:airline_mode_map = {
  \ 'n' : 'Normal',
  \ 'i' : 'Insert',
  \ 'R' : 'Replace',
  \ 'c' : 'Command',
  \ 'v' : 'Visual',
  \ 'V' : 'V-Line',
  \ '' : 'V-Block',
\}

let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconEnableFoldersOpenClose = 1

nmap sf :VimFilerBufferDir<Return>
nmap sF :VimFilerExplorer -find<Return>
nmap sb :Unite buffer<Return>
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_safe_mode_by_default = 0
let g:vimfiler_enable_auto_cd = 0
let g:vimfiler_tree_leaf_icon = ''
let g:vimfiler_tree_opened_icon = '▾'
let g:vimfiler_tree_closed_icon = '▸'
let g:vimfiler_marked_file_icon = '✓'
