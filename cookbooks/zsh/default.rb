package 'zsh'

dotfile '.zsh'
dotfile '.zshrc'
dotfile '.zshrc.local'
dotfile ".zshrc.local.#{node[:platform]}"
