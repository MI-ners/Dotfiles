-- Vim opts
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
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
vim.o.winborder = "double"

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

-- autocomplete on the cmd bar
vim.opt.wildmode = "noselect"
vim.api.nvim_create_autocmd("CmdlineChanged", {
	pattern = { ":", "/", "?" },
	callback = function()
		vim.fn.wildtrigger()
	end,
})

-- Yank highlight
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

-- just notifies if the lsp is active
vim.api.nvim_create_autocmd("LspProgress", {
	group = vim.api.nvim_create_augroup("UserLspReady", { clear = true }),
	callback = function(ev)
		local spinner = ev.data.params.value
		if spinner.kind == "end" and (spinner.title and spinner.title:match("Diagnosing")) then
			local client = vim.lsp.get_client_by_id(ev.data.client_id)
			local name = client and client.name or "LSP"
			vim.notify("" .. name .. " is fully ready", vim.log.levels.INFO)
		end
	end,
})
