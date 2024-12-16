return {
  "christoomey/vim-tmux-navigator",
  -- Keymaps live in lua/config/keymaps.lua so they load AFTER LazyVim's
  -- default <C-h/j/k/l> window-nav maps and override them (avoids the
  -- <C-w> prefix `timeoutlen` lag). The plugin loads on first command use.
  cmd = {
    "TmuxNavigateLeft",
    "TmuxNavigateDown",
    "TmuxNavigateUp",
    "TmuxNavigateRight",
    "TmuxNavigatePrevious",
  },
}
