exe lambda#setup()

let s:foo = 1

" run simple function.
if lambda#once(s:, 'a:1+a:2')(1, 2) != 3
  throw "failed"
endif

" run simple function with _ context.
if lambda#once(s:, '_[0] . (a:1+a:2) . _[1]', 'foo', 'bar')(1, 2) != 'foo3bar'
  throw "failed"
endif

" generate function reference, and call it.
let s:X = lambda#gen(s:, 'eval(join(a:000, "+"))')
if s:X(1,2,3,4,5,6,7,8,9,10) != 55
  throw "failed"
endif

" refer script scope variable
if lambda#once(s:, 's:foo + a:1')(3) != 4
  throw "failed"
endif
