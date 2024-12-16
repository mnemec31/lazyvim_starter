local lsp = vim.g.lazyvim_python_lsp or "pyright"

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ty = { enabled = lsp == "ty" },
        pyright = { enabled = lsp == "pyright" },
      },
    },
  },
}
