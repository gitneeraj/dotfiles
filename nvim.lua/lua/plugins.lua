local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
    execute 'packadd packer.nvim'
end

return require('packer').startup(function(use)

    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- onedark color theme
    use 'navarasu/onedark.nvim'

    -- File Explorer
    use 'kyazdani42/nvim-tree.lua'

    -- LSP config
    use 'neovim/nvim-lspconfig'

    -- Support for installing language servers via :LspInstall etc
    use 'kabouzeid/nvim-lspinstall'

    -- Autocomplete
    use 'hrsh7th/nvim-compe'

    -- Snippets for code completion
    use {'hrsh7th/vim-vsnip'}
    use {'rafamadriz/friendly-snippets'}

    -- TreeSitter
    use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
    use {"nvim-treesitter/playground"}

    -- auto pairs
    use {'jiangmiao/auto-pairs'}

    -- Rainbow colorized brackets
    use {'p00f/nvim-ts-rainbow'}

    -- easy commenting
    use 'b3nj5m1n/kommentary'

    -- Multi line edit
    use {'mg979/vim-visual-multi'}

    -- Telescope
    use {'nvim-telescope/telescope.nvim', requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}}

    -- Which key
    use {"folke/which-key.nvim"}

    -- lsp saga for better UI for docs and hover
    use {'glepnir/lspsaga.nvim'}

    -- signature help for methods/functions
    use {'ray-x/lsp_signature.nvim'}

    -- Tabline/bufferline
    use {'akinsho/nvim-bufferline.lua', requires = 'kyazdani42/nvim-web-devicons'}

    -- Status line
    use {
        'glepnir/galaxyline.nvim',
        branch = 'main',
        config = function()
            require 'modules.galaxyline'
        end,
        requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }

    -- colorizer
    use {'norcalli/nvim-colorizer.lua'}

end)

