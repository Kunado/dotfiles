if node[:platform] == 'darwin'
  execute "install 1password" do
    command "brew install 1password --cask"
    not_if "brew list --cask | grep -q 1password"
  end
else
  raise NotImplementedError
end
