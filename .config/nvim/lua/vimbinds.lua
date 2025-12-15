-- Vim vanilla keymaps
vim.keymap.set("n", "<leader>e", ":Ex<CR>")
vim.keymap.set("n", "<leader>w", ":write<CR>")

-- move text up or down 
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- hover
vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0, desc = "LSP Hover" })
vim.keymap.set({ "n", "v", "x" }, "<leader>lf", vim.lsp.buf.format, { desc = "Format current buffer" })

-- showkeys
vim.keymap.set("n", "<leader>sk", ":ShowkeysToggle<CR>")

-- go somewhere
vim.keymap.set("n", "gD", vim.lsp.buf.declaration)
vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "gi", vim.lsp.buf.implementation)
vim.keymap.set("n", "gr", vim.lsp.buf.references)

--show full diagnostic
vim.keymap.set('n', '<leader>E', vim.diagnostic.open_float)
