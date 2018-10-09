
source omc.tcl
if {![file exists case14_7.fmu]} {
puts "(1) Processing FMI: Compiling FMU"
compileFMU case14_7.mo
} else { puts "(1) Processing FMI: Model already compiled" }
load ../lib/libomu.so
prg_name DTOpt
mdl_path case14_7.fmu
prg_K $::env(HORIZONT)
prg_t0 {0}
prg_setup_stages
set dt {}
set us {}
set ts {}

sqp_eps 1e-2
sqp_qp_solver Mehrotra
qp_mat_solver $::env(QP_MAT_SOLVER)

mdl_u_active {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1}

mdl_y_min {-Inf -Inf -Inf -Inf -Inf -Inf -Inf -Inf -Inf -Inf -Inf -Inf -Inf -Inf -Inf -Inf -Inf -Inf -Inf -Inf 0.8835999999999999 0.8835999999999999 0.8835999999999999 0.8835999999999999 0.8835999999999999 0.8835999999999999 0.8835999999999999 0.8835999999999999 0.8835999999999999 0.8835999999999999 0.8835999999999999 0.8835999999999999 0.8835999999999999 0.0 0.0 0.0 -0.4 0.0 0.0 0.0 -0.06 0.0 -0.06 -Inf -Inf -Inf -Inf -Inf -Inf -Inf -Inf -Inf -Inf -Inf -Inf -Inf -Inf -Inf -Inf -Inf -Inf}
mdl_y_max {9801.0 9801.0 9801.0 9801.0 9801.0 9801.0 9801.0 9801.0 9801.0 9801.0 9801.0 9801.0 9801.0 9801.0 9801.0 9801.0 9801.0 9801.0 9801.0 9801.0 1.1236000000000002 1.1236000000000002 1.1236000000000002 1.1236000000000002 1.1236000000000002 1.1236000000000002 1.1236000000000002 1.1236000000000002 1.1236000000000002 1.1236000000000002 1.1236000000000002 1.1236000000000002 1.1236000000000002 3.324 0.1 1.4 0.5 1.0 0.4 1.0 0.24 1.0 0.24 Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf}
mdl_y_weight1 {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 20.0 0 20.0 0 40.0 0 40.0 0 40.0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
mdl_y_weight2 {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.0430293 0 0.25 0 0.01 0 0.01 0 0.01 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
mdl_y_nominal {1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 0.01 0.01 0.01 0.01 0.01 0.01 0.01 0.01 0.01 0.01 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1}

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


