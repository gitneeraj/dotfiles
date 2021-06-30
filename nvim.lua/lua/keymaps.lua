local opts = {noremap = true, silent = true}
-- set leader key
vim.api.nvim_set_keymap('n', '<Space>', '<NOP>', opts)
vim.g.mapleader = ' '

-- better window movement
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', {silent = true})
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', {silent = true})
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', {silent = true})
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', {silent = true})

--- better indenting
vim.api.nvim_set_keymap('v', '<', '<gv', opts)
vim.api.nvim_set_keymap('v', '>', '>gv', opts)

-- I hate escape
vim.api.nvim_set_keymap('i', 'jk', '<ESC>', opts)
vim.api.nvim_set_keymap('i', 'kj', '<ESC>', opts)
vim.api.nvim_set_keymap('i', 'jj', '<ESC>', opts)
vim.api.nvim_set_keymap('i', 'kk', '<ESC>', opts)

-- easy movement when in Insert mode
--[[ vim.api.nvim_set_keymap('i', '<C-h>', '<left>', opts)
vim.api.nvim_set_keymap('i', '<C-l>', '<right>', opts) ]]

-- Tab switch, close, move buffers
vim.api.nvim_set_keymap('n', '<TAB>', ':bnext!<CR>', opts)
vim.api.nvim_set_keymap('n', '<S-TAB>', ':bprevious!<CR>', opts)
vim.api.nvim_set_keymap('n', '<Leader>bx', ':bp<CR>:bd #<CR>', opts)
vim.api.nvim_set_keymap('n', '<Leader>bn', ':BufferLineMoveNext<CR>', opts)
vim.api.nvim_set_keymap('n', '<Leader>bp', ':BufferLineMovePrev<CR>', opts)

-- Move selected line / block of text in visual mode
vim.api.nvim_set_keymap('x', 'K', ':move \'<-2<CR>gv-gv', opts)
vim.api.nvim_set_keymap('x', 'J', ':move \'>+1<CR>gv-gv', opts)

-- Resize vertical splits
vim.api.nvim_set_keymap('n', '<Leader>v=', ':vertical resize +5<CR>', opts)
vim.api.nvim_set_keymap('n', '<Leader>v-', ':vertical resize -5<CR>', opts)

vim.api.nvim_set_keymap('n', '<Leader>gd', ':lua vim.lsp.buf.definition()<CR>', opts)

-- Better nav for omnicomplete
vim.cmd('inoremap <expr> <c-j> (\"\\<C-n>\")')
vim.cmd('inoremap <expr> <c-k> (\"\\<C-p>\")')

-- Alternate way to quit
vim.cmd('nnoremap <S-c> :q!<CR>')

-- Alternate way to save
vim.cmd('nnoremap <C-s> :w!<CR>')
vim.cmd('inoremap <C-s> <ESC> :w!<CR>')

-- Toggle highlighting
vim.api.nvim_set_keymap('n', '<Leader>h', ':set hlsearch!<CR>', opts)

-- LSP info
vim.api.nvim_set_keymap('n', '<Leader>li', ':LspInfo<CR>', opts)
