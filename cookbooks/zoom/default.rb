if node[:platform] == 'darwin'
  execute "install zoom" do
    command "brew install zoom --cask"
    not_if "brew list --cask | grep -q zoom"
  end
else
  raise NotImplementedError
end
