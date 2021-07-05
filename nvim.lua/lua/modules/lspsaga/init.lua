local saga = require 'lspsaga'
saga.init_lsp_saga {border_style = 'round'}

local opts = {noremap = true, silent = true}

vim.api.nvim_set_keymap("n", "<Leader>clf", ":Lspsaga lsp_finder<CR>", opts)
vim.api.nvim_set_keymap("n", "<Leader>ca", ":Lspsaga code_action<CR>", opts)
vim.api.nvim_set_keymap("v", "<Leader>ca", ":<C-U>Lspsaga range_code_action<CR>", opts)
vim.api.nvim_set_keymap("n", "<Leader>k", ":Lspsaga hover_doc<CR>", opts)
vim.api.nvim_set_keymap("n", "<Leader>sd", ":Lspsaga show_line_diagnostics<CR>", opts)
vim.api.nvim_set_keymap("n", "<Leader>sh", ":Lspsaga signature_help<CR>", opts)
vim.api.nvim_set_keymap("n", "<Leader>lr", ":Lspsaga rename<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-f>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-b>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>", opts)
vim.api.nvim_set_keymap("n", "<Leader>pd", ":Lspsaga preview_definition<CR>", opts)
vim.api.nvim_set_keymap("n", "[d", ":Lspsaga diagnostic_jump_next<CR>", opts)
vim.api.nvim_set_keymap("n", "]d", ":Lspsaga diagnostic_jump_prev<CR>", opts)
vim.api.nvim_set_keymap("n", "<Leader>ot", ":Lspsaga open_floaterm<CR>", opts)
vim.api.nvim_set_keymap("t", "<Leader>ct", "<C-\\><C-n>:Lspsaga close_floaterm<CR>", opts)

