local function on_attach(client)
    vim.cmd("command! LspFormatting lua vim.lsp.buf.formatting()")

    if client.resolved_capabilities.document_formatting then
        vim.api.nvim_exec([[
         augroup LspAutocommands
             autocmd! * <buffer>
             autocmd BufWritePost <buffer> LspFormatting
         augroup END
         ]], true)
    end
end

return on_attach
