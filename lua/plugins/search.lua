return {
  {
    "ibhagwan/fzf-lua",
    keys = {
      {
        "<leader><leader>",
        "<cmd>FzfLua resume <CR>",
        desc = "Search [r]esume",
      },
      {
        "<leader>snc",
        function()
          require("fzf-lua").live_grep({ cwd = "~/.config/nvim" })
        end,
        desc = "Search neovim configs",
      },
    },
  },
}
