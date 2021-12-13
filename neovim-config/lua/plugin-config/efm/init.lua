local lsp_config = require('lspconfig')
local on_attach = require('plugin-config.efm.on_attach')
local eslint = require('plugin-config.efm.eslint')
local prettier = require('plugin-config.efm.prettier')
local luaformat = require('plugin-config.efm.lua-formatter')

local disableFormat = function(client)
    client.resolved_capabilities.document_formatting = false
    on_attach(client)
end

-- format on save
local format_async = function(err, _, result, _, bufnr)
    if err ~= nil or result == nil then return end
    if not vim.api.nvim_buf_get_option(bufnr, "modified") then
        local view = vim.fn.winsaveview()
        vim.lsp.util.apply_text_edits(result, bufnr)
        vim.fn.winrestview(view)
        if bufnr == vim.api.nvim_get_current_buf() then vim.api.nvim_command("noautocmd :update") end
    end
end

vim.lsp.handlers["textDocument/formatting"] = format_async

local efm_root_markers = {'package.json', '.git/', '.zshrc'}
local efm_languages = {
    yaml = {prettier},
    json = {prettier},
    markdown = {prettier},
    javascript = {eslint, prettier},
    javascriptreact = {eslint, prettier},
    ["javascript.jsx"] = {eslint, prettier},
    typescript = {eslint, prettier},
    typescriptreact = {eslint, prettier},
    ["typescript.tsx"] = {eslint, prettier},
    css = {prettier},
    scss = {prettier},
    sass = {prettier},
    less = {prettier},
    graphql = {prettier},
    vue = {prettier},
    html = {prettier},
    svelte = {eslint, prettier},
    lua = {luaformat}
}

lsp_config.efm.setup({
    filetypes = {
        'javascript', 'javascriptreact', 'javascript.jsx', 'typescript', 'typescriptreact', 'typescript.tsx', 'svelte', 'lua', 'json', 'html'
    },
    on_attach = on_attach,
    root_dir = lsp_config.util.root_pattern(unpack(efm_root_markers)),
    init_options = {documentFormatting = true},
    settings = {rootMarkers = efm_root_markers, languages = efm_languages}
})

lsp_config.tsserver.setup {on_attach = disableFormat}

lsp_config.svelte.setup {on_attach = disableFormat}

lsp_config.jsonls.setup {on_attach = disableFormat}

lsp_config.html.setup {on_attach = disableFormat}

