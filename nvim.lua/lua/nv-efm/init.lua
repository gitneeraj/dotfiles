local nvim_lsp = require('lspconfig')

local on_attach = function(client)

    print('HERE')
  -- if client.resolved_capabilities.document_formatting then
    vim.cmd [[augroup lsp_formatting]]
    vim.cmd [[autocmd!]]
    vim.cmd [[autocmd BufWritePre <buffer> :lua vim.lsp.buf.formatting_sync({}, 1000)]]
    vim.cmd [[augroup END]]
  -- end
end

local efm_formatters = {
  prettier = {
    formatCommand = './node_modules/.bin/prettier --stdin-filepath ${INPUT}',
    formatStdin = true
  },
}

nvim_lsp.efm.setup({
  on_attach = function(client)
      print('on_attach')
    client.resolved_capabilities.document_formatting = true
      on_attach()
    end,
  init_options = {
    documentFormatting = true,
  },
  filetypes = {'javascript', 'javascriptreact'},
  settings = {
    rootMarkers = {'.git/'},
    languages = {
      javascript = {efm_formatters.prettier},
      javascriptreact = {efm_formatters.prettier},
    },
  },
})

nvim_lsp.tsserver.setup({
  on_attach = function(client)
    client.resolved_capabilities.document_formatting = false

    on_attach(client)
  end,
})
