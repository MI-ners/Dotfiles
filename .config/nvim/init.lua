vim.g.mapleader = " "
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
require("plugins.mini")
require("plugins.colorscheme")
require("plugins.nvimCmp")
require("plugins.showkeys")
require("plugins.tmuxNav")
require("plugins.whichkey")
require("plugins.oil")
require("plugins.vimWiki")
require("plugins.vimTest")

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

-- statusline
vim.api.nvim_set_hl(0, "StatusLine", { fg = "#dde1e6", bg = "#262626" })
vim.api.nvim_set_hl(0, "StatusLineNC", { fg = "#525252", bg = "#161616" })
vim.api.nvim_set_hl(0, "StGit", { fg = "#be95ff", bg = "#262626" })

local function get_git_branch()
	if package.loaded["mini.git"] then
		local data = require("mini.git").get_buf_data(0)
		if data and data.head then
			local head = data.head
			if #head > 7 and not head:find("/") and not head:find(" ") then
				head = head:sub(1, 7)
			end
			return "  Git: " .. head
		end
	end
	return ""
end

function Statusline_Text_Only()
	return table.concat({
		"%#StatusLine#",
		" %f",
		"%m",
		"%r",
		"%=",
		"%#StGit#",
		get_git_branch(),
		"%#StatusLine#",
		"  ",
		"%{&filetype}",
		"  ",
		"%{&fileencoding?&fileencoding:&encoding}",
		"  ",
		"%l:%c",
		"  %P  ",
	})
end

vim.opt.laststatus = 3
vim.opt.statusline = "%!v:lua.Statusline_Text_Only()"
