function! StartMemo(...)
    split tmp-memo
    let w:args=join(a:000, " ")
endfunction

function! FinishMemo()
    execute "silent write !memo " . w:args
    q!
endfunction

function! SeeMemo(var)
    if a:var == 's'
        split ~/memos/memo.md
    else
        vsplit ~/memos/memo.md
    endif
endfunction

command! -nargs=* Memo :call StartMemo(<f-args>)
command! -nargs=0 MemoClose :call FinishMemo()
command! -nargs=1 MemoList :call SeeMemo(<f-args>)
