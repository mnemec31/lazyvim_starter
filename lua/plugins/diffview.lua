return {
  "sindrets/diffview.nvim",
  cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles", "DiffviewFileHistory" },
  keys = {
    { "<leader>gdd", "<cmd>DiffviewOpen<cr>", desc = "Diffview: working tree vs HEAD" },
    { "<leader>gdc", "<cmd>DiffviewOpen HEAD~1..HEAD<cr>", desc = "Diffview: last commit" },
    { "<leader>gdh", "<cmd>DiffviewFileHistory<cr>", desc = "Diffview: repo history" },
    { "<leader>gdfh", "<cmd>DiffviewFileHistory %<cr>", desc = "Diffview: file history" },
    { "<leader>gdb", "<cmd>DiffviewOpen develop...HEAD<cr>", desc = "Diffview: branch vs develop" },
  },
}
