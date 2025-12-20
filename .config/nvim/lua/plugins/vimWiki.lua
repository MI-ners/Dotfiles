vim.pack.add({
	{ src = "https://github.com/vimwiki/vimwiki" },
	{ src = "https://github.com/MeanderingProgrammer/render-markdown.nvim" },
})

---@module 'render-markdown'
---@type render.md.UserConfig
require("render-markdown").setup({
	file_types = { "markdown", "vimwiki" },
})

vim.treesitter.language.register("markdown", "vimwiki")
