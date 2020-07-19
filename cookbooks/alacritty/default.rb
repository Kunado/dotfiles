if node[:platform] == 'darwin'
  execute "install alacritty" do
    command "brew cask install alacritty"
    not_if "brew cask list | grep -q alacritty"
  end
else
  raise NotImplementedError
end
