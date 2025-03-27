transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

vlib work
vmap -link {E:/Projects/FPGA/Sparring_Wario/Sparring_Wario.cache/compile_simlib/riviera}
vlib riviera/xil_defaultlib

vcom -work xil_defaultlib -93  -incr \
"../../../../Sparring_Wario.gen/sources_1/ip/hdmi_tx_0/hdmi_tx_0_sim_netlist.vhdl" \


