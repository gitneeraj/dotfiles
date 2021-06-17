local utils = require('telescope.utils')

require('telescope').setup{
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
    },
    prompt_position = "top",
    prompt_prefix = "> ",
    selection_caret = "> ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "ascending",
    layout_strategy = "horizontal",
    layout_defaults = {
      horizontal = {
        mirror = false,
      },
      vertical = {
        mirror = false,
      },
    },
    file_sorter =  require'telescope.sorters'.get_fuzzy_file,
    file_ignore_patterns = {'node_modules'},
    generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
    shorten_path = true,
    winblend = 0,
    width = 0.75,
    preview_cutoff = 120,
    results_height = 1,
    results_width = 0.8,
    border = {},
    color_devicons = true,
    use_less = true,
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
    file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,

    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker
  }
}


local M = {}

M.project_files = function()
    local _, ret, stderr = utils.get_os_command_output({
        'git', 'rev-parse', '--is-inside-work-tree'
    })
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
        shorten_path = false,
        search_dirs = {
            '~/.config', '~/Personal/opensource/dotfiles'
        },
        cwd = '~/Personal/opensource/dotfiles',
        width = .25,
        layout_strategy = 'horizontal',
        layout_config = {preview_width = 0.65}
    }
end

function M.file_explorer()
    require('telescope.builtin').file_browser {
        prompt_title = ' File Browser',
        shorten_path = false,
        cwd = '~',
        width = .25,
        layout_strategy = 'horizontal',
        layout_config = {preview_width = 0.65}
    }
end

vim.api.nvim_set_keymap('n', '<Leader>ff', ':Telescope find_files<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>fd', ':lua require(\'nv-telescope\').find_files()<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>fb', ':lua require(\'nv-telescope\').file_explorer()<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>fp', ':lua require(\'nv-telescope\').project_files()<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>fg', ':Telescope live_grep<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>fh', ':Telescope help_tags<CR>', {noremap = true, silent = true})

return M
