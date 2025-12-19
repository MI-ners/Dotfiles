vim.g.mapleader = " "

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
require("plugins.notes")
require("plugins.whichkey")
require("plugins.oil")

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

--notes stuff
local notes_group = vim.api.nvim_create_augroup("NotesSync", { clear = true })
local notes_path = vim.fn.expand("~/zettelkasten")

-- Auto-sync with git -- notes
vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = notes_path .. "/*.md",
	group = notes_group,
	callback = function()
		vim.fn.jobstart({ "git", "-C", notes_path, "add", "." }, {
			on_exit = function()
				vim.fn.jobstart({ "git", "-C", notes_path, "commit", "-m", "Auto-sync: " .. os.date() }, {
					on_exit = function()
						-- Push silently
						vim.fn.jobstart({ "git", "-C", notes_path, "push" })
					end,
				})
			end,
		})
		print("Notes Synced to Git!")
	end,
})


