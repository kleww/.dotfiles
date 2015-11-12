" URL: https://github.com/kleww/.dotfiles
" Author: Kevin Viricel
" Description: Vim file configuration
" ------------------------------------------------------------------------------

" ------------------------------------------------------------------------------
" Vundle settings

set nocompatible                            " Be iMproved, required
filetype off                                " Required

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'               " Let Vundle manage Vundle, required
Plugin 'fatih/vim-go'                       " Golang
Plugin 'tpope/vim-fugitive'                 " Git
Plugin 'bling/vim-airline'                  " Status line
Plugin 'altercation/vim-colors-solarized'   " Solarized colorscheme

" All of your Plugins must be added before the following line
call vundle#end()                           " Required
filetype plugin indent on                   " Required

" ------------------------------------------------------------------------------
" General settings

syntax enable                               " Active syntax coloring
set encoding=utf8                           " Set utf8 as standard encoding
set expandtab                               " Use spaces intead of tabs
set shiftwidth=4                            " 1 tab == 4 space
set tabstop=4                               " 

" ------------------------------------------------------------------------------
" Display

set list
set listchars=tab:T-
set number                                  " Display line number
set laststatus=2                            " Always display the status line
set background=dark                         " Dark background
set t_Co=16
"let g:solarized_termcolors=256             " if terminal != solarized uncomment
colorscheme solarized                       " Use solarized colorscheme

" ------------------------------------------------------------------------------
" Airline settings

let g:airline_left_sep=''                   " Disable left separator
let g:airline_right_sep=''                  " Disable right separator
let g:airline_section_z='col: %v'           " Replace (%,line,col) by (col)
