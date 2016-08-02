let s:plugin_name = 'vim-titansi'

if exists("g:loaded_vim-titansi") || &cp
  finish
endif

func! s:init(...)
    call SetTerminalColors()
    call SetFileEncodings('cp437')
    call SetFormattingOptions()
    call LoadAnsiEsc()
    call SetUpControlsBar()
    call ParseSauce()

    " need to add conditional stuff here for various file formats

    " does this help?"
    "autocmd BufWritePre * :%s/\s\+$//e
endfunction

func! s:deinit(...)
    call RestoreTerminalColors()
    call RestoreFileEncodings()
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

func! SetTerminalColors(...)
    " The users current colors should be read and stored first

    "call system('echo \x1b]4;1;#000000\007')
    "call system('echo \x1b]4;1;#800000\007')
    "call system('echo \x1b]4;1;#008000\007')
    "call system('echo \x1b]4;1;#808000\007')
    "call system('echo \x1b]4;1;#000080\007')
    "call system('echo \x1b]4;1;#800080\007')
    "call system('echo \x1b]4;1;#008080\007')
    "call system('echo \x1b]4;1;#C0C0C0\007')

    "call system('echo \x1b]4;1;#808080\007')
    "call system('echo \x1b]4;1;#FF0000\007')
    "call system('echo \x1b]4;1;#00FF00\007')
    "call system('echo \x1b]4;1;#FFFF00\007')
    "call system('echo \x1b]4;1;#0000FF\007')
    "call system('echo \x1b]4;1;#FF00FF\007')
    "call system('echo \x1b]4;1;#00FFFF\007')
    "call system('echo \x1b]4;1;#FFFFFF\007')
endfunction

func! SetFormattingOptions()
    syntax off
    setlocal virtualedit=all
    hi ColorColumn ctermbg=8 guibg=8
    "setlocal wrapmargin=2
    "setlocal wrap
    setlocal columns=80
    setlocal ambiwidth=single
    "setlocal cc=81
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

func! LoadAnsiEsc()
    if exists("g:loaded_AnsiEscPlugin")
        silent! execute 'AnsiEsc'
    else
        finish
    endif
endfunction

func! SetUpControlsBar()
    silent! execute '5sp()'
    set nonumber
    set noruler
endfunction

func! ParseSauce()
    " ref: http://www.acid.org/info/sauce/sauce.htm
    " Seek to start of SAUCE (Eof-128)
endfunction
