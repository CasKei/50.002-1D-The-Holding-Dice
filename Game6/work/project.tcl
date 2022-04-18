set projDir "C:/Users/cassi/Workspace/repostorage/toying_with_fpga/Game6/work/vivado"
set projName "Game6"
set topName top
set device xc7a35tftg256-1
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "C:/Users/cassi/Workspace/repostorage/toying_with_fpga/Game6/work/verilog/au_top_0.v" "C:/Users/cassi/Workspace/repostorage/toying_with_fpga/Game6/work/verilog/reset_conditioner_1.v" "C:/Users/cassi/Workspace/repostorage/toying_with_fpga/Game6/work/verilog/edge_detector_2.v" "C:/Users/cassi/Workspace/repostorage/toying_with_fpga/Game6/work/verilog/button_conditioner_3.v" "C:/Users/cassi/Workspace/repostorage/toying_with_fpga/Game6/work/verilog/gamebeta_4.v" "C:/Users/cassi/Workspace/repostorage/toying_with_fpga/Game6/work/verilog/dice_seg_5.v" "C:/Users/cassi/Workspace/repostorage/toying_with_fpga/Game6/work/verilog/display_player_score_6.v" "C:/Users/cassi/Workspace/repostorage/toying_with_fpga/Game6/work/verilog/pipeline_7.v" "C:/Users/cassi/Workspace/repostorage/toying_with_fpga/Game6/work/verilog/dice_8.v" "C:/Users/cassi/Workspace/repostorage/toying_with_fpga/Game6/work/verilog/alu_16_9.v" "C:/Users/cassi/Workspace/repostorage/toying_with_fpga/Game6/work/verilog/game_CU_10.v" "C:/Users/cassi/Workspace/repostorage/toying_with_fpga/Game6/work/verilog/regfile_11.v" "C:/Users/cassi/Workspace/repostorage/toying_with_fpga/Game6/work/verilog/multi_seven_seg_12.v" "C:/Users/cassi/Workspace/repostorage/toying_with_fpga/Game6/work/verilog/edge_detector_13.v" "C:/Users/cassi/Workspace/repostorage/toying_with_fpga/Game6/work/verilog/counter_14.v" "C:/Users/cassi/Workspace/repostorage/toying_with_fpga/Game6/work/verilog/pn_gen_15.v" "C:/Users/cassi/Workspace/repostorage/toying_with_fpga/Game6/work/verilog/adder_16_16.v" "C:/Users/cassi/Workspace/repostorage/toying_with_fpga/Game6/work/verilog/boolean_16_17.v" "C:/Users/cassi/Workspace/repostorage/toying_with_fpga/Game6/work/verilog/shifter_16_18.v" "C:/Users/cassi/Workspace/repostorage/toying_with_fpga/Game6/work/verilog/compare_16_19.v" "C:/Users/cassi/Workspace/repostorage/toying_with_fpga/Game6/work/verilog/counter_20.v" "C:/Users/cassi/Workspace/repostorage/toying_with_fpga/Game6/work/verilog/seven_seg_21.v" "C:/Users/cassi/Workspace/repostorage/toying_with_fpga/Game6/work/verilog/decoder_22.v" ]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set xdcSources [list "C:/Users/cassi/Workspace/repostorage/toying_with_fpga/Game6/work/constraint/custom.xdc" "C:/Users/cassi/Downloads/Apps/library/components/au.xdc" ]
read_xdc $xdcSources
set_property STEPS.WRITE_BITSTREAM.ARGS.BIN_FILE true [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1 -jobs 8
wait_on_run synth_1
launch_runs impl_1 -to_step write_bitstream -jobs 8
wait_on_run impl_1
