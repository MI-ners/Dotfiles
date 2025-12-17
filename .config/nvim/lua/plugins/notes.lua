vim.opt.termguicolors = true
vim.g.mkdp_filetypes = { "markdown", "telekasten" }
vim.g.mkdp_echo_preview_url = 1

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "markdown", "telekasten" },
	callback = function()
		vim.opt_local.conceallevel = 2
	end,
})

vim.pack.add({
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" },
	{ src = "https://github.com/renerocksai/calendar-vim" },
	{ src = "https://github.com/renerocksai/telekasten.nvim" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/MeanderingProgrammer/render-markdown.nvim" },
	{ src = "https://github.com/HakonHarnes/img-clip.nvim" },
	{ src = "https://github.com/iamcco/markdown-preview.nvim" },
})

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
	dailies = "daily",
	weeklies = "weekly",
	templates = "templates",
	image_subdir = "img",
	extension = ".md",
	template_new_daily = vim.fn.expand("~/zettelkasten/templates/daily.md"),
	plug_into_calendar = true,
	calendar_opts = {
		weeknm = 4,
		calendar_monday = 1,
		calendar_mark = "left-fit",
	},
})

vim.cmd("packadd markdown-preview.nvim")
vim.g.mkdp_browser = "app.zen_browser.zen"
vim.g.mkdp_echo_preview_url = 1
vim.g.mkdp_browser = "xdg-open"

local function filter_diagnostics(err, result, ctx, config)
    if not result or not result.diagnostics then
        return
    end

    local filtered_diagnostics = {}
    for _, diagnostic in ipairs(result.diagnostics) do
        local message = diagnostic.message or ""
        
        local is_link_error = message:match("Link to non%-existent document")
        
        local is_asset = message:match("%.pdf") or 
                         message:match("%.png") or 
                         message:match("%.jpg") or 
                         message:match("%.jpeg")

        if not (is_link_error and is_asset) then
            table.insert(filtered_diagnostics, diagnostic)
        end
    end

    result.diagnostics = filtered_diagnostics
    vim.lsp.diagnostic.on_publish_diagnostics(err, result, ctx, config)
end

vim.lsp.handlers["textDocument/publishDiagnostics"] = filter_diagnostics
