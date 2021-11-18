vim.opt.listchars = {eol = "?"}

vim.api.nvim_command("highlight IndentBlanklineContextChar guifg=#CCC gui=nocombine")

require("indent_blankline").setup {
    show_end_of_line = true,
    filetype_exclude = {'startify', 'help', 'packer'},
    char_list = {'│', '┆', '┊'},
    use_treesitter = true,
    show_current_context = true,
    context_patterns = {'class', 'function', 'method', '^if', 'element'}
}
