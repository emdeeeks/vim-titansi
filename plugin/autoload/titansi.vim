let s:plugin_name = 'vim-titansi'

if exists("g:loaded_vim-titansi") || &cp
  finish
endif

func! s:init(...)
    " need to add conditional stuff here for various file formats

    " need to parse SAUCE info
    " ref: http://www.acid.org/info/sauce/sauce.htm

    " set file encoding
    call SetFileEncodings('cp437')

    syntax off
    setlocal virtualedit=all
    setlocal cc=80
    hi ColorColumn ctermbg=8 guibg=8

    " reset terminal colors to ansi colors
    " this will be diiiiiiirty and should maybe be in a function, or script
    silent! execute 'x-terminal-emulator -e \e]P0151515' "black
    silent! execute '\e]P1cc6666' "darkred
    silent! execute '\e]P2B5BD68' "darkgreen
    silent! execute '\e]P3F0C674' "brown
    silent! execute '\e]P481A2BE' "darkblue
    silent! execute '\e]P5B294BB' "darkmagenta
    silent! execute '\e]P68ABEB7' "darkcyan
    silent! execute '\e]P7CCCCCC' "lightgrey
    silent! execute '\e]P8969896' "darkgrey
    silent! execute 'x-terminal-emulator -e \e]P9cc6666' "red
    silent! execute '\e]PAB5BD68' "green
    silent! execute '\e]PBf0c674' "yellow
    " echo -en "\e]PC81A2BE" #blue
    " echo -en "\e]PDB294BB" #magenta
    " echo -en "\e]PE8ABEB7" #cyan
    " echo -en "\e]PFf5f5f5" #white

    " set width to 80. ditch wrapping
    setlocal textwidth=80
    setlocal wrapmargin=2
    setlocal wrap
    setlocal columns=80
    setlocal ambiwidth=single
    setlocal cc=80
    setlocal textwidth=80
    let no_plugin_maps = 1

    if exists("g:loaded_AnsiEscPlugin")
        silent! execute 'AnsiEsc'
    endif

    " does this help?"
    autocmd BufWritePre * :%s/\s\+$//e
endfunction

func! s:deinit(...)
    " set users terminal colors back to their originals!!!

    " restore file encodings
    call RestoreFileEncodings()
endfunction

function! SetFileEncodings(encodings)
    let b:myfileencodingsbak=&fileencodings
    let &fileencodings=a:encodings
endfunction

function! RestoreFileEncodings()
    let &fileencodings=b:myfileencodingsbak
    unlet b:myfileencodingsbak
endfunction

" put this into something useful!!!!
function s:ReplaceInsertModeWithReplace()
    if v:insertmode isnot# 'r'
        call feedkeys("\R", "n")
    endif
endfunction

"augroup ForbidInsertMode
"    autocmd!
"    autocmd ReplaceEnter  * call ReplaceInsertModeWithReplace()
"    autocmd ReplaceChange * call ReplaceInsertModeWithReplace()
"augroup END

au BufReadPre *.ans call <SID>init()
au BufReadPost *.ans call <SID>deinit()
au BufReadPre *.nfo call <SID>init()
au BufReadPost *.nfo call <SID>deinit()
au BufReadPre *.asc call <SID>init()
au BufReadPost *.asc call <SID>deinit()
au BufReadPre *.xbin call <SID>init()
au BufReadPost *.xbin call <SID>deinit()
