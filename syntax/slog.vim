if exists('b:current_syntax')
  finish
endif

syn match log_debug2   '.*\(SLOG2_DEBUG2\).*'
syn match log_debug1   '.*\(SLOG2_DEBUG1\).*'
syn match log_info     '.*\(SLOG2_INFO\).*'
syn match log_notice   '.*\(SLOG2_NOTICE\).*'
syn match log_warning  '.*\(SLOG2_WARNING\).*'
syn match log_error    '.*\(SLOG2_ERROR\).*'

hi def link log_debug2      StatusLine
hi def link log_debug1      StatusLineNC
hi def link log_info        Normal
hi def link log_notice      Title
hi def link log_warning     WarningMsg
hi def link log_error       ErrorMsg

let b:current_syntax = 'slog'
