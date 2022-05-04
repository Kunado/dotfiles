if node[:platform] == 'darwin'
  execute "install alacritty" do
    command "brew install alacritty --cask"
    not_if "brew list --cask | grep -q alacritty"
  end

  execute "mkdir -p #{ENV['HOME']}/.config/alacritty" do
    not_if "test -d #{ENV['HOME']}/.config/alacritty"
  end
  dotfile '.config/alacritty/alacritty.yml' do
    source 'alacritty.darwin.yml'
    not_if "test -L #{ENV['HOME']}/.config/alacritty/alacritty.yml"
  end
elsif node[:platform] == 'ubuntu'
  dotfile 'alacritty.yml' do
    source 'alacritty.ubuntu.yml'
    not_if "test -L #{ENV['HOME']}/alacritty.yml"
  end
else
  raise NotImplementedError
end
