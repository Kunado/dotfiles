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
