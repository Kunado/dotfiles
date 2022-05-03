if node[:platform] == 'darwin'
  execute "install docker" do
    command "brew install docker --cask"
    not_if "brew list --cask | grep -q docker"
  end
else
  raise NotImplementedError
end
