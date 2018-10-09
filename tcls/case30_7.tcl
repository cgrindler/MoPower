
source omc.tcl
if {![file exists case30_7.fmu]} {
puts "(1) Processing FMI: Compiling FMU"
compileFMU case30_7.mo
} else { puts "(1) Processing FMI: Model already compiled" }
load ../lib/libomu.so
prg_name DTOpt
mdl_path case30_7.fmu
prg_K $::env(HORIZONT)
prg_t0 {0}
prg_setup_stages
set dt {}
set us {}
set ts {}

sqp_eps 1e-2
sqp_qp_solver Mehrotra
qp_mat_solver $::env(QP_MAT_SOLVER)

mdl_u_active {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1 1 1}

mdl_y_min {-Inf -Inf -Inf -Inf -Inf -Inf -Inf -Inf -Inf -Inf -Inf -Inf -Inf -Inf -Inf -Inf -Inf -Inf -Inf -Inf -Inf -Inf -Inf -Inf -Inf -Inf -Inf -Inf -Inf -Inf -Inf -Inf -Inf -Inf -Inf -Inf -Inf -Inf -Inf -Inf -Inf 0.9025 0.9025 0.9025 0.9025 0.9025 0.9025 0.9025 0.9025 0.9025 0.9025 0.9025 0.9025 0.9025 0.9025 0.9025 0.9025 0.9025 0.9025 0.9025 0.9025 0.9025 0.9025 0.9025 0.9025 0.9025 0.9025 0.9025 0.9025 0.9025 0.0 -0.2 0.0 -0.2 0.0 -0.15 0.0 -0.15 0.0 -0.1 0.0 -0.15 -Inf -Inf -Inf -Inf -Inf -Inf -Inf -Inf -Inf -Inf -Inf -Inf -Inf -Inf -Inf -Inf -Inf -Inf -Inf -Inf -Inf -Inf -Inf -Inf -Inf -Inf -Inf -Inf -Inf -Inf -Inf -Inf -Inf -Inf -Inf -Inf -Inf -Inf -Inf -Inf -Inf -Inf -Inf -Inf -Inf -Inf -Inf -Inf}
mdl_y_max {1.6900000000000002 1.6900000000000002 0.42250000000000004 1.6900000000000002 0.42250000000000004 1.6900000000000002 0.81 0.42250000000000004 0.48999999999999994 1.6900000000000002 0.1024 0.42250000000000004 0.1024 0.1024 0.1024 0.42250000000000004 0.42250000000000004 0.1024 0.1024 0.1024 0.1024 0.42250000000000004 0.1024 0.1024 0.1024 0.0256 0.0256 0.0256 0.0256 0.0256 0.1024 0.1024 0.0256 0.0256 0.0256 0.0256 0.0256 0.0256 0.0256 0.42250000000000004 0.0256 1.2100000000000002 1.1025 1.1025 1.1025 1.1025 1.1025 1.1025 1.1025 1.1025 1.1025 1.1025 1.2100000000000002 1.1025 1.1025 1.1025 1.1025 1.1025 1.1025 1.1025 1.1025 1.2100000000000002 1.2100000000000002 1.1025 1.1025 1.1025 1.2100000000000002 1.1025 1.1025 1.1025 0.8 1.5 0.8 0.6 0.4 0.447 0.5 0.625 0.3 0.4 0.55 0.48700000000000004 Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf}
mdl_y_weight1 {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 2.0 0 1.75 0 3.0 0 1.0 0 3.0 0 3.25 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
mdl_y_weight2 {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.02 0 0.0175 0 0.025 0 0.0625 0 0.025 0 0.00834 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
mdl_y_nominal {1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 0.01 0.01 0.01 0.01 0.01 0.01 0.01 0.01 0.01 0.01 0.01 0.01 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1}

puts "(2) Solving Problem:"
puts "\n********************************************************************************\n"
prg_setup

proc iterateOpt {} {
prg_simulate
sqp_init
for {set iter 1} {$iter <= 200} {incr iter} {
sqp_max_iters $iter
catch hqp_solve result
if {$result != "iters"} break
}
return $result
}

set timespec [time {set result [iterateOpt]}]
puts "
(3) Solution:"
puts "\n********************************************************************************\n"
puts "			        Run Time: [expr [lindex $timespec 0]/1000] ms"
puts "\n********************************************************************************\n"
puts "Result   : $result" 
puts "Objective: [prg_f]"


