require('nvim-ts-autotag').setup({
  opts = {
    -- Defaults
    enable_close = true, -- Auto close tags
    enable_rename = true, -- Auto rename pairs of tags
    enable_close_on_slash = false -- Auto close on trailing </
  },
  -- Also override individual filetype configs, these take priority.
  -- Empty by default, useful if one of the "opts" global settings
  -- doesn't work well in a specific filetype
  per_filetype = {
    ["html"] = {
      enable_close = false
    }
  }
})
--local status, ts = pcall(require, "nvim-treesitter.configs")
--if (not status) then return end
--
--ts.setup {
--  highlight = {
--    enable = true,
--    disable = {},
--  },
--  indent = {
--    enable = true,
--    disable = {},
--  },
--  ensure_installed = {
--    'tsx',
--    'toml',
--    'json',
--    'yaml',
--    'css',
--    'html',
--    'lua',
--    'gitignore',
--    'go',
--    'gomod',
--    'graphql',
--    'bash',
--    'dockerfile',
--    'make',
--    'python',
--    'ruby',
--    'rust',
--    'typescript',
--    'vim'
--  },
--  autotag = {
--    enable = true,
--  },
--}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
