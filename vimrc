" URL: https://github.com/kleww/.dotfiles
" Author: Kevin Viricel
" Description: Vim file configuration
" vim: foldmethod=marker foldtext=foldtext()
" Settings {{{
" UTF encoding {{{
set encoding=utf-8
set fileencoding=utf-8
set termencoding=utf-8
"}}}
" Modern behavior {{{
" Use vim, not vi
set nocompatible
" No write backup
set nowritebackup
" No swap file
set noswapfile
" Autoload files that have changed outside of vim
set autoread
" Write the content of the file if it has been modified on :make
set autowrite
" Allow to have modified buffers in background
set hidden
" Allow backspace to delete end of line, indent and start of line characters
set backspace=indent,eol,start
" Use system clipboard
set clipboard+=unnamed
"}}}
" Interface {{{
" Switch syntax highlighting on, when the terminal has colors
syntax on
" redraw only when we need to (i.e. don't redraw when executing a macro)
set lazyredraw
" Turn on line numbers
set number
" Turn word wrap off
set nowrap
" Always show status bar
set laststatus=2
" Set the status line to something useful
"set statusline=%f\ %=L:%l/%L\ C:%c\ (%p%%)
" Visual autocomplete for command menu (e.g. :e ~/path/to/file)
set wildmenu
" Highlight a matching [{()}] when cursor is placed on start/end character
set showmatch
" Highlight tailing whitespace
set list listchars=tab:\ \ ,trail:·
" Limit completion popup height to 10 lines
set pumheight=10
"}}}
" Search {{{
" Incremental searching (search as you type)
set incsearch
" Highlight search matches
set hlsearch
" Ignore case in search
set smartcase
" Make sure any searches /searchPhrase doesn't need the \c escape character
set ignorecase
"}}}
" Tabs {{{
" Convert tabs to spaces
set expandtab
" Set tab size in spaces (this is for manual indenting)
set tabstop=4
" The number of spaces inserted for a tab (used for auto indenting)
set shiftwidth=4
"}}}
" Splits {{{
" Better splits (new windows appear below and to the right)
set splitbelow
set splitright
"}}}
"}}}
" Mappings {{{
" Tab pages {{{
    nnoremap <leader>T :tabnew<CR>
"}}}
"}}}
" vim-plug install {{{
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    if v:shell_error == 0
        let s:vim_plug_installed = 1
        autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    else
        let s:vim_plug_installed = 0
    endif
else
    let s:vim_plug_installed = 1
endif
"}}}
" Plugins list {{{
if s:vim_plug_installed == 1
    call plug#begin()
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'fatih/molokai'
    Plug 'gcmt/taboo.vim'
    Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
    Plug 'SirVer/ultisnips'
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'tpope/vim-fugitive'
    if !has('nvim')
        Plug 'roxma/vim-hug-neovim-rpc'
    endif
    Plug 'roxma/nvim-completion-manager'
    call plug#end()
endif
"}}}
" Plugins settings {{{
if s:vim_plug_installed == 1
" vim-airline {{{
" }}}
" vim-airline-themes {{{
" }}}
" molokai {{{
    let g:rehash256 = 1
    let g:molokai_original = 1
    colorscheme molokai
" }}}
" taboo {{{
" }}}
" vim-go {{{
    let g:go_highlight_types = 1
    let g:go_highlight_fields = 1
    let g:go_highlight_functions = 1
    let g:go_highlight_methods = 1
    let g:go_highlight_operators = 1
    let g:go_highlight_extra_types = 1
    let g:go_highlight_build_constraints = 1
    let g:go_highlight_generate_tags = 1

    let g:go_fmt_command = "goimports"

    let g:go_gocode_unimported_packages = 1

    let g:go_metalinter_autosave = 1

    let g:go_auto_type_info = 1
    set updatetime=100

"    let g:go_auto_sameids = 1

    nnoremap <C-n> :cnext<CR>
    nnoremap <C-m> :cprevious<CR>
    nnoremap <leader>a :cclose<CR>

    " run :GoBuild or :GoTestCompile based on the go file
    function! s:build_go_files()
        let l:file = expand('%')
        if l:file =~# '^\f\+_test\.go$'
            call go#test#Test(0, 1)
        elseif l:file =~# '^\f\+\.go$'
            call go#cmd#Build(0)
        endif
    endfunction

    autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
    autocmd FileType go nmap <leader>r  <Plug>(go-run)
    autocmd FileType go nmap <leader>t  <Plug>(go-test)
    autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)
    autocmd FileType go nmap <Leader>i <Plug>(go-info)

    autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
    autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
    autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
    autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
" }}}
" ultisnips {{{
    let g:UltiSnipsExpandTrigger="<C-U>"
" }}}
" vim-fugitive {{{
    set diffopt=vertical
" }}}
" nvim-completion-manager {{{
    inoremap <expr> <Tab> pumvisible() ? "\<down>" : "\<Tab>"
    inoremap <expr> <S-Tab> pumvisible() ? "\<up>" : "\<S-Tab>"
    imap <expr> <CR>  (pumvisible() ?  "\<c-y>\<Plug>(expand_or_nl)" : "\<CR>")
    imap <expr> <Plug>(expand_or_nl) (cm#completed_is_snippet() ? "\<C-U>":"")
    imap <c-space> <Plug>(cm_force_refresh)
" }}}
endif
" }}}
