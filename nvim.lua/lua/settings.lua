vim.cmd('filetype plugin indent on')
vim.cmd('set formatoptions-=c') --- " Stop newline continuation of comments
vim.cmd('set iskeyword+=-') -- treat dash separated words as a word text object"
vim.cmd('set shortmess+=c') -- Don't pass messages to |ins-completion-menu|.
vim.cmd('set inccommand=split') -- Make substitution work in realtime
vim.o.title = true
vim.cmd('set whichwrap+=<,>,[,],h,l') -- move to next line with theses keys
vim.cmd('syntax on') -- syntax highlighting
vim.o.pumheight = 10 -- Makes popup menu smaller
vim.o.fileencoding = "utf-8" -- The encoding written to file
vim.o.cmdheight = 2 -- More space for displaying messages
vim.cmd('set colorcolumn=99999') -- fix indentline for now
vim.o.mouse = "a" -- Enable your mouse
vim.o.splitbelow = true -- Horizontal splits will automatically be below
vim.o.termguicolors = true -- set term gui colors most terminals support this
vim.o.splitright = true -- Vertical splits will automatically be to the right
-- vim.o.t_Co = "256" -- Support 256 colors
vim.cmd('set ts=4') -- Insert 2 spaces for a tab
vim.cmd('set sw=4') -- Change the number of space characters inserted for indentation
vim.cmd('set expandtab') -- Converts tabs to spaces
vim.bo.smartindent = true -- Makes indenting smart
vim.wo.number = true -- set numbered lines
vim.wo.relativenumber = true -- set relative number
vim.wo.cursorline = true -- Enable highlighting of the current line
vim.o.showtabline = 2 -- Always show tabs
vim.o.showmode = false -- We don't need to see things like -- INSERT -- anymore
vim.wo.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time
vim.o.updatetime = 300 -- Faster completion
vim.o.clipboard = "unnamedplus" -- Copy paste between vim and everything else
vim.cmd('filetype plugin on') -- filetype detection
vim.cmd('set scrolloff=999') -- set cursor to middle when scrolling
vim.o.completeopt = "menuone,noselect"

-- global settings for indent-blankline.nvim
vim.g.indent_blankline_char_list = {'│', '┆', '┊'}
-- vim.g.indent_blankline_space_char = '·'
vim.g.indent_blankline_use_treesitter = true
vim.g.indent_blankline_show_first_indent_level = false
vim.g.indent_blankline_show_end_of_line = true
vim.g.indent_blankline_char = '│'
vim.g.indent_blankline_show_current_context = true
-- vim.api.nvim_command("highlight IndentBlanklineChar guifg=#454545 gui=nocombine")
vim.api.nvim_command("highlight IndentBlanklineContextChar guifg=#CCC gui=nocombine")
vim.g.indent_blankline_filetype_exclude = {'startify', 'help', 'packer'}
vim.g.indent_blankline_context_patterns = {'class', 'function', 'method', '^if', 'element'}
