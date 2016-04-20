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

    " reset terminal colors to ansi colors
    " this will be diiiiiiirty and should maybe be in a function, or script
    " echo -en "\e]P0151515" #black
    " echo -en "\e]P1cc6666" #darkred
    " echo -en "\e]P2B5BD68" #darkgreen
    " echo -en "\e]P3F0C674" #brown
    " echo -en "\e]P481A2BE" #darkblue
    " echo -en "\e]P5B294BB" #darkmagenta
    " echo -en "\e]P68ABEB7" #darkcyan
    " echo -en "\e]P7CCCCCC" #lightgrey
    " echo -en "\e]P8969896" #darkgrey
    " echo -en "\e]P9cc6666" #red
    " echo -en "\e]PAB5BD68" #green
    " echo -en "\e]PBf0c674" #yellow
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

    " call AnsiEsc() method in AnsiEsc plugin
     "call AnsiEsc()

    " set virtualedit
    setlocal virtualedit=all
    "autocmd BufWritePre * :%s/\s\+$//e
endfunction

func! s:deinit(...)
    " set users terminal colors back to their originals
    call RestoreFileEncodings()
endfunction

au BufReadPre *.ans call <SID>init()
au BufReadPost *.ans call <SID>deinit()
au BufReadPre *.nfo call <SID>init()
au BufReadPost *.nfo call <SID>deinit()
au BufReadPre *.asc call <SID>init()
au BufReadPost *.asc call <SID>deinit()
