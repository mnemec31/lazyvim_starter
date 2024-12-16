-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Add this section to handle .avsc files as JSON
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  group = vim.api.nvim_create_augroup("lazyvim_avsc_json", { clear = true }), -- Unique augroup for .avsc
  pattern = "*.avsc",
  callback = function()
    vim.cmd("setfiletype json")
  end,
})

-- Markdown: spell check and diagnostics off by default (toggle back with <leader>us / <leader>ud)
vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("markdown_quiet", { clear = true }),
  pattern = "markdown",
  callback = function(args)
    vim.opt_local.spell = false
    vim.diagnostic.enable(false, { bufnr = args.buf })
  end,
})

-- TOML: format on save off by default (toggle back per buffer with <leader>uF)
vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("toml_no_autoformat", { clear = true }),
  pattern = "toml",
  callback = function()
    vim.b.autoformat = false
  end,
})
