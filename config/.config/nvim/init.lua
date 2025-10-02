require('editor')
require('plugins')
require('keymaps')

vim.api.nvim_create_autocmd('BufWritePost', {
	pattern = { 'plugins.lua' },
	command = 'PackerCompile'
})

vim.api.nvim_create_autocmd("FileType", { pattern = "TelescopeResults", command = [[setlocal nofoldenable]] })
