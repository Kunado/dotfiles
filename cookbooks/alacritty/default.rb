if node[:platform] == 'darwin'
  execute "install alacritty" do
    command "brew install alacritty --cask"
    not_if "brew cask list | grep -q alacritty"
  end
  dotfile 'alacritty.yml' do
    source 'alacritty.darwin.yml'
  end
elsif node[:platform] == 'ubuntu'
  dotfile 'alacritty.yml' do
    source 'alacritty.ubuntu.yml'
  end
else
  raise NotImplementedError
end
