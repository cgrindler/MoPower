from numpy import array

def caseTesting():

    
    ppc = {"version": '2'}

    ##-----  Power Flow Data  -----##
    ## system MVA base
    ppc["baseMVA"] = 100.0

    ## bus data
    # bus_i type Pd Qd Gs Bs area Vm Va baseKV zone Vmax Vmin
    
    ppc["bus"] = array([
        [1, 3, 0.00,  0.00,  0, 0, 1, 1, 0, 100, 1, 1.00, 1.00], #Ref.
        [2, 1, 0, 0, 0, 30, 1, 1, 0, 100, 1, 1.05, 0.95], #PQ
        [3, 2, 0, 0, 5, 0, 1, 1, 0, 100, 1, 1.05, 0.95], #PV
        [4, 2, 90,  40,  0, 0, 1, 1, 0, 100, 1, 1.05, 0.95], #PV
        [5, 1, 23.9,  12.9,  0, 0, 1, 1,0, 100, 1, 1.05, 0.95]  #PQ
    ])

    # (3) Slack/Reference Bus (generator)
    # Known: V, phi_i | Unknown: P,Q
    #
    # (2) PV/Generator/Voltage Controlled Bus:
    # Known: P,V | Unknown: Q, phi_i
    #
    # (1) PQ/Load Bus:
    #
    # Known: P,Q | Unknown: V, phi_i

    ## generator data
    # bus, Pg, Qg, Qmax, Qmin, Vg, mBase, status, Pmax, Pmin, Pc1, Pc2,
    # Qc1min, Qc1max, Qc2min, Qc2max, ramp_agc, ramp_10, ramp_30, ramp_q, apf
    ppc["gen"] = array([
        [1, 0, 0, 0, 0, 1, 100, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
        [3, 0, 0, 30, -20, 1, 100, 1, 40,  10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
        [4, 0, 0, 20, -20, 1, 100, 1, 40,   5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    ])

    ## branch data
    #fbus, tbus, r, x, b, rateA, rateB, rateC, ratio, angle, status, angmin, angmax
    ppc["branch"] = array([
        [1, 2, 0.000, 0.300, 0.000, 333, 0, 0, 0, 0, 1, -180, 180],
        [1, 3, 0.023, 0.145, 0.040, 333, 0, 0, 0, 0, 1, -180, 180],
        [2, 4, 0.006, 0.032, 0.010, 333, 0, 0, 0, 0, 1, -180, 180],
        [2, 4, 0.006, 0.032, 0.010, 333, 0, 0, 0, 0, 1, -180, 180],
        [3, 4, 0.020, 0.260, 0.000, 333, 0, 0, 0, -3, 1, -180, 180],
        [3, 5, 0.000, 0.320, 0.000, 333, 0, 0, 0.98, 0, 1, -180, 180],
        [4, 5, 0.000, 0.500, 0.000, 333, 0, 0, 0, 0, 1, -180, 180]
    ])
     ## generator cost data
     # 1 startup shutdown n x1 y1 ... xn yn  # 2 startup shutdown n c(n-1) ... c0

    ppc["gencost"] = array([
        [2, 0, 0, 3, 0, 0.35, 0],
        [2, 0, 0, 3, 0.4, 0.2, 0],
        [2, 0, 0, 3, 0.5, 0.3, 0]
    ])
    return ppc