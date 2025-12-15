vim.g.mapleader = " "

--Plugins require("plugins.treesitter")
require("plugins.telescope")
require("plugins.colorscheme")
require("plugins.lualine")
require("plugins.lspStuff")
require("plugins.nvimCmp")
require("plugins.indents")
require("plugins.fugutive")
require("plugins.showkeys")

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
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    vim.keymap.set({'n', 'v'}, 'gra', vim.lsp.buf.code_action, {buffer=ev.buf, desc = "Code actions"})
  end,
})

