vim.g.mapleader = " "

-- init the notes before anything else!
vim.g.vimwiki_list = {
	{
		path = "~/vimwiki/",
		syntax = "markdown",
		ext = ".md",
	},
}
vim.g.vimwiki_global_ext = 0
vim.g.vimwiki_markdown_link_ext = 1

--Plugins
require("plugins.lspStuff")
require("plugins.treesitter")
require("plugins.telescope")
require("plugins.colorscheme")
require("plugins.lualine")
require("plugins.nvimCmp")
require("plugins.indents")
require("plugins.misc")
require("plugins.showkeys")
require("plugins.tmuxNav")
require("plugins.dashboard")
require("plugins.whichkey")
require("plugins.oil")
require("plugins.vimWiki")
require("plugins.tinygo")

--Vim stuff
require("vimOpts")
require("vimbinds")

-- Yank highlight
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

--code_action
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		vim.keymap.set({ "n", "v" }, "gra", vim.lsp.buf.code_action, { buffer = ev.buf, desc = "Code actions" })
	end,
})

