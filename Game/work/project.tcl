set projDir "C:/Users/cassi/Workspace/repostorage/toying_with_fpga/Game/work/vivado"
set projName "Game"
set topName top
set device xc7a35tftg256-1
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "C:/Users/cassi/Workspace/repostorage/toying_with_fpga/Game/work/verilog/au_top_0.v" "C:/Users/cassi/Workspace/repostorage/toying_with_fpga/Game/work/verilog/game_CU_1.v" "C:/Users/cassi/Workspace/repostorage/toying_with_fpga/Game/work/verilog/reset_conditioner_2.v" "C:/Users/cassi/Workspace/repostorage/toying_with_fpga/Game/work/verilog/dice_seg_3.v" "C:/Users/cassi/Workspace/repostorage/toying_with_fpga/Game/work/verilog/dice_4.v" "C:/Users/cassi/Workspace/repostorage/toying_with_fpga/Game/work/verilog/edge_detector_5.v" "C:/Users/cassi/Workspace/repostorage/toying_with_fpga/Game/work/verilog/button_conditioner_6.v" "C:/Users/cassi/Workspace/repostorage/toying_with_fpga/Game/work/verilog/edge_detector_7.v" "C:/Users/cassi/Workspace/repostorage/toying_with_fpga/Game/work/verilog/counter_8.v" "C:/Users/cassi/Workspace/repostorage/toying_with_fpga/Game/work/verilog/pn_gen_9.v" "C:/Users/cassi/Workspace/repostorage/toying_with_fpga/Game/work/verilog/pipeline_10.v" ]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set xdcSources [list "C:/Users/cassi/Downloads/Apps/library/components/au.xdc" "C:/Users/cassi/Workspace/repostorage/toying_with_fpga/Game/work/constraint/custom.xdc" ]
read_xdc $xdcSources
set_property STEPS.WRITE_BITSTREAM.ARGS.BIN_FILE true [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1 -jobs 8
wait_on_run synth_1
launch_runs impl_1 -to_step write_bitstream -jobs 8
wait_on_run impl_1
