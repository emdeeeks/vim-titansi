let s:plugin_name = 'vim-titansi'

if exists("g:loaded_vim-titansi") || &cp
  finish
endif

func! SetUp(...)
    call SetTerminalColors()
    call SetFileEncodings('cp437')
    call SetFormattingOptions()
    call LoadAnsiEsc()
    call SetUpControlsBar()
    call ParseSauce()
endfunction

func! TearDown(...)
    call RestoreTerminalColors()
    call RestoreFileEncodings()
endfunction


func! s:init(...)
    call SetUp()
    " need to add conditional stuff here for various file formats

    " need to parse SAUCE info
    " ref: http://www.acid.org/info/sauce/sauce.htm

    " set width to 80. ditch wrapping

    " does this help?"
    autocmd BufWritePre * :%s/\s\+$//e
endfunction

func! s:deinit(...)
    " set users terminal colors back to their originals!!!

    " restore file encodings
endfunction


"put this into something useful!!!!
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

au BufReadPre *.ans call SetUp()
au BufReadPost *.ans call TearDown()
au BufReadPre *.nfo call <SID>init()
au BufReadPost *.nfo call <SID>deinit()
au BufReadPre *.asc call SetUp()
au BufReadPost *.asc call TearDown()
au BufReadPre *.xbin call <SID>init()
au BufReadPost *.xbin call <SID>deinit()

func! SetTerminalColors(...)
    "Before setting these, they need to be saved somehow!

    call system('echo \x1b]4;1;#AD0000\007') "red
    call system('echo \x1b]4;9;#FF5255\007') "red
    ! "\x1b]4;10;#52FF52\007"); "green
    ! "\x1b]4;11;#FFFF52\007"); "yellow
    ! "\x1b]4;12;#5255FF\007"); "blue
    ! "\x1b]4;13;#FF55FF\007"); "magenta
    ! "\x1b]4;14;#52FFFF\007"); "cyan
    ! "\x1b]4;15;#FFFFFF\007"); "white


    ":call system('chmod +x ' . shellescape(fname))

    ":call system('chmod +x ' . shellescape())
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
endfunction

func! SetFormattingOptions()
    syntax off
    setlocal virtualedit=all
    hi ColorColumn ctermbg=8 guibg=8
"    setlocal wrapmargin=2
"    setlocal wrap
    setlocal columns=80
    setlocal ambiwidth=single
"    setlocal cc=81
    setlocal textwidth=80
    let no_plugin_maps = 1
endfunction

func! RestoreTerminalColors(...)
endfunction

function! SetFileEncodings(encodings)
    let b:myfileencodingsbak=&fileencodings
    let &fileencodings=a:encodings
endfunction

function! RestoreFileEncodings()
    let &fileencodings=b:myfileencodingsbak
    unlet b:myfileencodingsbak
endfunction

func! SetupControlsBar()
endfunction

func! LoadAnsiEsc()
    if exists("g:loaded_AnsiEscPlugin")
        silent! execute 'AnsiEsc'
    else
        finish
    endif
endfunction

func! SetUpControlsBar()
    silent! execute '5sp()'
    set unnumber
    set unruler
endfunction

func! ParseSauce()
    "Seek to start of SAUCE (Eof-128)
endfunction
