local utils = require('telescope.utils')

require('telescope').setup {
    defaults = {
        vimgrep_arguments = {'rg', '--color=never', '--no-heading', '--with-filename', '--line-number', '--column', '--smart-case'},
        prompt_prefix = "> ",
        selection_caret = "> ",
        entry_prefix = "  ",
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "ascending",
        layout_strategy = "horizontal",
        file_sorter = require'telescope.sorters'.get_fuzzy_file,
        file_ignore_patterns = {'node_modules'},
        generic_sorter = require'telescope.sorters'.get_generic_fuzzy_sorter,
        path_display = {'shorten'},
        winblend = 0,
        layout_config = {prompt_position = "top", preview_cutoff = 120},
        border = {},
        color_devicons = true,
        use_less = true,
        borderchars = {'─', '│', '─', '│', '╭', '╮', '╯', '╰'},
        set_env = {['COLORTERM'] = 'truecolor'}, -- default = nil,
        file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
        grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
        qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,

        -- Developer configurations: Not meant for general override
        buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker
    },
    pickers = {find_files = {theme = "dropdown"}}
}

local M = {}

M.project_files = function()
    local _, ret, _ = utils.get_os_command_output({'git', 'rev-parse', '--is-inside-work-tree'})
    local gopts = {}
    gopts.prompt_title = ' Git Files'
    gopts.prompt_prefix = '  '
    if ret == 0 then
        require'telescope.builtin'.git_files(gopts)
    else
        require'telescope.builtin'.find_files()
    end
end

function M.find_files()
    require('telescope.builtin').find_files {
        prompt_title = 'Find in DotFiles',
        path_display = {'shorten'},
        search_dirs = {'~/.config', '~/Personal/opensource'},
        cwd = '~/Personal/opensource',
        layout_strategy = 'horizontal'
    }
end

function M.live_grep()
    require('telescope.builtin').live_grep {prompt_title = 'This is custom live grep'}
end

function M.file_explorer()
    require('telescope.builtin').file_browser {
        prompt_title = ' File Browser',
        path_display = {'shorten'},
        cwd = '~',
        layout_strategy = 'horizontal'
    }
end

--[[ local builtin = require('telescope.builtin')
local themes = require('telescope.themes')
vim.api.nvim_set_keymap('n', '<Leader>ff', ':lua builtin.find_files(themes.get_ivy())<CR>', {noremap = true, silent = true}) ]]

vim.api.nvim_set_keymap('n', '<Leader>ff', ':Telescope find_files<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>fd', ':lua require(\'modules.telescope\').find_files()<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>fb', ':lua require(\'modules.telescope\').file_explorer()<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>fp', ':lua require(\'modules.telescope\').project_files()<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>fg', ':Telescope live_grep<CR>', {noremap = true, silent = true})
-- vim.api.nvim_set_keymap('n', '<Leader>fg', ':lua require(\'modules.telescope\').live_grep()<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>fs', ':Telescope grep_string<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>fh', ':Telescope help_tags<CR>', {noremap = true, silent = true})

return M

