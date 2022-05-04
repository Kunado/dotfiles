package 'zsh'

dotfile '.zsh' do
  not_if "test -L #{ENV['HOME']}/.zsh"
end
dotfile '.zshrc' do
  not_if "test -L #{ENV['HOME']}/.zshrc"
end
dotfile ".zshrc.#{node[:platform]}" do
  not_if "test -L #{ENV['HOME']}/.zshrc.#{node[:platform]}"
end
