vim.pack.add({
    { src = "https://github.com/mason-org/mason.nvim" },
    { src = "https://github.com/neovim/nvim-lspconfig" },
    { src = "https://github.com/mason-org/mason-lspconfig.nvim" },
})

-- Mason
require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
        },
    },
})

--Mason lsp config
require("mason-lspconfig").setup({
    ensure_installed = { "lua_ls", "gopls", "marksman", "pyright", "clangd" },
})

--lua_ls conf
vim.lsp.config("lua_ls", {
    settings = {
        Lua = {
            stylua = true,
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false,
            },
            diagnostics = {
                globals = { "vim", "require" },
            },
            runtime = {
                version = "LuaJIT",
            },
            telemetry = {
                enable = false,
            },
        },
    },
})

-- go lsp
vim.lsp.config("gopls", {
    settings = {
        gopls = {
            gofumpt = true,
            analyses = {
                unusedparams = true,
            },
            staticcheck = true,
        },
    },
})

-- markdown lsp
vim.lsp.config("marksman", {
    filetypes = { "markdown", "wiki" },
})

-- htmx lsp
vim.lsp.config("htmx", {
    filetypes = { "html", "templ" },
})

-- css lsp
vim.lsp.config("cssls", {})
