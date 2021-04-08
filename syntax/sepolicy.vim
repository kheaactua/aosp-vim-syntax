" Vim syntax file
" Language:	Bazel (http://bazel.io)
" Maintainer:	David Barnett (https://github.com/google/vim-ft-bzl)
" Last Change:	2015 Aug 11

if exists('b:current_syntax')
  finish
endif

source $VIMRUNTIME/syntax/sh.vim

syn keyword def type allow neverallow define_prop

syn keyword macro __unix_socket_connect__ add_hwservice add_service app_domain binder_call binder_service binder_use bluetooth_domain build_test_only can_profile_heap can_profile_heap_central can_profile_heap_userdebug_or_eng can_profile_perf carwatchdog_client_domain compatible_property_only control_logd crash_dump_fallback create_pty define_prop domain_auto_trans domain_trans dump_extra_hal dump_hal file_type_auto_trans file_type_trans full_treble_only get_prop gpu_access hal_attribute hal_attribute_hwservice hal_client_domain hal_server_domain hwbinder_use init_daemon_domain net_domain never_profile_heap never_profile_perf non_system_app_set not_compatible_property not_full_treble passthrough_hal_client_domain pdx_client pdx_connect pdx_server pdx_service_attributes pdx_service_socket_types pdx_use perfetto_producer print product_internal_prop product_public_prop product_restricted_prop r_dir_file read_logd read_runtime_log_tags recovery_only selinux_check_access selinux_check_context set_prop system_internal_prop system_public_prop system_restricted_prop system_vendor_config_prop tmpfs_domain treble_sysprop_neverallow unix_socket_connect unix_socket_send untrusted_app_domain use_credstore use_drmservice use_keystore userbuild userdebug_or_eng vendor_internal_prop vendor_public_prop vendor_restricted_prop vndbinder_use wakelock_use with_asan with_dexpreopt with_native_coverage write_logd

hi Boolean term=bold  cterm=bold ctermfg=brown  gui=bold  guifg=#ffff60
hi Todo term=bold  cterm=bold ctermfg=yellow  gui=bold  guifg=#ffff60

syn region label start=/\vu:/ skip=/\v\\./ end=/\v:s0/

hi def link def        Keyword
hi def link macro      Keyword

let b:current_syntax = 'sepolicy'
