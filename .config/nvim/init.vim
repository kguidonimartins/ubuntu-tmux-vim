let mapleader =","

set mouse=a
set hidden
syntax on
set nobackup
set nowritebackup
set clipboard=unnamed,unnamedplus

filetype on
filetype plugin on
filetype indent on

" ----------------------------------------------------------------------------
" Moving lines
" ----------------------------------------------------------------------------
" noremap h <NOP>
" noremap j <NOP>
" noremap k <NOP>
" noremap l <NOP>
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
Plug 'dracula/vim', { 'as': 'dracula' }                       " dracula colorscheme
Plug 'neoclide/coc.nvim', { 'branch': 'release' }             " language server
Plug 'jpalardy/vim-slime'                                     " REPL integration: great for R and python
Plug 'pacha/vem-tabline'                                      " minimal buffer and tabs list
Plug 'ervandew/supertab'                                      " trigger tab omni completion
call plug#end()

let g:coc_global_extensions = [
      \ 'coc-marketplace',
      \ 'coc-python',
      \ 'coc-r-lsp',
      \ 'coc-pyls'
      \ ]

let g:coc_start_at_startup=1

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use K to show documentation in preview window.
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

nnoremap <silent> K :call <SID>show_documentation()<CR>

let g:slime_paste_file = "/tmp/slime_paste"
let g:slime_no_mappings = 1
let g:slime_python_ipython = 1

xmap <c-c><c-c> <Plug>SlimeRegionSend
nmap <c-c><c-c> <Plug>SlimeParagraphSend
nmap <c-c>v   <Plug>SlimeConfig

" https://github.com/jpalardy/vim-slime/issues/250
nmap <leader><leader> <c-c><c-c>}jzz
nmap <leader><Space> <c-c><c-c>

" Set terminal inside tmux as default
let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": "default", "target_pane": "{right-of}"}

function! _EscapeText_r(text)
  call system("cat > " . "/tmp/slime_r", a:text)
 return ["source('/tmp/slime_r', echo = TRUE, max.deparse.length = 4095)\r"]
endfunction

function! _EscapeText_rmd(text)
  call system("cat > " . "/tmp/slime_r", a:text)
 return ["source('/tmp/slime_r', echo = TRUE, max.deparse.length = 4095)\r"]
endfunction

let g:SuperTabDefaultCompletionType = "context"

" dracula colorscheme
set termguicolors

let g:dracula_italic = 0
let g:dracula_colorterm = 0

" see also: nofrils
colorscheme dracula

