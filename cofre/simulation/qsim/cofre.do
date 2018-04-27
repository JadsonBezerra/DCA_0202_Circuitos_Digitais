onerror {quit -f}
vlib work
vlog -work work cofre.vo
vlog -work work cofre.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.cofre_vlg_vec_tst
vcd file -direction cofre.msim.vcd
vcd add -internal cofre_vlg_vec_tst/*
vcd add -internal cofre_vlg_vec_tst/i1/*
add wave /*
run -all
