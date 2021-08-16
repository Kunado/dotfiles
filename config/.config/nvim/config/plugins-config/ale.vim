let g:ale_sign_error = ''
let g:ale_sign_warning = ''
let g:airline#extensions#ale#enabledd = 1
let g:airline#extensions#ale#open_lnum_symbol = '('
let g:airline#extensions#ale#close_lnum_symbol = ')'
let g:ale_echo_msg_format = '[%linter%]%code: %%s'
highlight link ALEErrorSign Tag
highlight link ALEWarningSign StorageClass

let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_enter = 0
let g:ale_linters_explicit = 1

let g:ale_linters = {
\  'javascript': ['eslint'],
\  'typescript': ['eslint', 'tsserver'],
\  'typescriptreact': ['eslint', 'tsserver'],
\  'css': ['prettier'],
\  'json': ['jsonlint'],
\  'dockerfile': ['hadolint']
\}

let g:ale_fix_on_save = 1

let g:ale_fixers = {
\  'javascript': ['prettier'],
\  'typescript': ['prettier'],
\  'json': ['prettier'],
\  'typescriptreact': ['prettier'],
\}

let g:ale_typescript_prettier_use_local_config = 1

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
