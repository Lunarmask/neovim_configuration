" GIT COMMIT VALIDATION FUNCTIONS

" Output the Story Number during git-commit
"
autocmd BufRead COMMIT_EDITMSG :call StoryNumber()
func! StoryNumber()
  r ! git branch | grep \* | grep -o 'main\|master\|EP-\d\{4\}'
  execute "normal kdd"
endfunc


" Set textwidth for Git Commit Messages
"
autocmd BufWinEnter COMMIT_EDITMSG :call ForceGitLineWidth()
func! ForceGitLineWidth()
  set textwidth=120
  let &colorcolumn=&textwidth
  highlight ColorColumn ctermbg=235
endfunc


" Validate Commit Message character restrictions
"
autocmd BufWritePre COMMIT_EDITMSG :call GitCommitValidator()
func! GitCommitValidator()
  if strlen(getline(1)) >= &textwidth/2
    set nowrite
    echo "Commit Subject Line should not exceed " . &textwidth/2 . " characters length\n\n"
  endif

  if strlen(getline(2)) > 0
    set nowrite
    echo "Please leave an empty line after the Commit Subject Line\n\n"
  endif

  for line in range(3, GitCommitFloor())
    if strlen(getline(line)) >= &textwidth
      set nowrite
      echo line . ": Commit Body Text should not exceed " . &textwidth . " characters length\n\n"
    endif
  endfor

  if &write == 0
    echohl WarningMsg
    echo "------------------------------------------------"
    echo "Commit not saved: ':set write' to try again...\n"
    echohl none
  endif
endfunc

" Testline for GitCommitFloor ; :call GitCommitFloor()
"# On branch
func! GitCommitFloor()
  redir => capture
  silent! g/#\ On\ branch/
  redir END
  for val in split(capture," ")
    if val =~ '^\d\+$'
      return val
    endif
  endfor
endfunc
