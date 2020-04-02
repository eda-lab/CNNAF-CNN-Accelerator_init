set_global_assignment -entity "fp_acc" -library "lib_fp_acc" -name IP_TOOL_NAME "altera_fp_acc_custom"
set_global_assignment -entity "fp_acc" -library "lib_fp_acc" -name IP_TOOL_VERSION "17.1"
set_global_assignment -entity "fp_acc" -library "lib_fp_acc" -name IP_TOOL_ENV "mwpim"
set_global_assignment -library "lib_fp_acc" -name SPD_FILE [file join $::quartus(sip_path) "fp_acc.spd"]

set_global_assignment -library "lib_fp_acc" -name MISC_FILE [file join $::quartus(sip_path) "fp_acc_sim/dspba_library_package.vhd"]
set_global_assignment -library "lib_fp_acc" -name MISC_FILE [file join $::quartus(sip_path) "fp_acc_sim/dspba_library.vhd"]
set_global_assignment -library "lib_fp_acc" -name MISC_FILE [file join $::quartus(sip_path) "fp_acc_sim/fp_acc.vhd"]
