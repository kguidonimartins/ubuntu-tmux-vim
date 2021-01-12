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
