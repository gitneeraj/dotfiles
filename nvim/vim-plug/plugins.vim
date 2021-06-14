call plug#begin($HOME.'/Personal/opensource/dotfiles/nvim/autoload/plugged')

    " Better Syntax Support
    Plug 'sheerun/vim-polyglot'
    " File Explorer
    Plug 'scrooloose/NERDTree'
    " Auto pairs for '(' '[' '{'
    Plug 'jiangmiao/auto-pairs'
    " Color Theme onedark
    Plug 'joshdick/onedark.vim'
    " Color Theme Dracula
    Plug 'dracula/vim', { 'as': 'dracula' } 
    " Stable version of COC
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " Airline
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    " Colorizer
    Plug 'norcalli/nvim-colorizer.lua'
    " color parenthesis
    Plug 'junegunn/rainbow_parentheses.vim'    
    " Commentery
    Plug 'tpope/vim-commentary'
    " Startify
    Plug 'mhinz/vim-startify'
    " git - signify
    Plug 'mhinz/vim-signify'
    " which key
    Plug 'liuchengxu/vim-which-key'
    " Multi select cursor
    Plug 'mg979/vim-visual-multi', {'branch': 'master'}
    
call plug#end()
