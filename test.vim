if !exists(g:test)
  let g:test = "test"
endif

function! KatTest()
  echom g:test
endfunction
