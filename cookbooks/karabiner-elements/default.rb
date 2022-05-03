if node[:platform] == 'darwin'
  execute "install karabiner-elements" do
    command "brew install karabiner-elements --cask"
    not_if "brew list --cask | grep -q karabiner-elements"
  end
else
  raise NotImplementedError
end
