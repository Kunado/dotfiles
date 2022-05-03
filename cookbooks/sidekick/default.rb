if node[:platform] == 'darwin'
  execute "install pushplaylabs-sidekick" do
    command "brew install pushplaylabs-sidekick --cask"
    not_if "brew list --cask | grep -q pushplaylabs-sidekick"
  end
else
  raise NotImplementedError
end
