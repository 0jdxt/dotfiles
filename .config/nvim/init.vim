"  ___       _ _         _
" |_ _|_ __ (_) |___   _(_)_ __ ___
"  | || '_ \| | __\ \ / / | '_ ` _ \
"  | || | | | | |_ \ V /| | | | | | |
" |___|_| |_|_|\__(_)_/ |_|_| |_| |_|
""

" load plugins
source $HOME/.config/nvim/plugins/.plugins.vim

" vi settings and key mappings
source $HOME/.config/nvim/general/settings.vim
source $HOME/.config/nvim/general/mappings.vim

" plugin options
source $HOME/.config/nvim/plugins/vim-devicons.vim
source $HOME/.config/nvim/plugins/lightline.vim
source $HOME/.config/nvim/plugins/startify.vim
source $HOME/.config/nvim/plugins/coc.vim
source $HOME/.config/nvim/plugins/syntastic.vim

" enable theme
source $HOME/.config/nvim/themes/nord.vim

" misc plugin stuff
let g:vim_markdown_new_list_item_indent = 1
let g:vim_markdown_auto_insert_bullets = 1
let g:vim_markdown_frontmatter = 1
let g:rustfmt_autosave = 1
let g:rustfmt_emit_files = 1
let g:rustfmt_fail_silently = 0
let g:rust_clip_command = 'xclip -selection clipboard'
let g:closetag_filetypes = "html,php"
let g:clang_format#auto_format = 1

function! s:SudoEditInit() abort
  let files = split($SUDO_COMMAND, ' ')[1:-1]
  if len(files) ==# argc()
    for i in range(argc())
      execute 'autocmd BufEnter' fnameescape(argv(i))
            \ 'if empty(&filetype) || &filetype ==# "conf"'
            \ '|doautocmd filetypedetect BufReadPost '.fnameescape(files[i])
            \ '|endif'
    endfor
  endif
endfunction
if $SUDO_COMMAND =~# '^sudoedit '
  call s:SudoEditInit()
endif

" fix sizing bug in alacritty for 'alacritty -e nvim %F'
autocmd VimEnter * :silent exec "!kill -s SIGWINCH $PPID"
" set width for emails
au BufRead /tmp/mutt-* set tw=72

