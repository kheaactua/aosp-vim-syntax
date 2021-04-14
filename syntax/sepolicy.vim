if exists('b:current_syntax')
  finish
endif

syn region comment start=/#/ end=/$/ oneline

" Defines that aren't handled by other rules (like typeLine and ruleLine)
syn keyword def define_prop

syn region stringLiteral start="`" skip="`" end="'" contains=ruleLine

syn region  typeLine start=/^\s*type/ end=";"
syn keyword knownTypeAttrs contained domain coredomain exec_type file_type vendor_init system_file_type containedin=typeLine
syn match   typeDomain     contained /[a-zA-Z_]\+/ containedin=typeLine skipwhite
syn keyword typeStart      contained type containedin=typeLine nextgroup=typeDomain

syn region ruleLine start=/^\s*allow/ end=";"
syn region ruleLine start=/^\s*neverallow/ end=";"
syn region ruleLine start=/^type_transition/ end=";"
syn region ruleLine start=/^allowxperm/ end=";"
syn region ruleLine start=/^dontaudit/ end=";"

syn match  rulePerm contained /[a-zA-Z_]\+/ containedin=ruleLine skipwhite
syn region rulePerm contained matchgroup="block" start="{" end="}" containedin=ruleLine skipwhite

syn match  ruleClass contained /:\s*[a-zA-Z_]\+/ containedin=ruleLine skipwhite nextgroup=rulePerm
syn region ruleClass contained matchgroup="block" start=":\s*{" end="}" containedin=ruleLine skipwhite nextgroup=rulePerm

syn region ruleType contained start=/[a-zA-Z]/ end=/\w\s*:\@=/ containedin=ruleLine nextgroup=ruleClass

syn match  ruleMDomain contained /-[a-zA-Z_]\+/ containedin=ruleDomain skipwhite
syn match  ruleDomain  contained /[a-zA-Z_]\+/  containedin=ruleLine skipwhite nextgroup=ruleType
syn region ruleDomain  contained matchgroup="block" start="{" end="}" containedin=ruleLine skipwhite nextgroup=ruleType


syn keyword ruleStart contained type allow neverallow type_transition allowxperm dontaudit containedin=ruleLine nextgroup=ruleDomain

syn keyword class contained key fd dir file fifo_file sock_file unix_dgram_socket unix_stream_socket process capability lnk_file chr_file containedin=ruleClass

" Technically I should go through the docs and apply specific permissions to
" each attribute type, but that's a lot of work
syn keyword perm read dsprivlogcap rmdir add_name search write remove_name open getattr open sendto add_name setuid setgid setattr rw_file_perms unlink unpriv_binder_ioctls r_dir_perms r_file_perms execute audit_access create lock ioctl append rename transition siginh noatsecure rlimitinh use sigchld fork sigkill sigstop signull signal getsched setsched getsession getpgid setpgid getcap setcap setrlimit containedin=rulePerm

syn region label start=/u:/ end=/:s0/

syn keyword macro __unix_socket_connect__ add_hwservice add_service app_domain binder_call binder_service binder_use bluetooth_domain build_test_only can_profile_heap can_profile_heap_central can_profile_heap_userdebug_or_eng can_profile_perf carwatchdog_client_domain compatible_property_only control_logd crash_dump_fallback create_pty define_prop domain_auto_trans domain_trans dump_extra_hal dump_hal file_type_auto_trans file_type_trans full_treble_only get_prop gpu_access hal_attribute hal_attribute_hwservice hal_client_domain hal_server_domain hwbinder_use init_daemon_domain net_domain never_profile_heap never_profile_perf non_system_app_set not_compatible_property not_full_treble passthrough_hal_client_domain pdx_client pdx_connect pdx_server pdx_service_attributes pdx_service_socket_types pdx_use perfetto_producer print product_internal_prop product_public_prop product_restricted_prop r_dir_file read_logd read_runtime_log_tags recovery_only selinux_check_access selinux_check_context set_prop system_internal_prop system_public_prop system_restricted_prop system_vendor_config_prop tmpfs_domain treble_sysprop_neverallow unix_socket_connect unix_socket_send untrusted_app_domain use_cLightBluestore use_drmservice use_keystore userbuild userdebug_or_eng vendor_internal_prop vendor_public_prop vendor_restricted_prop vndbinder_use wakelock_use with_asan with_dexpreopt with_native_coverage write_logd

" Make things a little more distinct
hi perm ctermfg=LightRed guifg=LightRed

hi ruleMDomain term=italic cterm=italic gui=italic
hi rulePerm term=bold cterm=bold gui=bold
hi ruleType term=bold cterm=bold gui=bold
hi ruleStart term=bold cterm=bold gui=bold

hi def link def             Keyword
hi def link stringLiteral   String
hi def link knownTypeAttrs  Keyword
hi def link typeStart       Statement
hi def link typeDomain      Type
hi def link ruleStart       Statement
hi def link ruleDomain      Structure
hi def link ruleType        Type
hi def link class           Type
hi def link perm            Keyword
hi def link macro           Macro
hi def link label           Type
hi def link ruleMDomain     Exception

let b:current_syntax = 'sepolicy'
