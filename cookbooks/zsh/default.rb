package 'zsh'

dotfile '.zsh' do
  not_if "test -d #{ENV['HOME']}/.zsh"
end
dotfile '.zshrc' do
  not_if "test -f #{ENV['HOME']}/.zshrc"
end
dotfile ".zshrc.#{node[:platform]}" do
  not_if "test -f #{ENV['HOME']}/.zshrc.#{node[:platform]}"
end
