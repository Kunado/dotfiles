let g:fzf_command_prefix = 'Fzf'

let $FZF_DEFAULT_OPTS="--layout=reverse"
let $FZF_DEFAULT_COMMAND="rg --files --hidden --glob '!.git/**'"
let g:fzf_layout = {'up': '~90%', 'window': { 'width': 0.8, 'height': 0.8, 'yoffset': 0.5, 'xoffset': 0.5, 'border': 'sharp' } }

nnoremap <silent> <leader>f :FzfFiles<CR>
nnoremap <silent> <leader>g :FzfGFiles<CR>
nnoremap <silent> <leader>G :FzfGFiles?<CR>
nnoremap <silent> <leader>b :FzfBuffers<CR>
nnoremap <silent> <leader>h :FzfHistory<CR>
nnoremap <silent> <leader>r :FzfRg<CR>
