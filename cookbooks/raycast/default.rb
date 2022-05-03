if node[:platform] == 'darwin'
  execute "install raycast" do
    command "brew install raycast --cask"
    not_if "brew list --cask | grep -q raycast"
  end
else
  raise NotImplementedError
end
