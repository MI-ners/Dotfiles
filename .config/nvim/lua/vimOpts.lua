-- Vim opts
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.autoindent = true
vim.o.cindent = true
vim.o.swapfile = false
vim.o.number = true
vim.o.relativenumber = true
vim.o.mouse = ""
vim.o.termguicolors = true
vim.o.wrap = false
vim.o.signcolumn = "yes"
vim.o.clipboard = "unnamedplus"
vim.o.cursorline = true
vim.o.ignorecase = true
vim.o.incsearch = true
vim.o.undofile = true
vim.o.winborder = "double"

-- Vim diagnosis
vim.diagnostic.config({
    virtual_text = {
        prefix = "●",
        format = function(diagnostic)
            if #diagnostic.message > 50 then
                return string.sub(diagnostic.message, 1, 50) .. "..."
            end
            return diagnostic.message
        end,
    },
})


-- autocomplete on the cmd bar
vim.opt.wildmode = "noselect"
vim.api.nvim_create_autocmd("CmdlineChanged", {
    pattern = { ":", "/", "?" },
    callback = function()
        vim.fn.wildtrigger()
    end
})
