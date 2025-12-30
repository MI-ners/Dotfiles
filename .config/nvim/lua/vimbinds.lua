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

-- buffer navigation aka native harpoon
-- changing marks nav
vim.keymap.set("n", "<leader>1", "'A", { desc = "Jump to Mark A" })
vim.keymap.set("n", "<leader>2", "'B", { desc = "Jump to Mark B" })
vim.keymap.set("n", "<leader>3", "'C", { desc = "Jump to Mark C" })
vim.keymap.set("n", "<leader>4", "'D", { desc = "Jump to Mark D" })

-- marking files
vim.keymap.set("n", "<leader>a", "mA", { desc = "Set Mark A (Slot 1)" })
vim.keymap.set("n", "<leader>s", "mB", { desc = "Set Mark B (Slot 2)" })
vim.keymap.set("n", "<leader>d", "mC", { desc = "Set Mark C (Slot 3)" })
vim.keymap.set("n", "<leader>g", "mD", { desc = "Set Mark C (Slot 4)" })

-- opens mini.pick for buffers
vim.keymap.set("n", "<leader><space>", function()
    require("mini.pick").builtin.buffers({
        tool = 'git',
        include_current = false,
    })
end, { desc = "Switch Buffer" })

-- deletes all current marks
vim.keymap.set("n", "<leader>X", function()
    vim.cmd("delmarks A-Z")
    print("Marks cleared (All Global Marks A-Z deleted).")
end, { desc = "Clear All Global Marks" })

--code_action
vim.keymap.set({ "n", "v" }, "gra", vim.lsp.buf.code_action, { desc = "Code actions" })
