vim.opt.termguicolors = true
-- require("bufferline").setup{}

require('bufferline').setup {
  options = {
    diagnostics = "nvim_lsp",
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      local icon = level:match("error") and " " or " "
      return " " .. icon .. count
    end,
    separator_style = "slant",
  }
}
