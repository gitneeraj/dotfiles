-- set leader key
vim.api.nvim_set_keymap('n', '<Space>', '<NOP>', {noremap = true, silent = true})
vim.g.mapleader = ' '

-- better window movement
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', {silent = true})
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', {silent = true})
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', {silent = true})
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', {silent = true})

--- better indenting
vim.api.nvim_set_keymap('v', '<', '<gv', {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '>', '>gv', {noremap = true, silent = true})

-- I hate escape
vim.api.nvim_set_keymap('i', 'jk', '<ESC>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('i', 'kj', '<ESC>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('i', 'jj', '<ESC>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('i', 'kk', '<ESC>', {noremap = true, silent = true})

-- easy movement when in Insert mode
--[[ vim.api.nvim_set_keymap('i', '<C-h>', '<left>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<C-l>', '<right>', {noremap = true, silent = true}) ]]

-- Move selected line / block of text in visual mode
vim.api.nvim_set_keymap('x', 'K', ':move \'<-2<CR>gv-gv', {noremap = true, silent = true})
vim.api.nvim_set_keymap('x', 'J', ':move \'>+1<CR>gv-gv', {noremap = true, silent = true})

-- Tab switch, close, move buffers
vim.api.nvim_set_keymap('n', '<TAB>', ':bnext!<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<S-TAB>', ':bprevious!<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>x', ':bp<CR>:bd #<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>n', ':BufferLineMoveext<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>p', ':BufferLineMovePrev<CR>', {noremap = true, silent = true})

-- Move selected line / block of text in visual mode
vim.api.nvim_set_keymap('x', 'K', ':move \'<-2<CR>gv-gv', {noremap = true, silent = true})
vim.api.nvim_set_keymap('x', 'J', ':move \'>+1<CR>gv-gv', {noremap = true, silent = true})

-- Better nav for omnicomplete
vim.cmd('inoremap <expr> <c-j> (\"\\<C-n>\")')
vim.cmd('inoremap <expr> <c-k> (\"\\<C-p>\")')

-- Alternate way to quit
vim.cmd('nnoremap <S-c> :q!<CR>')

-- Alternate way to save
vim.cmd('nnoremap <C-s> :w!<CR>')
vim.cmd('inoremap <C-s> <ESC> :w!<CR>')

-- Toggle highlighting
vim.api.nvim_set_keymap('n', '<Leader>h', ':set hlsearch!<CR>', {noremap = true, silent = true})

-- LSP info
vim.api.nvim_set_keymap('n', '<Leader>li', ':LspInfo<CR>', {noremap = true, silent = true})
