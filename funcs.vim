"function! Browse_rst()
    "silent exe "!rst2html.py "."%:p".' '.$TEMP.'\'.expand("%:t")
    "silent exe "!@start ".'firefox '.$TEMP.'\'.expand("%:t")
"endfunction

" UltiSnips completion function that tries to expand a snippet. If there's no
" snippet for expanding, it checks for completion window and if it's
" shown, selects first element. If there's no completion window it tries to
" jump to next placeholder. If there's no placeholder it just returns TAB key
function! g:UltiSnips_Complete()
    call UltiSnips_ExpandSnippet()
    if g:ulti_expand_res == 0
        if pumvisible()
            return "\<C-n>"
        else
            call UltiSnips_JumpForwards()
            if g:ulti_jump_forwards_res == 0
               return "\<TAB>"
            endif
        endif
    endif
    return ""
endfunction

function! g:StripTrailingWhitespace()
    if !exists('g:spf13_keep_trailing_whitespace')
        " Preparation: save last search, and cursor position.
        let _s=@/
        let l = line(".")
        let c = col(".")
        " do the business:
        %s/\s\+$//e
        " clean up: restore previous search history, and cursor position
        let @/=_s
        call cursor(l, c)
    endif
endfunction

" Telling the user whether "list mode" is on/off is not very informative.
" Instead, say exactly which feature they gained, and exactly which one they
" lost, by choosing this mode:
function! g:List_toggle()
  set list!
  let l:list_feat = "Showing Tabs"
  let l:nolist_feat = "Wrapping Words"
  echo (&list ? l:list_feat : l:nolist_feat)."! (but not ".
        \ (&list ? l:nolist_feat : l:list_feat).")"
endfunction

function! g:SetSTLColors()
  " This function set user highlight groups to appropriate guifg color of
  " themes StatusLine highlight group.
  redir => stl_hl_group
  silent hi! StatusLine
  redir END
  let fgcolor = matchstr(stl_hl_group,'\vguifg\=\#\zs.{6}\ze')
  exec 'silent hi! User1 guifg=#'.fgcolor.' guibg=#1d1f21'.' gui=NONE,reverse term=NONE,reverse'
  exec 'silent hi! User2 guifg=#'.fgcolor.' guibg=#dd3333'.' gui=NONE,reverse term=NONE,reverse'
  exec 'silent hi! User3 guifg=#'.fgcolor.' guibg=#eea040'.' gui=NONE,reverse term=NONE,reverse'
  exec 'silent hi! User4 guifg=#'.fgcolor.' guibg=#a0ee40'.' gui=NONE,reverse term=NONE,reverse'
endfunction
