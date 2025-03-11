if exists('b:current_syntax')
  finish
endif

syn match log_debug2   '.*\s\(V\)\s.*'
syn match log_debug1   '.*\s\(D\)\s.*'
syn match log_info     '.*\s\(I\)\s.*'
syn match log_notice   '.*\s\(N\)\s.*'
syn match log_warning  '.*\s\(W\)\s.*'
syn match log_error    '.*\s\(E\)\s.*'

hi def link log_debug2    StatusLine
hi def link log_debug1    StatusLineNC
hi def link log_info      Normal
hi def link log_notice    Title
hi def link log_warning   WarningMsg
hi def link log_error     ErrorMsg

let b:current_syntax = 'logcat'
