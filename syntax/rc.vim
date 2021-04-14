" Vim syntax file
" Language: Android Init Language
" Original Author: Chris McClellan


syn match rcComment '#.*'
syn keyword rcImport import
syn keyword rcKeyword on
                    \ service

"Options are service modifiers
syn match rcOption /^\v\s+critical/
syn match rcOption /^\v\s+disabled/
syn match rcOption /^\v\s+setenv/
syn match rcOption /^\v\s+socket/
syn match rcOption /^\v\s+setrlimit/
syn match rcOption /^\v\s+seclabel/
syn match rcOption /^\v\s+oneshot$/
syn match rcOption /^\v\s+onrestart/
syn match rcOption /^\v\s+writepid/
syn match rcOption /^\v\s+priority/
syn match rcOption /^\v\s+namespace/
syn match rcOption /^\v\s+oom_score_adjust/
syn match rcOption /^\v\s+shutdown/
syn match rcOption /\v^\s+class\s/
syn match rcOption /\v\s+interface/
syn match rcOption /\v\s+file\s/

syn match rcOptionConsole /\v^\s+console>.*$/
syn keyword rcOptionConsoleDevices contained kmsg kmsg_debug tty containedin=rcOptionConsole
syn match rcOptionConsoleOption contained /\v^\s+\w+>/ skipwhite nextgroup=rcOptionConsoleDevices containedin=rcOptionConsole

syn match rcOptionUser /\v^\s+(user|group)>.*$/
syn keyword rcOptionUserPrivUser contained root system containedin=rcOptionUser
syn match rcOptionUserUser contained /\v\w+/ containedin=rcOptionUser
syn cluster rcOptionConsolUsers contains=rcOptionConsolePrivUser,rcOptionConsoleUser
syn match rcOptionUserOption contained /\v^\s+\w+>/ skipwhite nextgroup=rcOptionConsolUsers containedin=rcOptionUser

syn match rcOptionCap /\v^\s+capabilities>.*$/
syn keyword rcOptionCapCaps contained CHOWN DAC_OVERRIDE DAC_READ_SEARCH FOWNER FSETID KILL SETGID SETUID SETPCAP LINUX_IMMUTABLE NET_BIND_SERVICE NET_BROADCAST NET_ADMIN NET_RAW IPC_LOCK IPC_OWNER SYS_MODULE SYS_RAWIO SYS_CHROOT SYS_PTRACE SYS_PACCT SYS_ADMIN SYS_BOOT SYS_NICE SYS_RESOURCE SYS_TIME SYS_TTY_CONFIG MKNOD LEASE AUDIT_WRITE AUDIT_CONTROL SETFCAP MAC_OVERRIDE MAC_ADMIN SYSLOG WAKE_ALARM BLOCK_SUSPEND AUDIT_READ containedin=rcOptionCap
syn match rcOptionCapOption contained /\v^\s+\w+>/ skipwhite nextgroup=rcOptionCapDevices containedin=rcOptionCap

" These can't be processed as a keyword
"no args, so can be end of line
syn match rcOption /\sanimation class[\s\n]/
"these have value args, so can't be end of line
syn match rcOption /\smemcg.swappiness\s/
syn match rcOption /\smemcg.soft_limit_in_bytes\s/
syn match rcOption /\smemcg.limit_in_bytes\s/

" discovered by grepping init.rc for the word trigger
" keywords struggle with non-alph characters, so we match instead
syn match rcTrigger /\scharger[\s\n]/
syn match rcTrigger /\sinit[\s\n]/
syn match rcTrigger /\searly-init[\s\n]/
syn match rcTrigger /\slate-init[\s\n]/
syn match rcTrigger /\searly-fs[\s\n]/
syn match rcTrigger /\spost-fs-data[\s\n]/
syn match rcTrigger /\spost-fs[\s\n]/
syn match rcTrigger /\slate-fs[\s\n]/
syn match rcTrigger /\sfs[\s\n]/
syn match rcTrigger /\szygote-start[\s\n]/
syn match rcTrigger /\sload_persist_props_action[\s\n]/
syn match rcTrigger /\sfirmware_mounts_complete[\s\n]/
syn match rcTrigger /\searly-boot[\s\n]/
syn match rcTrigger /\sboot[\s\n]/

"Commands are... commands... that can be executed in a trigger
" This is a naive implementation. It would be better to make a trigger a region and only activate these inside.
syn keyword rcCommand
                    \ bootchart
                    \ chmod
                    \ chown
                    \ class_start
                    \ class_stop
                    \ class_reset
                    \ class_restart
                    \ copy
                    \ domainname
                    \ exec
                    \ exec_background
                    \ exec_start
                    \ export
                    \ hostname
                    \ ifup
                    \ insmod
                    \ load_all_props
                    \ load_persist_props
                    \ loglevel
                    \ mkdir
                    \ mount_all
                    \ mount
                    \ restart
                    \ restorecon
                    \ restorecon_recursive
                    \ rm
                    \ rmdir
                    \ readahead
                    \ setprop
                    \ setrlimit
                    \ stop
                    \ swapon_all
                    \ symlink
                    \ sysclktz
                    \ umount
                    \ verity_load_state
                    \ verity_update_state
                    \ wait
                    \ wait_for_prop
                    \ installkey
                    \ init_user0

" These are common in file paths and as parts of other names
syn match rcCommand /\strigger\s/
syn match rcCommand /\senable[\s\n]/
syn match rcCommand /\sstart\s/
syn match rcCommand /\swrite\s/

" Order matters here.
" We must declatre the identifier region after the operators in order to get the identifier highlight.
" The matchgroup allows the operators to not be over-riden by the region while still allowing the end match.
syn match rcInterpolator '${'
syn match rcInterpolator '}'
syn region rcInterpolate matchgroup=rcInterpolator start='${' end='}' contains=rcInterpolator

syn match rcPropertyTrigger '='
syn match rcPropertyTrigger 'property:'
syn region rcProperty matchgroup=rcPropertyTrigger start='property:' end='=' contains=rcPropertyTrigger

syn match rcOperator '&&'
syn match rcNumber /[-]\?\d\+/

hi def link rcComment Comment
hi def link rcImport Include
hi def link rcKeyword Statement
" hi def link rcOptionAll Statement
hi def link rcOption Statement
hi def link rcOptionConsoleOption Statement
hi def link rcOptionConsoleDevices Type
hi def link rcOptionUserOption Statement
hi def link rcOptionUserPrivUser Type
hi def link rcOptionUserUser Type
hi def link rcOptionCapOption Statement
hi def link rcOptionCapCaps Type
hi def link rcCommand Keyword
hi def link rcTrigger Type
hi def link rcDevices Type

hi def link rcInterpolator Operator
hi def link rcInterpolate Identifier
hi def link rcPropertyTrigger Operator
hi def link rcProperty Identifier

hi def link rcOperator Operator
hi def link rcNumber Number

hi rcOptionUserPrivUser ctermfg=LightRed guifg=LightRed

let b:current_syntax = "rc"
