if node[:platform] == 'darwin'
  package 'ffmpeg'
else
  raise NotImplementedError
end
