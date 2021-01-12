let mapleader =","

syntax on

set mouse=a
set hidden
set clipboard=unnamed,unnamedplus

filetype on
filetype plugin on
filetype indent on

nnoremap <silent> <C-S-h> <<
nnoremap <silent> <C-S-j> :move+<cr>
nnoremap <silent> <C-S-k> :move-2<cr>
nnoremap <silent> <C-S-l> >>
xnoremap <silent> <C-S-h> <gv
xnoremap <silent> <C-S-j> :move'>+<cr>gv
xnoremap <silent> <C-S-k> :move-2<cr>gv
xnoremap <silent> <C-S-l> >gv
xnoremap < <gv
xnoremap > >gv

nnoremap <tab>   <c-w>w
nnoremap <S-tab> <c-w>W

if ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim"'))
    echo "Downloading junegunn/vim-plug to manage plugins..."
    silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/
    silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" >
                \ ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
    autocmd VimEnter * PlugInstall
endif

call plug#begin(system('echo -n "$PLUG_HOME"'))
Plug 'neoclide/coc.nvim', { 'branch': 'release' }             " language server
Plug 'jpalardy/vim-slime'                                     " REPL integration: great for R and python
Plug 'pacha/vem-tabline'                                      " minimal buffer and tabs list
Plug 'ervandew/supertab'                                      " trigger tab omni completion
call plug#end()

let g:SuperTabDefaultCompletionType = "context"

