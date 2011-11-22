exe lambda#setup()

let s:foo = 1

if lambda#once(s:, 'a:1+a:2')(1, 2) != 3
  throw "failed"
endif

if lambda#once(s:, '_[0] . (a:1+a:2) . _[1]', 'foo', 'bar')(1, 2) != 'foo3bar'
  throw "failed"
endif

let s:X = lambda#gen(s:, 'eval(join(a:000, "+"))')
if s:X(1,2,3,4,5,6,7,8,9,10) != 55
  throw "failed"
endif
