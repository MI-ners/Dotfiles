vim.pack.add({
	{ src = "https://github.com/uhs-robert/oasis.nvim" },
})

-- Colorscheme
require("oasis").setup({
	vim.cmd.colorscheme("oasis-twilight"),
})

