vim.pack.add({
	{ src = "https://github.com/nvim-mini/mini.icons", version = "main" },
	{ src = "https://github.com/nvim-mini/mini.pick", version = "main" },
	{ src = "https://github.com/nvim-mini/mini.indentscope", version = "main" },
	{ src = "https://github.com/nvim-mini/mini.starter", version = "main" },
	{ src = "https://github.com/nvim-mini/mini-git", version = "main" },
	{ src = "https://github.com/nvim-mini/mini.surround", version = "main" },
})

require("mini.icons").setup()
require("mini.pick").setup({
	window = { config = { border = "double" } },
})
require("mini.indentscope").setup({
	draw = {
		delay = 0,
	},
})
require("mini.starter").setup()
require("mini.git").setup()
require("mini.surround").setup()
