if exists('b:current_syntax')
  finish
endif

source $VIMRUNTIME/syntax/java.vim

syn keyword direction oneway

hi def link direction          Keyword

let b:current_syntax = 'aidl'
