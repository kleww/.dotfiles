" URL: https://github.com/kleww/.dotfiles
" Author: Kevin Viricel
" Description: Vim file configuration

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
Plugin 'Valloric/YouCompleteMe'             " Completion
Plugin 'altercation/vim-colors-solarized'   " Solarized colorscheme

" Plugins must be added before the following line
call vundle#end()                           " Required
filetype plugin indent on                   " Required

" ------------------------------------------------------------------------------
" General settings

syntax enable                               " Active syntax coloring
set encoding=utf8                           " Set utf8 as standard encoding
set tabstop=2                               "
set shiftwidth=2                            " 1 tab == 4 space
set softtabstop=2                           "
set expandtab                               " Use spaces intead of tabs

" ------------------------------------------------------------------------------
" Gui mode

set guioptions-=r                           " Remove right-hand scroll bar
set guioptions-=l                           " Remove left-hand scroll bar

" ------------------------------------------------------------------------------
" Display

set number                                  " Display line number
set colorcolumn=81                          " Display a limit line after 80 col
set laststatus=2                            " Always display the status line
set background=dark                         " Dark background
set t_Co=16
"let g:solarized_termcolors=256             " if terminal != solarized uncomment
silent! colorscheme solarized               " Use solarized colorscheme if exist

" ------------------------------------------------------------------------------
" Airline settings

let g:airline_left_sep=''                   " Disable left separator
let g:airline_right_sep=''                  " Disable right separator
let g:airline_section_z='col: %v'           " Replace (%,line,col) by (col)
