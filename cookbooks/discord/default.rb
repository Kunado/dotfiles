if node[:platform] == 'darwin'
  execute "install discord" do
    command "brew install discord --cask"
    not_if "brew list --cask | grep -q discord"
  end
else
  raise NotImplementedError
end
