local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

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
    use 'kyazdani42/nvim-web-devicons'
    use 'kyazdani42/nvim-tree.lua'
    use 'ahmedkhalf/lsp-rooter.nvim'

    -- LSP
    use 'neovim/nvim-lspconfig'

    -- Support for installing language servers via :LspInstall etc
    use 'kabouzeid/nvim-lspinstall'

    -- Autocomplete
    use 'hrsh7th/nvim-compe'

    -- TreeSitter
    use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
    use {"windwp/nvim-ts-autotag", opt = true}

    -- Status line
    use {'glepnir/galaxyline.nvim',
        branch = 'main',
        config = function() require'nv-galaxyline' end,
        requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }

    -- Code comments
    use 'b3nj5m1n/kommentary'

    -- Tabline/bufferline
    use {'akinsho/nvim-bufferline.lua', requires = 'kyazdani42/nvim-web-devicons'}

    -- Snippets
    use { 'ray-x/lsp_signature.nvim' }
    use {'hrsh7th/vim-vsnip'}
    use {'rafamadriz/friendly-snippets'}
    use {'xabikos/vscode-javascript'}

    -- UI
    use { 'glepnir/lspsaga.nvim' }
    use { 'p00f/nvim-ts-rainbow' }

    -- auto pairs
    use {'jiangmiao/auto-pairs'}

    -- EFM langserver for linters
    -- use {'mattn/efm-langserver'}

    -- Telescope
    use {
      'nvim-telescope/telescope.nvim',
      requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
    }

    -- Which key
    use {"folke/which-key.nvim"}

end)

