"  ___       _ _         _
" |_ _|_ __ (_) |___   _(_)_ __ ___
"  | || '_ \| | __\ \ / / | '_ ` _ \
"  | || | | | | |_ \ V /| | | | | | |
" |___|_| |_|_|\__(_)_/ |_|_| |_| |_|
""

source $HOME/.config/nvim/plugins/.plugins.vim

source $HOME/.config/nvim/general/settings.vim
source $HOME/.config/nvim/general/mappings.vim

source $HOME/.config/nvim/plugins/vim-devicons.vim
source $HOME/.config/nvim/plugins/lightline.vim
source $HOME/.config/nvim/plugins/startify.vim
source $HOME/.config/nvim/plugins/coc.vim
source $HOME/.config/nvim/plugins/syntastic.vim

source $HOME/.config/nvim/themes/nord.vim

" misc plugin stuff
let g:vim_markdown_new_list_item_indent = 0
let g:vim_markdown_auto_insert_bullets = 0
let g:vim_markdown_frontmatter = 1
let g:rustfmt_autosave = 1
let g:rustfmt_emit_files = 1
let g:rustfmt_fail_silently = 0
let g:rust_clip_command = 'xclip -selection clipboard'
let g:codestats_api_key = 'SFMyNTY.YW1SNGRBPT0jI05Ua3pOUT09.PPy-4F3qHwT8VKZqO2-nTNUB-KL-HH-OiQHAgdij2F0'
let g:closetag_filetypes = "html,php"
let g:clang_format#auto_format = 1

