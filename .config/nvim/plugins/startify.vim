let g:startify_session_persistence = 1
let g:startify_change_to_vcs_root = 1
let g:startify_bookmarks = [
        \ {'a': '~/.config/alacritty/alacritty.yml' },
        \ {'b': '~/.config/bspwm/bspwmrc' },
        \ {'d': '/usr/local/etc/doas.conf' },
        \ {'i': '~/.config/i3/config' },
        \ {'m': '~/.config/neomutt/muttrc' },
        \ {'p': '~/.config/polybar/config' },
        \ {'pi': '~/.config/picom.conf' },
        \ {'s': '~/.config/sxhkd/sxhkdrc' },
        \ {'v': '~/.config/nvim/init.vim' },
        \ {'x': '~/.config/X11/Xresources' },
        \ {'z': '~/.config/zsh/.zshrc' }
        \ ]

function! StartifyEntryFormat()
    return 'WebDevIconsGetFileTypeSymbol(absolute_path)." ".entry_path'
endfunction
