-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<C-A-n>", "<cmd>try | cnext | catch | cfirst | catch | endtry<CR>", { desc = "Quickfix next" })
vim.keymap.set(
  "n",
  "<C-A-p>",
  "<cmd>try | cprevious | catch | clast | catch | endtry<CR>",
  { desc = "Quickfix previous" }
)
vim.keymap.set("n", "<C-A-o>", "<cmd>copen<CR>", { desc = "Quickfix open" })
vim.keymap.set("n", "<C-A-i>", "<cmd>cclose<CR>", { desc = "Quickfix close" })

-- Replace selected text in document
vim.keymap.set("n", "<leader>R", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gcI<Left><Left><Left>]], { desc = "Replace" })
vim.keymap.set("v", "<leader>R", [[:s/\<<C-r><C-w>\>/<C-r><C-w>/gcI<Left><Left><Left>]], { desc = "Replace" })

-- Bookmarks
vim.keymap.set({ "n", "v" }, "<leader>ba", "<cmd>BookmarksMark<CR>", { desc = "Bookmarks Insert" })
vim.keymap.set({ "n", "v" }, "<leader>bL", "<cmd>BookmarksList<CR>", { desc = "Bookmarks List" })
vim.keymap.set({ "n", "v" }, "<leader>bn", "<cmd>BookmarksNewList<CR>", { desc = "Bookmarks New List" })
vim.keymap.set({ "n", "v" }, "<leader>bs", "<cmd>BookmarksGoto<CR>", { desc = "Bookmarks Search" })
vim.keymap.set({ "n", "v" }, "<leader>bt", "<cmd>BookmarksTree<CR>", { desc = "Bookmarks Tree" })
vim.keymap.set({ "n", "v" }, "<leader>bi", "<cmd>BookmarksInfo<CR>", { desc = "Bookmarks Info" })

-- Format just visual
vim.keymap.set("v", "<leader>vf", function()
  local start_pos = vim.api.nvim_buf_get_mark(0, "<")
  local end_pos = vim.api.nvim_buf_get_mark(0, ">")
  vim.lsp.buf.format({ range = { start_pos, end_pos } })
end, { desc = "Format selected lines" })

-- Run Python file
vim.keymap.set("n", "<leader>rf", function()
  if vim.bo.filetype ~= "python" then
    vim.notify("Not a Python file", vim.log.levels.WARN)
    return
  end

  local file = vim.fn.expand("%:p")

  -- floating window dimensions
  local width = math.floor(vim.o.columns * 0.5)
  local height = math.floor(vim.o.lines * 0.5)
  local row = math.floor((vim.o.lines - height) / 2)
  local col = math.floor((vim.o.columns - width) / 2)

  -- create buffer
  local buf = vim.api.nvim_create_buf(false, true)

  -- window options
  local win = vim.api.nvim_open_win(buf, true, {
    relative = "editor",
    width = width,
    height = height,
    row = row,
    col = col,
    style = "minimal",
    border = "rounded",
  })

  -- start terminal
  vim.fn.termopen({ "uv", "run", file })

  -- enter insert mode automatically
  vim.cmd("startinsert")
end, { desc = "Run current Python file (uv) in popup" })

-- Copy filepath
vim.keymap.set("n", "<leader>cp", function()
  local path = vim.fn.expand("%:p")
  vim.fn.setreg("+", path)
  vim.notify("Copied full path:\n" .. path)
end, { desc = "Copy full file path" })
