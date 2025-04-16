transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

asim +access +r +m+audio_rom  -L xpm -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.audio_rom xil_defaultlib.glbl

do {audio_rom.udo}

run 1000ns

endsim

quit -force
