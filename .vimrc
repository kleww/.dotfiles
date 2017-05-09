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
Plugin 'nsf/gocode', {'rtp': 'vim/'}
Plugin 'bling/vim-airline'                  " Status line
Plugin 'Valloric/YouCompleteMe'             " Completion
Plugin 'chriskempson/tomorrow-theme', {'rtp': 'vim/'} " Tomorrow colorscheme
Plugin 'lifepillar/pgsql.vim'
Plugin 'tpope/vim-vinegar'

" Plugins must be added before the following line
call vundle#end()                           " Required
filetype plugin indent on                   " Required

" ------------------------------------------------------------------------------
" General settings
syntax enable                               " Active syntax coloring
set backspace=2                             " Backspace like other apps
set encoding=utf8                           " Set utf8 as standard encoding
set tabstop=2                               "
set shiftwidth=2                            " 1 tab == 2 space
set softtabstop=2                           "
set expandtab                               " Use spaces intead of tabs
set nowrap
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | :edit. | endif

" ------------------------------------------------------------------------------
" Split settings

set splitright
set splitbelow
" when spliting open fileexplorer in previous file directory 
nnoremap <silent> <C-w>v <C-w>v:lcd %:p:h<CR>:edit.<CR>
nnoremap <silent> <C-w><C-v> <C-w>v:lcd %:p:h<CR>:edit.<CR>
nnoremap <silent> <C-w>s <C-w>s:lcd %:p:h<CR>:edit.<CR>
nnoremap <silent> <C-w><C-s> <C-w>s:lcd %:p:h<CR>:edit.<CR>

" ------------------------------------------------------------------------------
" Gui mode

set guioptions-=r                           " Remove right-hand scroll bar
set guioptions-=l                           " Remove left-hand scroll bar

" ------------------------------------------------------------------------------
" Display

set number                          " Display line number
set relativenumber                          " Display line number
if $TERM == "xterm-256color"                " If we are on 256 colors term
  set t_Co=256
endif
set laststatus=2                            " Always display the status line
set background=dark                         " Dark background
silent! colorscheme Tomorrow-Night-Eighties " Use Tomorrow colorscheme if exist
hi VertSplit ctermbg=NONE                   " Disable ugly vertical separator
execute "set colorcolumn=" . join(range(81,335), ',')
au FileType qf setlocal nonumber colorcolumn=

" ------------------------------------------------------------------------------
" vim-go settings

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_metalinter_autosave_enabled = ['vet', 'golint', 'errcheck']
let g:go_metalinter_autosave = 1
let g:go_fmt_command = "goimports"

" ------------------------------------------------------------------------------
" Airline settings

let g:airline_section_z='col: %v'           " Replace (%,line,col) by (col)
let g:airline_powerline_fonts = 1

" ------------------------------------------------------------------------------
" YouCompleteMe settings

let g:ycm_complete_in_comments=1
let g:ycm_autoclose_preview_window_after_insertion=1

" TAB completion
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" ------------------------------------------------------------------------------
" Tutorial settings (Use vim the right way)

" Disable arrow keys in normal mode
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

" Disable arrow keys in insert mode
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
