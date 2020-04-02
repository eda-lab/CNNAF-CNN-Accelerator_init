set_global_assignment -entity "fp_add" -library "lib_fp_add" -name IP_TOOL_NAME "altera_fp_functions"
set_global_assignment -entity "fp_add" -library "lib_fp_add" -name IP_TOOL_VERSION "17.1"
set_global_assignment -entity "fp_add" -library "lib_fp_add" -name IP_TOOL_ENV "mwpim"
set_global_assignment -library "lib_fp_add" -name SPD_FILE [file join $::quartus(sip_path) "fp_add.spd"]

set_global_assignment -library "lib_fp_add" -name MISC_FILE [file join $::quartus(sip_path) "fp_add_sim/fp_add.vo"]
