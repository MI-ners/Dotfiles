-- Vim opts
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.autoindent = true
vim.o.cindent = true
vim.o.swapfile = false
vim.o.number = true
vim.o.relativenumber = true
vim.o.mouse = ""
vim.o.termguicolors = true
vim.o.wrap = false
vim.o.signcolumn = "yes"
vim.o.clipboard = "unnamedplus"
vim.o.cursorline = true
vim.o.ignorecase = true
vim.o.incsearch = true
vim.o.undofile = true
vim.o.winborder = "rounded"

-- Vim diagnosis
vim.diagnostic.config({
	virtual_text = {
		prefix = "●",
		format = function(diagnostic)
			if #diagnostic.message > 50 then
				return string.sub(diagnostic.message, 1, 50) .. "..."
			end
			return diagnostic.message
		end,
	},
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "go",
    group = indent_group,
    callback = function()
        vim.opt_local.expandtab = false -- Use real tabs
        vim.opt_local.tabstop = 4       -- Visual width of tab
        vim.opt_local.shiftwidth = 4    -- Indent width
    end,
})
