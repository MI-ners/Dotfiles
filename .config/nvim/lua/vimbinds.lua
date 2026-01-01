-- Vim vanilla keymaps
vim.keymap.set("n", "<leader>e", ":Oil<CR>", { desc = "Oil/Explorer" })
vim.keymap.set("n", "<leader>q", ":quit<CR>", { desc = "Quit" })

vim.keymap.set("n", "<leader>r", ":write<CR>", { desc = "Format/Save" })

-- move text up or down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- hover
vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0, desc = "LSP Hover" })

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
vim.keymap.set("n", "<leader>ff", ":Pick files<CR>", { desc = "Find Files" })
vim.keymap.set("n", "<leader>fh", ":Pick help<CR>", { desc = "Find Help" })

--code_action
vim.keymap.set({ "n", "v" }, "gra", vim.lsp.buf.code_action, { desc = "Code actions" })
