vim.g.mapleader = " "

--Vim stuff
require("vimOpts")
require("vimbinds")

--Plugins
require("plugins.lspStuff")
require("plugins.treesitter")
require("plugins.mini")
require("plugins.tsAuto-Tag")
require("plugins.colorscheme")
require("plugins.nvimCmp")
require("plugins.tmuxNav")
require("plugins.whichkey")
require("plugins.oil")
require("plugins.vimWiki")
require("plugins.vimTest")
require("plugins.dashboard")
require("plugins.conform")

-- statusline
vim.api.nvim_set_hl(0, "StatusLine", { fg = "#dde1e6", bg = "#262626" })
vim.api.nvim_set_hl(0, "StatusLineNC", { fg = "#525252", bg = "#161616" })
vim.api.nvim_set_hl(0, "StGit", { fg = "#be95ff", bg = "#262626" })
vim.api.nvim_set_hl(0, "StMrk", { fg = "#ff79c6", bg = "#262626" })

_G.get_mark_slot = function()
	local slot_map = { ["'A"] = "1", ["'B"] = "2", ["'C"] = "3", ["'D"] = "4" }
	local current_file = vim.fn.expand("%:p")
	if current_file == "" then
		return ""
	end
	for _, mark in ipairs(vim.fn.getmarklist()) do
		if slot_map[mark.mark] then
			if vim.fn.fnamemodify(mark.file, ":p") == current_file then
				return " [" .. slot_map[mark.mark] .. "] "
			end
		end
	end
	return ""
end

local function get_git_branch()
	if package.loaded["mini.git"] then
		local data = require("mini.git").get_buf_data(0)
		if data and data.head then
			local head = data.head
			if #head > 7 and not head:find("/") and not head:find(" ") then
				head = head:sub(1, 7)
			end
			return "Git: " .. head
		end
	end
	return ""
end

function Statusline_Text_Only()
	return table.concat({
		"%#StatusLine#",
		"%#StMrk#",
		"%{%v:lua.get_mark_slot()%}",
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
