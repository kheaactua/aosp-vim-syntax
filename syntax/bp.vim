" Vim syntax file
" Language:	Bazel (http://bazel.io)
" Maintainer:	David Barnett (https://github.com/google/vim-ft-bzl)
" Last Change:	2015 Aug 11

if exists('b:current_syntax')
  finish
endif

source <sfile>:p:h/bzl.vim

syn keyword aidlPkg aidl_interface aidl_interfaces_metadata aidl_mapping

syn keyword androidPkg csuite_config filegroup license license_kind makefile_goal package prebuilt_build_tool soong_config_bool_variable soong_config_module_type soong_config_module_type_import soong_config_string_variable soong_namespace

syn keyword apexPkg apex apex_defaults apex_key apex_set apex_test apex_vndk override_apex prebuilt_apex

syn keyword artPkg art_apex art_apex_test art_apex_test_host art_cc_binary art_cc_defaults art_cc_library art_cc_library_static art_cc_test art_cc_test_library art_debug_defaults art_global_defaults libart_cc_defaults libart_static_cc_defaults

syn keyword bpfPkg bpf

syn keyword ccPkg cc_benchmark cc_benchmark_host cc_binary cc_binary_host cc_defaults cc_fuzz cc_genrule cc_library cc_library_headers cc_library_host_shared cc_library_host_static cc_library_shared cc_library_static cc_object cc_prebuilt_binary cc_prebuilt_library cc_prebuilt_library_headers cc_prebuilt_library_shared cc_prebuilt_library_static cc_prebuilt_object cc_prebuilt_test_library_shared cc_test cc_test_host cc_test_library kernel_headers llndk_headers llndk_libraries_txt llndk_library ndk_headers ndk_library ndk_prebuilt_object ndk_prebuilt_shared_stl ndk_prebuilt_static_stl preprocessed_ndk_headers recovery_snapshot recovery_snapshot_binary recovery_snapshot_header recovery_snapshot_object recovery_snapshot_shared recovery_snapshot_static toolchain_library vendor_public_library vendor_snapshot vendor_snapshot_binary vendor_snapshot_header vendor_snapshot_object vendor_snapshot_shared vendor_snapshot_static versioned_ndk_headers vndk_prebuilt_shared vndkcore_libraries_txt vndkcorevariant_libraries_txt vndkprivate_libraries_txt vndkproduct_libraries_txt vndksp_libraries_txt

syn keyword etcPkg 	prebuilt_dsp prebuilt_etc prebuilt_etc_host prebuilt_firmware prebuilt_font prebuilt_usr_share prebuilt_usr_share_host

syn keyword extClangPkg clang_binary_host clang_tblgen

syn keyword extLlvmPkg 	force_build_llvm_components_defaults llvm_defaults llvm_tblgen

syn keyword filesystemPkg android_filesystem bootimg logical_partition vbmeta

syn keyword fsconfigPkg target_fs_config_gen_filegroup

syn keyword genrulePkg genrule genrule_defaults gensrcs

syn keyword hidlPkg hidl_interface hidl_interfaces_metadata hidl_package_root prebuilt_hidl_interfaces

syn keyword javaPkg android_app android_app_certificate android_app_import android_app_set android_library android_library_import android_robolectric_runtimes android_robolectric_test android_test android_test_helper_app android_test_import boot_image dex_bootjars dex_import doc_defaults droiddoc droiddoc_exported_dir droiddoc_host droidstubs droidstubs_host global_compat_config hiddenapi_flags java_binary java_binary_host java_defaults java_device_for_host java_genrule java_genrule_host java_host_for_device java_import java_import_host java_library java_library_host java_library_static java_plugin java_sdk_library java_sdk_library_import java_system_modules java_system_modules_import java_test java_test_helper_library java_test_host java_test_import javadoc javadoc_host override_android_app override_android_test override_runtime_resource_overlay platform_compat_config prebuilt_apis prebuilt_boot_image prebuilt_platform_compat_config prebuilt_stubs_sources runtime_resource_overlay stubs_defaults tradefed_java_library_host

syn keyword kernelPkg prebuilt_kernel_modules

syn keyword linkerConfigPkg linker_config

syn keyword phonyPkg phony

syn keyword prebuiltsPkg clang_builtin_headers libclang_rt_llndk_library libclang_rt_prebuilt_library_shared libclang_rt_prebuilt_library_static llvm_darwin_filegroup llvm_host_defaults llvm_host_prebuilt_library_shared llvm_prebuilt_library_static

syn keyword pythonPkg python_binary_host python_defaults python_library python_library_host python_test python_test_host

syn keyword rustPkg rust_binary rust_binary_host rust_bindgen rust_bindgen_host rust_defaults rust_ffi rust_ffi_host rust_ffi_host_shared rust_ffi_host_static rust_ffi_shared rust_ffi_static rust_fuzz rust_library rust_library_dylib rust_library_host rust_library_host_dylib rust_library_host_rlib rust_library_rlib rust_prebuilt_dylib rust_prebuilt_library rust_prebuilt_rlib rust_proc_macro rust_protobuf rust_protobuf_host rust_test rust_test_host

syn keyword sdkPkg module_exports module_exports_snapshot sdk sdk_snapshot

syn keyword shPkg sh_binary sh_binary_host sh_test sh_test_host

syn keyword syspropPkg sysprop_library

syn keyword suiteHarnessPkg tradefed_binary_host

syn keyword xmlPkg prebuilt_etc_xml

syn keyword xsdcPkg xsd_config

syn keyword bootstrapPkg blueprint_go_binary bootstrap_go_binary bootstrap_go_package

syn match property "^ *[a-zA-Z_]*[a-zA-Z]:"

syn keyword boolean true false

syn keyword todo TODO

syn region cBlockComment start=/\v\/\*/ skip=/\v\\./ end=/\v\*\// contains=todo
syn region cLineComment start=/\v\/\// skip=/\v\\./ end=/\v$/ contains=todo

hi Boolean term=bold  cterm=bold ctermfg=brown  gui=bold  guifg=#ffff60
hi Todo term=bold  cterm=bold ctermfg=yellow  gui=bold  guifg=#ffff60

hi def link aidlPkg         Keyword
hi def link androidPkg      Keyword
hi def link apexPkg         Keyword
hi def link artPkg          Keyword
hi def link bpfPkg          Keyword
hi def link ccPkg           Keyword
hi def link etcPkg          Keyword
hi def link extClangPkg     Keyword
hi def link extLlvmPkg      Keyword
hi def link filesystemPkg   Keyword
hi def link fsconfigPkg     Keyword
hi def link genrulePkg      Keyword
hi def link hidlPkg         Keyword
hi def link javaPkg         Keyword
hi def link kernelPkg       Keyword
hi def link linkerConfigPkg Keyword
hi def link phonyPkg        Keyword
hi def link prebuiltsPkg    Keyword
hi def link pythonPkg       Keyword
hi def link rustPkg         Keyword
hi def link sdkPkg          Keyword
hi def link shPkg           Keyword
hi def link syspropPkg      Keyword
hi def link suiteHarnessPkg Keyword
hi def link xmlPkg          Keyword
hi def link xsdcPkg         Keyword
hi def link bootstrapPkg    Keyword

hi def link property        StorageClass
hi def link boolean         Boolean
hi def link cBlockComment   Comment
hi def link cLineComment    Comment
hi def link todo            Todo

let b:current_syntax = 'bp'
