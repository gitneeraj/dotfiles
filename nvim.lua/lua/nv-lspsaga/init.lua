local saga = require 'lspsaga'
saga.init_lsp_saga()

vim.api.nvim_set_keymap("n", "<Leader>clf", ":Lspsaga lsp_finder<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<Leader>ca", ":Lspsaga code_action<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("v", "<Leader>ca", ":<C-U>Lspsaga range_code_action<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<Leader>k", ":Lspsaga hover_doc<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<Leader>sd", ":Lspsaga show_line_diagnostics<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<C-k>", ":Lspsaga signature_help<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<Leader>lr", ":Lspsaga rename<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<C-f>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<C-b>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<Leader>pd", ":Lspsaga preview_definition<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "[d", ":Lspsaga diagnostic_jump_next<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "]d", ":Lspsaga diagnostic_jump_prev<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<Leader>ot", ":Lspsaga open_floaterm<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("t", "<Leader>ct", "<C-\\><C-n>:Lspsaga close_floaterm<CR>", {noremap = true, silent = true})

--[[
nnoremap <silent> <leader>cot :Lspsaga open_floaterm<CR>
tnoremap <silent> <leader>cct <C-\><C-n>:Lspsaga close_floaterm<CR> ]]
