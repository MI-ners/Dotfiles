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

-- autocomplete on the cmd bar?
vim.opt.wildmode = "noselect"
vim.api.nvim_create_autocmd("CmdlineChanged", {
  pattern = ":",
  callback = function ()
    vim.fn.wildtrigger()
  end
})

