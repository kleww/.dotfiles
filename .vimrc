" URL: https://github.com/kleww/.dotfiles
" Author: Kevin Viricel
" Description: Vim file configuration
" ------------------------------------------------------------------------------

" ------------------------------------------------------------------------------
" Vundle settings

set nocompatible		" Be iMproved, required
filetype off			" Required

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'	" Let Vundle manage Vundle, required
Plugin 'fatih/vim-go'		" Golang plugin

" All of your Plugins must be added before the following line
call vundle#end()		" Required
filetype plugin indent on	" Required

" ------------------------------------------------------------------------------
" General settings

set number			" Display line number 
colorscheme koehler		" Set koehler colorscheme
