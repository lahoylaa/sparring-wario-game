vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xil_defaultlib

vmap xil_defaultlib questa_lib/msim/xil_defaultlib

vcom -work xil_defaultlib  -93  \
"../../../../Sparring_Wario.gen/sources_1/ip/hdmi_tx_0/hdmi_tx_0_sim_netlist.vhdl" \


