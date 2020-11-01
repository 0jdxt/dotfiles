let g:lightline = {
    \ 'colorscheme': 'nord_subtle',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'readonly', 'gitbranch', 'filename', 'modified' ] ],
    \   'right': [[ 'filetype', 'lineinfo' ], [ 'cocstatus' ]]
    \ },
    \ 'component': {
    \   'readonly': '%{&readonly ? "" : ""}',
    \   'modified': '%{&modified ? "" : ""}',
    \ },
    \ 'component_function': {
    \   'gitbranch': 'GitBranch',
    \   'lineinfo': 'GetLineInfo',
    \   'mode': 'LightlineMode',
    \   'filetype': 'LightlineFiletype',
    \   'filename': 'LightlineFilename',
    \   'percent': 'LightlinePercent',
    \   'cocstatus': 'LightlineCoc',
    \ },
    \ 'component_expand': {
    \   'buffers': 'lightline#bufferline#buffers',
    \ },
    \ 'tabline': {
    \   'left': [ [ 'buffers' ] ],
    \   'right': [ [ 'tabs' ], [ ] ]
    \ },
    \ 'component_type': {
    \   'buffers': 'tabsel',
    \ },
    \ 'separator': { 'left': '', 'right': '' },
    \ 'subseparator': { 'left': '', 'right': '' },
    \ }

let g:lightline#bufferline#show_number = 1

let s:size_flag = winwidth(0) < 70

function! LightlineCoc()
    return s:size_flag ? '' : coc#status()
endfunction

function! LightlineMode()
    let ftmap = {
                \ 'coc-explorer': 'EXPLORER',
                \ 'fugitive': 'FUGITIVE',
                \ 'startify': 'STARTIFY',
                \ }
    return get(ftmap, &filetype, lightline#mode())
endfunction

function! LightlineFiletype()
  return s:size_flag && &filetype !=# '' ? &filetype : ''
endfunction

function! LightlineFilename()
  return s:size_flag ? WebDevIconsGetFileTypeSymbol().' '.expand('%:t') : ''
endfunction

function! ReadOnly()
    return &readonly && &filetype !=# "help" ? "" : ""
endfunction

function! GitBranch()
    let l:head=fugitive#head(8)
    return strwidth(l:head) > 0 ?  ' '.head : ''
endfunction

function! GetLineInfo()
    if winwidth(0) < 86
        return ''
    endif

    let l:current_line = printf("%2s", line('.'))
    let l:max_line = printf("%s", line('$'))
    let l:lineinfo = ' '.l:current_line.'/'.l:max_line.'  '.col('.')
    return l:lineinfo
endfunction

