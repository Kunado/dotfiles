if node[:platform] == 'darwin'
  execute "install ticktick" do
    command "brew install ticktick --cask"
    not_if "brew list --cask | grep -q ticktick"
  end
else
  raise NotImplementedError
end
