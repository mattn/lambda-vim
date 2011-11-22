function! lambda#setup()
return ""
\."function! s:.lambda_gen(once, expr, ...)\n"
\."  if a:once\n"
\."    let n = 0\n"
\."  else\n"
\."    let n = get(s:, '_lambda_n', 0) + 1\n"
\."    let s:_lambda_n = n\n"
\."  endif\n"
\."  let s:['_lambda_a'.n] = a:000\n"
\."  exe \"function! s:_lambda_f\".n.\"(...)\\nlet _ = s:['_lambda_a'.matchstr(expand('<sfile>'), '_lambda_f\\\\zs[0-9]\\\\+\\\\ze')]\\nreturn \".a:expr.\"\\nendfunction\\n\"\n"
\."  return function(\"s:_lambda_f\".n)\n"
\."endfunction\n"
endfunction

function! lambda#gen(s, ...)
  return call(a:s['lambda_gen'], [0]+a:000, a:s)
endfunction

function! lambda#once(s, ...)
  return call(a:s['lambda_gen'], [1]+a:000, a:s)
endfunction
