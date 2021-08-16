lua << EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
  enable = true,
    },
  ensure_installed = 'maintained'
  }
EOF
