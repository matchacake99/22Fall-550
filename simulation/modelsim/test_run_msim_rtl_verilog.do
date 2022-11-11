transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/vcm/Desktop/22Fall-550 {C:/Users/vcm/Desktop/22Fall-550/skeleton_test.v}
vlog -vlog01compat -work work +incdir+C:/Users/vcm/Desktop/22Fall-550 {C:/Users/vcm/Desktop/22Fall-550/regfile.v}
vlog -vlog01compat -work work +incdir+C:/Users/vcm/Desktop/22Fall-550 {C:/Users/vcm/Desktop/22Fall-550/RCA_16.v}
vlog -vlog01compat -work work +incdir+C:/Users/vcm/Desktop/22Fall-550 {C:/Users/vcm/Desktop/22Fall-550/processor.v}
vlog -vlog01compat -work work +incdir+C:/Users/vcm/Desktop/22Fall-550 {C:/Users/vcm/Desktop/22Fall-550/pc.v}
vlog -vlog01compat -work work +incdir+C:/Users/vcm/Desktop/22Fall-550 {C:/Users/vcm/Desktop/22Fall-550/not_32_bit.v}
vlog -vlog01compat -work work +incdir+C:/Users/vcm/Desktop/22Fall-550 {C:/Users/vcm/Desktop/22Fall-550/m81.v}
vlog -vlog01compat -work work +incdir+C:/Users/vcm/Desktop/22Fall-550 {C:/Users/vcm/Desktop/22Fall-550/m21_32_bit.v}
vlog -vlog01compat -work work +incdir+C:/Users/vcm/Desktop/22Fall-550 {C:/Users/vcm/Desktop/22Fall-550/m21.v}
vlog -vlog01compat -work work +incdir+C:/Users/vcm/Desktop/22Fall-550 {C:/Users/vcm/Desktop/22Fall-550/left_shift_32_bit.v}
vlog -vlog01compat -work work +incdir+C:/Users/vcm/Desktop/22Fall-550 {C:/Users/vcm/Desktop/22Fall-550/judgeLess.v}
vlog -vlog01compat -work work +incdir+C:/Users/vcm/Desktop/22Fall-550 {C:/Users/vcm/Desktop/22Fall-550/judgeEqual.v}
vlog -vlog01compat -work work +incdir+C:/Users/vcm/Desktop/22Fall-550 {C:/Users/vcm/Desktop/22Fall-550/getSig.v}
vlog -vlog01compat -work work +incdir+C:/Users/vcm/Desktop/22Fall-550 {C:/Users/vcm/Desktop/22Fall-550/dffe.v}
vlog -vlog01compat -work work +incdir+C:/Users/vcm/Desktop/22Fall-550 {C:/Users/vcm/Desktop/22Fall-550/ctrl_sig.v}
vlog -vlog01compat -work work +incdir+C:/Users/vcm/Desktop/22Fall-550 {C:/Users/vcm/Desktop/22Fall-550/CSA_32_bit.v}
vlog -vlog01compat -work work +incdir+C:/Users/vcm/Desktop/22Fall-550 {C:/Users/vcm/Desktop/22Fall-550/clock_div4.v}
vlog -vlog01compat -work work +incdir+C:/Users/vcm/Desktop/22Fall-550 {C:/Users/vcm/Desktop/22Fall-550/arithmetic_right_shift_32_bit.v}
vlog -vlog01compat -work work +incdir+C:/Users/vcm/Desktop/22Fall-550 {C:/Users/vcm/Desktop/22Fall-550/alu.v}
vlog -vlog01compat -work work +incdir+C:/Users/vcm/Desktop/22Fall-550 {C:/Users/vcm/Desktop/22Fall-550/adder_1.v}
vlog -vlog01compat -work work +incdir+C:/Users/vcm/Desktop/22Fall-550 {C:/Users/vcm/Desktop/22Fall-550/imem.v}
vlog -vlog01compat -work work +incdir+C:/Users/vcm/Desktop/22Fall-550 {C:/Users/vcm/Desktop/22Fall-550/dmem.v}

vlog -vlog01compat -work work +incdir+C:/Users/vcm/Desktop/22Fall-550 {C:/Users/vcm/Desktop/22Fall-550/skeleton_test_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  skeleton_test_tb

add wave *
view structure
view signals
run -all
