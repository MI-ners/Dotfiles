vim.pack.add({
	{ src = "https://github.com/mfussenegger/nvim-lint.git" },
})

require("lint").linters_by_ft = {
	go = { "golangcilint" },
	css = { "stylelint" },
	html = { "htmlhint" },
	python = { "pylint" },
	cpp = { "cpplint" },
}

vim.api.nvim_create_autocmd({ "BufWritePost", "InsertLeave" }, {
	callback = function()
		require("lint").try_lint()
	end,
})
