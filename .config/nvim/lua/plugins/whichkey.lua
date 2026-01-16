vim.pack.add({
	{ src = "https://github.com/folke/which-key.nvim" },
})

require("which-key").setup({
	triggers = {},
})

vim.keymap.set("n", "<F12>", function()
	require("which-key").show()
end, { desc = "Panic Button" })
