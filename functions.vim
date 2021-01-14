
" Changes array from
" [1,2,3]
"
" to
"
" [
"   1,
"   2,
"   3
" ]
func! FormatArray()
  exe "normal ^v$h"
  s/\[\ */\[\r/g
  exe "normal $h"
  s/, */,\r/g
  exe "normal $h"
  s/\ *\]/\r\]/g
  exe "normal ="
endfunc


" Output the Story Number during git-commit
autocmd BufRead COMMIT_EDITMSG :call StoryNumber()
func! StoryNumber()
  r ! git branch | grep \* | grep -o 'master\|EP-\d\{4\}'
  execute "normal kdd"
endfunc
