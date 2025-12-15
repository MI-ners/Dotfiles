vim.pack.add({
  { src = "https://github.com/lukas-reineke/indent-blankline.nvim", version = "main" }
})

---@module "ibl"
---@type ibl.config
require("ibl").setup()
