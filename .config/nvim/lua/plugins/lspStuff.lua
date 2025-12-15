vim.pack.add({
	{ src = 'https://github.com/mason-org/mason.nvim' },
	{ src = 'https://github.com/neovim/nvim-lspconfig' },
	{ src = 'https://github.com/mason-org/mason-lspconfig.nvim' },
	{ src = 'https://github.com/j-hui/fidget.nvim', version = '*' },
})

-- Mason
require("mason").setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
})

--Mason lsp config
require("mason-lspconfig").setup({
  ensure_installed = { "lua_ls", "gopls" },
})

local on_attach = function (client, bufnr)
  vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition)
end

vim.lsp.config("lua_ls", {
    on_attach = on_attach,
    settings = {
        Lua = {
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false,
            },
            diagnostics = {
                globals = { "vim", "require" },
            },
            runtime = {
                version = 'LuaJIT',
            },
            telemetry = {
                enable = false,
            },
        },
    },
})

vim.lsp.enable({ "lua_ls" })
