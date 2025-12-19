-- Vim vanilla keymaps
--vim.keymap.set("n", "<leader>e", ":Ex<CR>", { desc = "Explorer" })
vim.keymap.set("n", "<leader>e", ":Oil<CR>", { desc = "Oil/Explorer" })
vim.keymap.set("n", "<leader>w", ":write<CR>", { desc = "Write file" })
vim.keymap.set("n", "<leader>q", ":quit<CR>", { desc = "Quit" })

-- move text up or down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- hover
vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0, desc = "LSP Hover" })
vim.keymap.set({ "n", "v", "x" }, "<leader>lf", vim.lsp.buf.format, { desc = "Format current buffer" })

-- showkeys
vim.keymap.set("n", "<leader>sk", ":ShowkeysToggle<CR>", { desc = "Showkeys Toggle" })

-- go somewhere
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition " })
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Go to implementation " })
vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Go to references " })

--show full diagnostic
vim.keymap.set("n", "<leader>E", vim.diagnostic.open_float, { desc = "View Error" })

--notes
vim.keymap.set("n", "<leader>zc", ":Telekasten show_calendar<CR>", { desc = "Calendar" })
vim.keymap.set("n", "<leader>zn", ":Telekasten new_note<CR>", { desc = "New Note" })
vim.keymap.set("n", "<leader>zf", ":Telekasten find_notes<CR>", { desc = "Find Note" })
vim.keymap.set("n", "<leader>zz", ":Telekasten follow_link<CR>", { desc = "Follow Link" })
vim.keymap.set("n", "<leader>p", ":PasteImage<cr>", { desc = "Paste Image" })
vim.keymap.set("n", "<leader>mp", ":MarkdownPreviewToggle<cr>", { desc = "Preview Markdown" })

-- tells vim to shut up // when searching to be exact
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

