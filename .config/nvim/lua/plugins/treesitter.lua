vim.pack.add({
		{src = "https://github.com/nvim-treesitter/nvim-treesitter", version ="master"}
})

require('nvim-treesitter.configs').setup ({
  ensure_installed = { "cpp", "lua", "vim", "vimdoc", "python", "go", },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    disable = function(lang, buf)
      local max_filesize = 100 * 1024 -- 100 KB
      local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
      if ok and stats and stats.size > max_filesize then
	return true
      end
    end,
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true,
  },
})

vim.api.nvim_create_autocmd('PackChanged', {
  desc = 'Handle nvim-treesitter updates',
  group = vim.api.nvim_create_augroup('nvim-treesitter-pack-changed-update-handler', { clear = true}),
  callback = function(event)
    if event.data.kind == 'update' then
      ---@diagnostic disable-next-line: param-type-mismatch
      local ok = pcall(vim.cmd, 'TSUpdate')
      if ok then
	vim.notify('TSUpdate completed successfully!', vim.log.levels.INFO)
      else
	vim.notify('TSUpdate command not available yet, skipping', vim.log.levels.WARM)
      end
    end
  end,
})
