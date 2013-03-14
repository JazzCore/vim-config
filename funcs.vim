"function! Browse_rst()
    "silent exe "!rst2html.py "."%:p".' '.$TEMP.'\'.expand("%:t")
    "silent exe "!@start ".'firefox '.$TEMP.'\'.expand("%:t")
"endfunction
