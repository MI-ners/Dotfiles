vim.pack.add({
    { src = "https://github.com/folke/which-key.nvim" },
})

local wk = require("which-key")
wk.setup({
    triggers = {},
})

-- 2. Keybinds: Set these manually (setup() doesn't handle keys in native setup)
vim.keymap.set("n", "<F12>", function() wk.show() end, { desc = "Panic Button" })
