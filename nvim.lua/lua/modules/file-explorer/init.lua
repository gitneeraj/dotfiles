vim.g.nvim_tree_width = 40 -- 30 by default
-- vim.g.nvim_tree_ignore = [ '.git', 'node_modules', '.cache' ] -- empty by default
vim.g.nvim_tree_gitignore = 1 -- 0 by default
vim.g.nvim_tree_auto_open = 1 -- 0 by default, opens the tree when typing `vim $DIR` or `vim`
vim.g.nvim_tree_auto_close = 0 -- 0 by default, closes the tree when it's the last window
-- vim.g.nvim_tree_auto_ignore_ft = [ 'startify', 'dashboard' ] -- empty by default, don't auto open tree on specific filetypes.
vim.g.nvim_tree_quit_on_open = 0 -- 0 by default, closes the tree when you open a file
vim.g.nvim_tree_follow = 1 -- 0 by default, this option allows the cursor to be updated when entering a buffer
vim.g.nvim_tree_indent_markers = 1 -- 0 by default, this option shows indent markers when folders are open
vim.g.nvim_tree_hide_dotfiles = 1 -- 0 by default, this option hides files and folders starting with a dot `.`
vim.g.nvim_tree_git_hl = 1 -- 0 by default, will enable file highlight for git attributes (can be used without the icons).
vim.g.nvim_tree_highlight_opened_files = 1 -- 0 by default, will enable folder and file icon highlight for opened files/directories.
vim.g.nvim_tree_root_folder_modifier = ':~' -- This is the default. See :help filename-modifiers for more options
vim.g.nvim_tree_tab_open = 1 -- 0 by default, will open the tree when entering a new tab and the tree was previously open
vim.g.nvim_tree_width_allow_resize = 1 -- 0 by default, will not resize the tree when opening a file
vim.g.nvim_tree_group_empty = 1 --  0 by default, compact folders that only contain a single folder into one node in the file tree
vim.g.nvim_tree_lsp_diagnostics = 1 -- 0 by default, will show lsp diagnostics in the signcolumn. See :help nvim_tree_lsp_diagnostics
vim.g.nvim_tree_disable_window_picker = 1 -- 0 by default, will disable the window picker.
vim.g.nvim_tree_hijack_cursor = 0 -- 1 by default, when moving cursor in the tree, will position the cursor at the start of the file on the current line
vim.g.nvim_tree_icon_padding = ' ' -- one space by default, used for rendering the space between the icon and the filename. Use with caution, it could break rendering if you set an empty string depending on your font.
vim.g.nvim_tree_update_cwd = 0 -- 0 by default, will update the tree cwd when changing nvim's directory (DirChanged event). Behaves strangely with autochdir set.
-- vim.g.nvim_tree_special_files = [ 'README.md', 'Makefile', 'MAKEFILE' ] --  List of filenames that gets highlighted with NvimTreeSpecialFile

vim.api.nvim_set_keymap('n', '<Leader>e', ':NvimTreeToggle<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>r', ':NvimTreeRefresh<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>f', ':NvimTreeFindFile<CR>', {noremap = true, silent = true})
vim.api.nvim_command('highlight NvimTreeIndentMarker guifg=#4F4F4F')
