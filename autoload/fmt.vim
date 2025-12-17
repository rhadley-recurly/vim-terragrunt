" fmt.vim: Vim command to format terragrunt HCL files with terragrunt hcl fmt.

function! fmt#Format()
  write
  if !filereadable(expand('%:p'))
    return
  endif
  let l:curw = winsaveview()
  " Try new command first (Terragrunt >= v0.x with CLI redesign)
  let output = system('terragrunt hcl fmt --file "' . expand('%:p') . '"')
  " Fall back to old command if new command fails
  if v:shell_error != 0
    let output = system('terragrunt hclfmt --terragrunt-hclfmt-file "' . expand('%:p') . '"')
  endif
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
