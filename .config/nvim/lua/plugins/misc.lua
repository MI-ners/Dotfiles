vim.pack.add({
	{ src = "https://github.com/tpope/vim-fugitive" },
	{ src = "https://github.com/kylechui/nvim-surround", version = "main" },
	{ src = "https://github.com/brenoprata10/nvim-highlight-colors" },
})

vim.opt.termguicolors = true
require("nvim-surround").setup()
require('nvim-highlight-colors').setup()

