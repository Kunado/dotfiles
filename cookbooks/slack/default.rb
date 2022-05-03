if node[:platform] == 'darwin'
  execute "install slack" do
    command "brew install slack --cask"
    not_if "brew list --cask | grep -q slack"
  end
else
  raise NotImplementedError
end
