if node[:platform] == 'darwin'
  package 'fd'
else
  package 'fd-find'
end
