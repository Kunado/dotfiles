if node[:platform] == 'darwin'
  execute "install alacritty" do
    command "brew install alacritty --cask"
    not_if "brew list --cask | grep -q alacritty"
  end
  execute "mkdir -p #{ENV['HOME']}/.config/alacritty" do
    not_if "test -f #{ENV['HOME']}/.config/alacritty"
  end
  dotfile '.config/alacritty/alacritty.yml' do
    source 'alacritty.darwin.yml'
  end
elsif node[:platform] == 'ubuntu'
  dotfile 'alacritty.yml' do
    source 'alacritty.ubuntu.yml'
  end
else
  raise NotImplementedError
end
