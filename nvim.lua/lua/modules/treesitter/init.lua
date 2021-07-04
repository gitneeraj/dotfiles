require'nvim-treesitter.configs'.setup {
    ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    ignore_install = {"haskell"}, -- broken since 21 June 2021
    highlight = {
        enable = true -- false will disable the whole extension
    },

    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "<leader>gnn",
            node_incremental = "<leader>gnr",
            scope_incremental = "<leader>gne",
            node_decremental = "<leader>gnt"
        }
    },

    indent = {enable = true},

    rainbow = {enable = true},

    context_commentstring = {
        enable_autocmd = false,
        enable = true,
        config = {
            javascript = {__default = '// %s', jsx_element = '{/* %s */}', jsx_fragment = '{/* %s */}', jsx_attribute = '// %s', comment = '// %s'},
            svelte = '<!-- %s -->'
        }
    }

    -- tree_docs = {enable = true}
}
