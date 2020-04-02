set_global_assignment -entity "fp_cmp_bias" -library "lib_fp_cmp_bias" -name IP_TOOL_NAME "altera_fp_functions"
set_global_assignment -entity "fp_cmp_bias" -library "lib_fp_cmp_bias" -name IP_TOOL_VERSION "17.1"
set_global_assignment -entity "fp_cmp_bias" -library "lib_fp_cmp_bias" -name IP_TOOL_ENV "mwpim"
set_global_assignment -library "lib_fp_cmp_bias" -name SPD_FILE [file join $::quartus(sip_path) "fp_cmp_bias.spd"]

set_global_assignment -library "lib_fp_cmp_bias" -name MISC_FILE [file join $::quartus(sip_path) "fp_cmp_bias_sim/fp_cmp_bias.vo"]
