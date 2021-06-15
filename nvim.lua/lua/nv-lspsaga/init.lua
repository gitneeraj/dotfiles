local saga = require 'lspsaga'
saga.init_lsp_saga()

vim.api.nvim_set_keymap("n", "<Leader>clf", ":Lspsaga lsp_finder<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<Leader>cca", ":Lspsaga code_action<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("v", "<Leader>cca", ":<C-U>Lspsaga range_code_action<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<Leader>chd", ":Lspsaga hover_doc<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<Leader>cld", ":Lspsaga show_line_diagnostics<CR>", {noremap = true, silent = true})
--[[ vim.api.nvim_set_keymap("n", "<Leader>clf", ":Lspsaga lsp_finder<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<Leader>clf", ":Lspsaga lsp_finder<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<Leader>clf", ":Lspsaga lsp_finder<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<Leader>clf", ":Lspsaga lsp_finder<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<Leader>clf", ":Lspsaga lsp_finder<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<Leader>clf", ":Lspsaga lsp_finder<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<Leader>clf", ":Lspsaga lsp_finder<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<Leader>clf", ":Lspsaga lsp_finder<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<Leader>clf", ":Lspsaga lsp_finder<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<Leader>clf", ":Lspsaga lsp_finder<CR>", {noremap = true, silent = true})

nnoremap <silent><C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>
nnoremap <silent><C-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>
nnoremap <silent><leader>csh :Lspsaga signature_help<CR>
nnoremap <silent><leader>crn :Lspsaga rename<CR>
nnoremap <silent><leader>cpd:Lspsaga preview_definition<CR>
nnoremap <silent> [e :Lspsaga diagnostic_jump_next<CR>
nnoremap <silent> ]e :Lspsaga diagnostic_jump_prev<CR>
nnoremap <silent> <leader>cot :Lspsaga open_floaterm<CR>
tnoremap <silent> <leader>cct <C-\><C-n>:Lspsaga close_floaterm<CR> ]]
