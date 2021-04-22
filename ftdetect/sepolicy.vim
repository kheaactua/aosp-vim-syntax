autocmd BufRead,BufNewFile *.te setfiletype sepolicy
autocmd BufRead,BufNewFile te_macros setfiletype sepolicy
autocmd BufRead,BufNewFile */sepolicy/*_contexts setfiletype sepolicy
autocmd BufRead,BufNewFile */sepolicy/**/attributes setfiletype sepolicy
