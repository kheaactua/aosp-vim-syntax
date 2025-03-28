if exists('b:current_syntax')
  finish
endif

syn match log_debug2   '.*\(SLOG2_DEBUG2\).*'
syn match log_debug1   '.*\(SLOG2_DEBUG1\).*'
syn match log_info     '.*\(SLOG2_INFO\).*'
syn match log_notice   '.*\(SLOG2_NOTICE\).*'
syn match log_warning  '.*\(SLOG2_WARNING\).*'
syn match log_error    '.*\(SLOG2_ERROR\).*'
syn match log_shutdown '.*\(SLOG2_SHUTDOWN\).*'

hi def link log_debug2      Comment
hi def link log_debug1      Comment
hi def link log_info        Normal
hi def link log_notice      Function
hi def link log_warning     WarningMsg
hi def link log_error       ErrorMsg
hi def link log_shutdown    Identifier

let b:current_syntax = 'slog'
