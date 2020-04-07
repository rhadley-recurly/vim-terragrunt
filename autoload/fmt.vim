" fmt.vim: Vim command to format terragrunt HCL files with terragrunt hclfmt.

function! fmt#Format()
  write
  if !filereadable(expand('%:p'))
    return
  endif
  let l:curw = winsaveview()
  let output = system('terragrunt hclfmt')
  if v:shell_error == 0
    try | silent undojoin | catch | endtry
    silent edit!
    let &syntax = &syntax
  else
    echo output
  endif
  call winrestview(l:curw)
endfunction

" vim:ts=2:sw=2:et
