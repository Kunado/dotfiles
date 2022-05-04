if node[:platform] == 'darwin'
  execute "install keycastr" do
    command "brew install keycastr --cask"
    not_if "brew list --cask | grep -q keycastr"
  end
else
  raise NotImplementedError
end
