-- Vim vanilla keymaps
vim.keymap.set("n", "<leader>e", ":Oil<CR>", { desc = "Oil/Explorer" })
vim.keymap.set("n", "<leader>q", ":quit<CR>", { desc = "Quit" })

-- write/format conform style
vim.keymap.set({ "n", "v", "x" }, "<leader>r", function()
	vim.lsp.buf.format()
	vim.cmd("write")
end, { desc = "Format and Save" })

-- move text up or down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- hover
vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0, desc = "LSP Hover" })

-- showkeys
vim.keymap.set("n", "<leader>sk", ":ShowkeysToggle<CR>", { desc = "Showkeys Toggle" })

-- go somewhere
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition " })
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Go to implementation " })
vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Go to references " })

--show full diagnostic
vim.keymap.set("n", "<leader>E", vim.diagnostic.open_float, { desc = "View Error" })

-- tells vim to shut up // when searching to be exact
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- vimWiki previews
vim.keymap.set("n", "<leader>wp", ":LivePreview start<CR>", { desc = "Preview Current Markdown" })

--mini pick
vim.keymap.set("n", "<leader><space>", ":Pick files<CR>", { desc = "Find Files" })
vim.keymap.set("n", "<leader>fh", ":Pick help<CR>", { desc = "Find Help" })
