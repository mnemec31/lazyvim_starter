return {
  {
    "ibhagwan/fzf-lua",
    opts = function(_, opts)
      opts[1] = "hide"
      opts.winopts = vim.tbl_deep_extend("force", opts.winopts or {}, {
        preview = {
          layout = "vertical",
        },
      })
      return opts
    end,
    keys = {
      {
        "<leader><leader>",
        "<cmd>FzfLua resume <CR>",
        desc = "Search [r]esume",
      },
      {
        "<leader>/",
        "<cmd>FzfLua grep_project <CR>",
        desc = "Grep project",
      },
      {
        "<leader>snc",
        function()
          require("fzf-lua").live_grep({ cwd = "~/.config/nvim" })
        end,
        desc = "Search neovim configs",
      },
      {
        "<leader>sA",
        function()
          require("fzf-lua").live_grep({ cwd = "~/repo" })
        end,
        desc = "Search All repos",
      },
      {
        "<leader>sQ",
        function()
          require("fzf-lua").grep_cword({ cwd = "~/repo" })
        end,
        desc = "Search All repos",
      },
      {
        "<leader>sb",
        "<cmd>FzfLua grep_curbuf <CR>",
        desc = "Search buffer",
      },
      {
        "<leader>sB",
        "<cmd>FzfLua lgrep_curbuf <CR>",
        desc = "Search buffer",
      },
    },
  },
}
