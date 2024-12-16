-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- vim.g.lazyvim_python_lsp = "basedpyright"
-- vim.g.lazyvim_python_lsp = "pyrefly"
if vim.fn.getcwd():find("televendcloud") then
  vim.g.lazyvim_python_lsp = "pyright"
else
  vim.g.lazyvim_python_lsp = "ty"
end
