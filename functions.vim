
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


