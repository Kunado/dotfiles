package 'tmux'

dotfile '.tmux.conf' do
  not_if "test -L #{ENV['HOME']}/.tmux.conf"
end
dotfile '.tmux' do
  not_if "test -L #{ENV['HOME']}/.tmux"
end
