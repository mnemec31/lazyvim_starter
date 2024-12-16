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
vim.keymap.set("n", "<C-A-c>", "<cmd>cclose<CR>", { desc = "Quickfix close" })

-- Replace selected text in document
vim.keymap.set("n", "<leader>R", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gcI<Left><Left><Left>]])
vim.keymap.set("v", "<leader>R", [[:s/\<<C-r><C-w>\>/<C-r><C-w>/gcI<Left><Left><Left>]])
