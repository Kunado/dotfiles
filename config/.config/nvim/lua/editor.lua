vim.opt.clipboard:append { 'unnamedplus' }

vim.opt.encoding = 'utf-8'
vim.scriptencoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'
vim.opt.fileformats = 'unix,dos,mac'

vim.opt.hidden = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.autoread = true
vim.opt.wildmenu = true
vim.opt.wildmode = 'list:longest'

vim.opt.backspace = 'indent,eol,start'

vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.foldmethod = 'indent'

vim.opt.termguicolors = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.list = true
vim.opt.showmatch = true
vim.opt.matchpairs = '(:),{:},[:],<:>'
vim.opt.matchtime = 3
vim.opt.wrap = true
vim.opt.scrolloff = 4
vim.opt.listchars = { tab = '>-', trail = '*', nbsp = '+' }
vim.opt.ambiwidth = 'single'

vim.opt.ignorecase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.smartcase = true
vim.opt.wrapscan = true

vim.opt.title = true

vim.opt.helplang = 'ja'
vim.opt.showtabline = 2

vim.opt.mouse = ''

vim.cmd 'colorscheme nightfox'
