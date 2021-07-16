vim.g.minimap_width = 10
vim.g.minimap_auto_start = 0
vim.g.minimap_auto_start_win_enter = 0
vim.g.minimap_highlight_range = 1

local opts = {noremap = true, silent = true}
vim.api.nvim_set_keymap('n', '<Leader>mm', ':MinimapToggle<CR>', opts)

