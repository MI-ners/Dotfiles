vim.opt.conceallevel = 2
vim.opt.termguicolors = true

vim.pack.add({
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" },
	{ src = "https://github.com/renerocksai/calendar-vim" },
	{ src = "https://github.com/renerocksai/telekasten.nvim" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/MeanderingProgrammer/render-markdown.nvim" },
	{ src = "https://github.com/HakonHarnes/img-clip.nvim" },
	{ src = "https://github.com/iamcco/markdown-preview.nvim" },
})

-- 3. FORCE START TREESITTER (The Visual Engine)
local ts_config = require("nvim-treesitter.configs")
ts_config.setup({
	ensure_installed = { "markdown", "markdown_inline" },
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
})

require("render-markdown").setup({
	file_types = { "markdown", "telekasten" },
	render_modes = { "n", "c" },
	anti_conceal = { enabled = true },
	bullet = {
		icons = { "●", "○", "◆", "◇" },
	},
})

require("telekasten").setup({
	home = vim.fn.expand("~/zettelkasten"),
	take_over_my_home = true,
	auto_set_filetype = true,
	dailies = "~/zettelkasten/daily",
	weeklies = "~/zettelkasten/weekly",
	templates = "~/zettelkasten/templates",
	image_subdir = "img",
	extension = ".md",
	plug_into_calendar = true,
	calendar_opts = {
		weeknm = 4,
		calendar_monday = 1,
		calendar_mark = "left-fit",
	},
})

local map = vim.keymap.set
map("n", "<leader>zc", "<cmd>Telekasten show_calendar<CR>", { desc = "Calendar" })
map("n", "<leader>zn", "<cmd>Telekasten new_note<CR>", { desc = "New Note" })
map("n", "<leader>zf", "<cmd>Telekasten find_notes<CR>", { desc = "Find Note" })
map("n", "<leader>zz", "<cmd>Telekasten follow_link<CR>", { desc = "Follow Link" })
map("n", "<leader>p", "<cmd>PasteImage<cr>", { desc = "Paste Image" })
