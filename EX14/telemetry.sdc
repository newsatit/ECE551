 
****************************************
Report : constraint
Design : telemetry
Version: P-2019.03
Date   : Wed Oct 30 10:52:55 2019
****************************************


                                                   Weighted
    Group (max_delay/setup)      Cost     Weight     Cost
    -----------------------------------------------------
    clk                          0.00      1.00      0.00
    default                      0.00      1.00      0.00
    -----------------------------------------------------
    max_delay/setup                                  0.00

                              Total Neg  Critical
    Group (critical_range)      Slack    Endpoints   Cost
    -----------------------------------------------------
    clk                          0.00         0      0.00
    default                      0.00         0      0.00
    -----------------------------------------------------
    critical_range                                   0.00

                                                   Weighted
    Group (min_delay/hold)       Cost     Weight     Cost
    -----------------------------------------------------
    clk (no fix_hold)            0.00      1.00      0.00
    default                      0.00      1.00      0.00
    -----------------------------------------------------
    min_delay/hold                                   0.00


    Constraint                                       Cost
    -----------------------------------------------------
    multiport_net                                    0.00 (MET)
    min_capacitance                                  0.00 (MET)
    max_transition                                   0.00 (MET)
    max_capacitance                                  0.00 (MET)
    max_delay/setup                                  0.00 (MET)
    sequential_clock_pulse_width                     0.00 (MET)
    critical_range                                   0.00 (MET)


1
