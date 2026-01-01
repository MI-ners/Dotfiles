vim.pack.add({
	{ src = "https://github.com/stevearc/conform.nvim" },
})

require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "isort", "black" },
		go = { "gofumpt" },
		html = { "prettier", "prettierd", stop_after_first = true },
		css = { "prettier", "prettierd", stop_after_first = true },
		markdown = { "prettier", "prettierd", stop_after_first = true },
	},
	format_on_save = {
		timeout_ms = 500,
		lsp_format = "fallback",
	},
})
