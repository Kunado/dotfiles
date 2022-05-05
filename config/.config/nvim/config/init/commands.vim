command! -nargs=* -range GitBrowseRemote !git browse-remote --rev -L<line1>,<line2> <f-args> -- %
vmap gb :GitBrowseRemote<CR>
