package 'tmux'

dotfile '.tmux.conf' do
  not_if "test -f #{ENV['HOME']}/.tmux.conf"
end
dotfile '.tmux' do
  not_if "test -d #{ENV['HOME']}/.tmux"
end
