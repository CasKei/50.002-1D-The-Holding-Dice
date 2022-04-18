set projDir "C:/Users/cassi/Workspace/repostorage/toying_with_fpga/ALU_16/work/vivado"
set projName "ALU_16"
set topName top
set device xc7a35tftg256-1
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "C:/Users/cassi/Workspace/repostorage/toying_with_fpga/ALU_16/work/verilog/au_top_0.v" "C:/Users/cassi/Workspace/repostorage/toying_with_fpga/ALU_16/work/verilog/input_storer_1.v" "C:/Users/cassi/Workspace/repostorage/toying_with_fpga/ALU_16/work/verilog/alu_2.v" "C:/Users/cassi/Workspace/repostorage/toying_with_fpga/ALU_16/work/verilog/counter_3.v" "C:/Users/cassi/Workspace/repostorage/toying_with_fpga/ALU_16/work/verilog/auto_tester_4.v" "C:/Users/cassi/Workspace/repostorage/toying_with_fpga/ALU_16/work/verilog/reset_conditioner_5.v" "C:/Users/cassi/Workspace/repostorage/toying_with_fpga/ALU_16/work/verilog/edge_detector_6.v" "C:/Users/cassi/Workspace/repostorage/toying_with_fpga/ALU_16/work/verilog/button_conditioner_7.v" "C:/Users/cassi/Workspace/repostorage/toying_with_fpga/ALU_16/work/verilog/adder_16_8.v" "C:/Users/cassi/Workspace/repostorage/toying_with_fpga/ALU_16/work/verilog/boolean_16_9.v" "C:/Users/cassi/Workspace/repostorage/toying_with_fpga/ALU_16/work/verilog/shifter_16_10.v" "C:/Users/cassi/Workspace/repostorage/toying_with_fpga/ALU_16/work/verilog/compare_16_11.v" "C:/Users/cassi/Workspace/repostorage/toying_with_fpga/ALU_16/work/verilog/rom1_12.v" "C:/Users/cassi/Workspace/repostorage/toying_with_fpga/ALU_16/work/verilog/rom2_13.v" "C:/Users/cassi/Workspace/repostorage/toying_with_fpga/ALU_16/work/verilog/pipeline_14.v" ]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set xdcSources [list "C:/Users/cassi/Downloads/Apps/library/components/au.xdc" "C:/Users/cassi/Workspace/repostorage/toying_with_fpga/ALU_16/work/constraint/io.xdc" "C:/Users/cassi/Workspace/repostorage/toying_with_fpga/ALU_16/work/constraint/alchitry.xdc" ]
read_xdc $xdcSources
set_property STEPS.WRITE_BITSTREAM.ARGS.BIN_FILE true [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1 -jobs 8
wait_on_run synth_1
launch_runs impl_1 -to_step write_bitstream -jobs 8
wait_on_run impl_1
