local lsp_installer = require'nvim-lsp-installer'
local lsp_installer_servers = require'nvim-lsp-installer.servers'

local format_on_save = function()
    -- On Pre Buffer
    vim.api.nvim_command [[augroup Format]]
    vim.api.nvim_command [[autocmd! * <buffer>]]
    vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]]
    vim.api.nvim_command [[augroup END]]

    -- On Post Buffer
    -- vim.cmd("command! LspFormatting lua vim.lsp.buf.formatting()")
    -- vim.api.nvim_exec([[
    -- augroup LspAutocommands
    --     autocmd! * <buffer>
    --     autocmd BufWritePost <buffer> LspFormatting
    -- augroup END
    -- ]], true)

    -- vim.api.nvim_command [[autocmd BufWritePre <buffer> <cmd>EslintFixAll<CR>]]
end

-- keymaps
local on_attach = function(client, bufnr)

    -- LSP signature help
    require'lsp_signature'.on_attach(client)

    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end

    local opts = {noremap = true, silent = true}
    buf_set_keymap('n', '<Leader>gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', '<Leader>gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', '<Leader>gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', '<Leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<Leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<Leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    buf_set_keymap('n', '<Leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', '<Leader>gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', '<Leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

    -- LSP Saga keybindings
    buf_set_keymap('n', '<Leader>gh', ':Lspsaga lsp_finder<CR>', opts)
    buf_set_keymap('n', '<Leader>k', ':Lspsaga hover_doc<CR>', opts)
    buf_set_keymap('n', '<Leader>gs', ':Lspsaga signature_help<CR>', opts)
    buf_set_keymap('n', '<Leader>gl', ':Lspsaga show_line_diagnostics<CR>', opts)
    buf_set_keymap('n', '<Leader>a', ':Lspsaga diagnostic_jump_next<CR>', opts)
    buf_set_keymap('n', '<Leader>l', ':Lspsaga diagnostic_jump_prev<CR>', opts)
    buf_set_keymap('n', '<Leader>ga', '<Cmd>lua require("lspsaga.codeaction").code_action()<CR>', opts)
    buf_set_keymap('v', '<Leader>ga', ':<C-U>lua require("lspsaga.codeaction").range_code_action()<CR>', opts)
    buf_set_keymap('n', '<Leader>dc', ':Lspsaga preview_definition<CR>', opts)

    -- Set some keybinds conditional on server capabilities
    if client.resolved_capabilities.document_formatting then
        buf_set_keymap("n", "<Leader>lf", ":EslintFixAll<CR>", opts)
        format_on_save()
    elseif client.resolved_capabilities.document_range_formatting then
        buf_set_keymap("n", "<Leader>lf", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
    end

    -- Set autocommands conditional on server_capabilities
    if client.resolved_capabilities.document_highlight then
        vim.api.nvim_exec([[
    hi LspReferenceRead cterm=bold ctermbg=red guibg=#343e4f
    hi LspReferenceText cterm=bold ctermbg=red guibg=#343e4f
    hi LspReferenceWrite cterm=bold ctermbg=red guibg=#343e4f
    augroup lsp_document_highlight
    autocmd! * <buffer>
    autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
    autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
    augroup END
    ]], false)
    end
end

local disableFormat = function(client)
    client.resolved_capabilities.document_formatting = false
    on_attach(client)
end

-- config that activates keymaps and enables snippet support
local function make_config()
    local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    capabilities.textDocument.completion.completionItem.resolveSupport = {properties = {'documentation', 'detail', 'additionalTextEdits'}}
    return {
        -- enable snippet support
        capabilities = capabilities,
        -- map buffer local keybindings when the language server attaches
        on_attach = on_attach
    }
end

-- install LSP servers
local function installServer(name)
    local ok, server = lsp_installer_servers.get_server(name)
    if ok then
        if not server:is_installed() then
            server:install()
        end
    end
end

local function installServers(names)
    for _,name in pairs(names) do
        installServer(name)
    end
end

-- find a list of available ones here: https://github.com/williamboman/nvim-lsp-installer
installServers({'angularls', 'bashls', 'dockerls', 'sumneko_lua', 'pyright', 'jsonls', 'cssls', 'tsserver', 'eslint'})

-- setup installed servers
lsp_installer.on_server_ready(function(server)
    local opts = make_config()

    if server.name == 'sumneko_lua' then
        opts = require'lsp-server-config.lua'
    end

    if server.name == "eslint" then
        opts.on_attach = function (client, bufnr)
            client.resolved_capabilities.document_formatting = true
            on_attach(client, bufnr)
        end
        opts.settings = {
            format = { enable = true }, -- this will enable formatting
        }
    end

    if server.name == "tsserver" then
        opts.on_attach = function (client, bufnr)
            client.resolved_capabilities.document_formatting = false
            on_attach(client, bufnr)
        end
    end

    server:setup(opts)
end)

-- diagnostic symbols
local signs = { Error = "", Warn = "", Hint = "", Info =  ""}
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
