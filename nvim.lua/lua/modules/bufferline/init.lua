vim.opt.termguicolors = true

require('bufferline').setup {
    options = {
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level, _, _)
            local icon = level:match("error") and " " or " "
            return " " .. icon .. count
        end,
        separator_style = "slant",
        offsets = {{filetype = "NvimTree", text = "File Explorer", text_align = "center"}}
    }
}

vim.api.nvim_set_keymap("n", "<Leader>tn", ":BufferLineMoveNext<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<Leader>tp", ":BufferLineMovePrev<CR>", {noremap = true, silent = true})
