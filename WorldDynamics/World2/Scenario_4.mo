      model Scenario_4 "4th Scenario"
        parameter Real Population_0 = 1650000000.0 "World population in 1900";
        parameter Real Pollution_0 = 200000000.0 "Pollution in 1900";
        parameter Real Nat_Resources_0(unit = "ton") = 900000000000.0 "Unrecoverable natural resources in 1900";
        parameter Real Cap_Invest_0(unit = "dollar") = 400000000.0 "Capital investment in 1900";
        parameter Real CIAF_0 = 0.2 "Proportion of capital investment in agriculture in 1900";
        parameter Real BRN(unit = "1/yr") = 0.04 "Normal birth rate";
        parameter Real CIAFN(unit = "dollar") = 0.3 "CIAF normalization";
        parameter Real CIAFT(unit = "yr") = 15.0 "CIAF time constant";
        parameter Real CIDN(unit = "dollar/yr") = 0.025 "Normal capital discard";
        parameter Real CIGN(unit = "dollar/yr") = 0.05 "Normal capital generation";
        parameter Real ECIRN(unit = "dollar") = 1.0 "Capital normalization";
        parameter Real FC(unit = "kg/yr") = 1.0 "Food coefficient";
        parameter Real FN(unit = "kg/yr") = 1.0 "Food normalization";
        parameter Real Land_Area(unit = "hectare") = 135000000.0 "Area of arable land";
        parameter Real NRI(unit = "ton") = 900000000000.0 "Initial natural resources";
        parameter Real POLS = 3599900000.0 "Standard pollution";
        parameter Real Pop_dens_norm(unit = "1/hectare") = 26.5 "Normal population density";
        parameter Real QLS = 1.0 "Standard quality of life";
        output Real Pop "World population";
        output Real Pol "Pollution";
        output Real Pol_rat "Pollution ratio";
        output Real Cap_inv(unit = "dollar") "Capital investment";
        output Real Qual_life "Quality of life";
        output Real Nat_res(unit = "ton") "Natural unrecoverable resources";
        Real NRUN(unit = "1/yr") "Normal resource utilization";
        Real POLN(unit = "1/yr") "Normal pollution";
        Real DRN(unit = "1/yr") "Normal death rate";
        Real Pop_meas;
      protected
        Real time_vals[12](each unit = "yr") = {1900, 1910, 1920, 1930, 1940, 1950, 1960, 1970, 1980, 1990, 2000, 2500};
        Real pop_vals[12] = {1600000000.0, 1750000000.0, 1860000000.0, 2070000000.0, 2300000000.0, 2556000000.0, 3039500000.0, 3706560000.0, 4378100000.0, 5190300000.0, 5996200000.0, 6000000000.0};
      public
        SystemDynamics.Sources.Source Source1 annotation(
          Placement(visible = true, transformation(origin = {-150.0, 140.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Rates.Rate_1 Birth_Rate annotation(
          Placement(visible = true, transformation(origin = {-120.0, 140.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.Levels.Level Population(x0 = Population_0) annotation(
          Placement(visible = true, transformation(origin = {-70.0, 140.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.Rates.Rate_1 Death_Rate annotation(
          Placement(visible = true, transformation(origin = {-20.0, 140.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.Sources.Sink Sink1 annotation(
          Placement(visible = true, transformation(origin = {10.0, 140.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Sources.Source Source2 annotation(
          Placement(visible = true, transformation(origin = {50.0, 140.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Rates.Rate_1 Generation annotation(
          Placement(visible = true, transformation(origin = {80.0, 140.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.Levels.Level Natural_Resources(x0 = Nat_Resources_0) annotation(
          Placement(visible = true, transformation(origin = {130.0, 140.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.Rates.Rate_1 Depletion annotation(
          Placement(visible = true, transformation(origin = {180.0, 140.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.Sources.Sink Sink2 annotation(
          Placement(visible = true, transformation(origin = {210.0, 140.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Const Gen_Const(k = 0) annotation(
          Placement(visible = true, transformation(origin = {80.0, 101.0}, extent = {{-16.0, -15.0}, {16.0, 15.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular BRMM(x_vals = {0, 1, 2, 3, 4, 5, 20}, y_vals = {1.2, 1.0, 0.85, 0.75, 0.7, 0.7, 0.7}) annotation(
          Placement(visible = true, transformation(origin = {-105.0, 185.0}, extent = {{15.0, -15.0}, {-15.0, 15.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular DRMM(x_vals = {0, 0.5, 1, 1.5, 2, 2.5, 3, 3.5, 4, 4.5, 5, 20}, y_vals = {3.0, 1.8, 1.0, 0.8, 0.7, 0.6, 0.53, 0.5, 0.5, 0.5, 0.5, 0.5}) annotation(
          Placement(visible = true, transformation(origin = {51.0, 171.0}, extent = {{15.0, -15.0}, {-15.0, 15.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Gain BR_norm(k = BRN) annotation(
          Placement(visible = true, transformation(origin = {-135.0, 103.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Prod_5 Prod_5_1 annotation(
          Placement(visible = true, transformation(origin = {-160.0, 80.0}, extent = {{-16.0, -16.0}, {16.0, 16.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Prod_5 Prod_5_2 annotation(
          Placement(visible = true, transformation(origin = {20.0, 79.0}, extent = {{-16.0, -15.0}, {16.0, 15.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular BRFM(x_vals = {0, 1, 2, 3, 4, 20}, y_vals = {0.0, 1.0, 1.6, 1.9, 2.0, 2.0}) annotation(
          Placement(visible = true, transformation(origin = {-176.0, 35.0}, extent = {{-16.0, -15.0}, {16.0, 15.0}}, rotation = -270)));
        SystemDynamics.Functions.Tabular BRPM(x_vals = 0:10:60, y_vals = {1.02, 0.9, 0.7, 0.4, 0.25, 0.15, 0.1}) annotation(
          Placement(visible = true, transformation(origin = {-135.0, 35.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = -270)));
        SystemDynamics.Functions.Tabular BRCM(x_vals = 0:5, y_vals = {1.05, 1.0, 0.9, 0.7, 0.6, 0.55}) annotation(
          Placement(visible = true, transformation(origin = {-95.0, 35.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = -270)));
        SystemDynamics.Functions.Tabular DRCM(x_vals = 0:5, y_vals = {0.9, 1.0, 1.2, 1.5, 1.9, 3.0}) annotation(
          Placement(visible = true, transformation(origin = {-25.0, 35.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = -270)));
        SystemDynamics.Functions.Tabular DRPM(x_vals = 0:10:60, y_vals = {0.92, 1.3, 2.0, 3.2, 4.8, 6.8, 9.2}) annotation(
          Placement(visible = true, transformation(origin = {15.0, 35.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = -270)));
        SystemDynamics.Functions.Tabular DRFM(x_vals = {0, 0.25, 0.5, 0.75, 1, 1.25, 1.5, 1.75, 2, 20}, y_vals = {30.0, 3.0, 2.0, 1.4, 1.0, 0.7, 0.6, 0.5, 0.5, 0.5}) annotation(
          Placement(visible = true, transformation(origin = {55.0, 35.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = -270)));
        SystemDynamics.Auxiliary.Gain Crowd_Rat(k = 1.0 / (Land_Area * Pop_dens_norm)) annotation(
          Placement(visible = true, transformation(origin = {-60.0, 35.0}, extent = {{-16.0, -15.0}, {16.0, 15.0}}, rotation = -90)));
        SystemDynamics.Auxiliary.Prod_2 Prod_2_1 annotation(
          Placement(visible = true, transformation(origin = {140.0, 80.0}, extent = {{-16.0, -16.0}, {16.0, 16.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular NRMM(x_vals = 0:10, y_vals = {0.0, 1.0, 1.8, 2.4, 2.9, 3.3, 3.6, 3.8, 3.9, 3.95, 4.0}) annotation(
          Placement(visible = true, transformation(origin = {201.0, 80.0}, extent = {{-15.0, 16.0}, {15.0, -16.0}}, rotation = -180)));
        SystemDynamics.Sources.Source Source3 annotation(
          Placement(visible = true, transformation(origin = {50.0, -40.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Rates.Rate_1 CI_Generation annotation(
          Placement(visible = true, transformation(origin = {80.0, -40.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.Levels.Level Capital_Investment(x0 = Cap_Invest_0) annotation(
          Placement(visible = true, transformation(origin = {130.0, -40.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.Rates.Rate_1 CI_Discard annotation(
          Placement(visible = true, transformation(origin = {180.0, -40.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.Sources.Sink Sink3 annotation(
          Placement(visible = true, transformation(origin = {210.0, -40.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Gain CIG_norm(k = CIGN) annotation(
          Placement(visible = true, transformation(origin = {65.0, -77.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Prod_2 Prod_2_2 annotation(
          Placement(visible = true, transformation(origin = {40.0, -100.0}, extent = {{-14.0, -16.0}, {14.0, 16.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Gain CID_norm(k = CIDN) annotation(
          Placement(visible = true, transformation(origin = {165.0, -77.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular CIM(x_vals = {0, 1, 2, 3, 4, 5, 20}, y_vals = {0.1, 1.0, 1.8, 2.4, 2.8, 3.0, 3.0}) annotation(
          Placement(visible = true, transformation(origin = {113.0, -100.0}, extent = {{15.0, -16.0}, {-15.0, 16.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Gain MSL(k = 1.0 / ECIRN) annotation(
          Placement(visible = true, transformation(origin = {277.0, 30.0}, extent = {{-15.0, -16.0}, {15.0, 16.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Gain NRFR(k = 1.0 / NRI) annotation(
          Placement(visible = true, transformation(origin = {137.0, 51.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Gain ECIR(k = 1.0 / (1.0 - CIAFN)) annotation(
          Placement(visible = true, transformation(origin = {243.0, 30.0}, extent = {{-15.0, -16.0}, {15.0, 16.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Prod_3 Prod_3_1 annotation(
          Placement(visible = true, transformation(origin = {215.0, 30.0}, extent = {{-15.0, -16.0}, {15.0, 16.0}}, rotation = -90)));
        SystemDynamics.Functions.Tabular NREM(x_vals = 0:0.25:1, y_vals = {0.0, 0.15, 0.5, 0.85, 1.0}) annotation(
          Placement(visible = true, transformation(origin = {175.0, 51.0}, extent = {{15.0, 15.0}, {-15.0, -15.0}}, rotation = -180)));
        Modelica.Blocks.Math.Division CIR annotation(
          Placement(visible = true, transformation(origin = {107.0, 6.0}, extent = {{15.0, -16.0}, {-15.0, 16.0}}, rotation = 0)));
        SystemDynamics.Sources.Source Source4 annotation(
          Placement(visible = true, transformation(origin = {-150.0, -140.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Rates.Rate_1 P_Generation annotation(
          Placement(visible = true, transformation(origin = {-120.0, -140.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.Levels.Level Pollution(x0 = Pollution_0) annotation(
          Placement(visible = true, transformation(origin = {-70.0, -140.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.Rates.Rate_1 P_Absorption annotation(
          Placement(visible = true, transformation(origin = {-20.0, -140.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.Sources.Sink Sink4 annotation(
          Placement(visible = true, transformation(origin = {10.0, -140.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Functions.Linear NotCIAF(m = -1.0, b = 1.0) annotation(
          Placement(visible = true, transformation(origin = {189.0, 10.0}, extent = {{-15.0, -16.0}, {15.0, 16.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Gain Pol_Ratio(k = 1.0 / POLS) annotation(
          Placement(visible = true, transformation(origin = {-29.0, -95.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular FCM(x_vals = 0:5, y_vals = {2.4, 1.0, 0.6, 0.4, 0.3, 0.2}) annotation(
          Placement(visible = true, transformation(origin = {-85.0, -47.0}, extent = {{-15.0, 15.0}, {15.0, -15.0}}, rotation = -180)));
        SystemDynamics.Auxiliary.Prod_3 Prod_3_2 annotation(
          Placement(visible = true, transformation(origin = {-117.0, -66.0}, extent = {{15.0, -14.0}, {-15.0, 14.0}}, rotation = 90)));
        SystemDynamics.Auxiliary.Gain Food_Ratio(k = FC / FN) annotation(
          Placement(visible = true, transformation(origin = {-149.0, -66.0}, extent = {{15.0, -16.0}, {-15.0, 16.0}}, rotation = 0)));
        SystemDynamics.Sources.Source Source5 annotation(
          Placement(visible = true, transformation(origin = {50.0, -140.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Rates.Rate_1 CIAFG annotation(
          Placement(visible = true, transformation(origin = {80.0, -140.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.Levels.Level CIAF(x0 = CIAF_0) annotation(
          Placement(visible = true, transformation(origin = {130.0, -140.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.Rates.Rate_1 CIAFD annotation(
          Placement(visible = true, transformation(origin = {180.0, -140.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.Sources.Sink Sink5 annotation(
          Placement(visible = true, transformation(origin = {210.0, -140.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Gain CIAF_D(k = 1.0 / CIAFT) annotation(
          Placement(visible = true, transformation(origin = {163.0, -180.0}, extent = {{-15.0, -16.0}, {15.0, 16.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Gain CIAF_G(k = 1.0 / CIAFT) annotation(
          Placement(visible = true, transformation(origin = {95.0, -180.0}, extent = {{15.0, -16.0}, {-15.0, 16.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Prod_2 Prod_2_3 annotation(
          Placement(visible = true, transformation(origin = {120.0, -230.0}, extent = {{-16.0, -16.0}, {16.0, 16.0}}, rotation = 0)));
        Modelica.Blocks.Math.Division P_Abs annotation(
          Placement(visible = true, transformation(origin = {-43.0, -180.0}, extent = {{-15.0, -16.0}, {15.0, 16.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Prod_2 Prod_2_4 annotation(
          Placement(visible = true, transformation(origin = {-160.0, -220.0}, extent = {{-16.0, -16.0}, {16.0, 16.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular POLCM(x_vals = {0, 1, 2, 3, 4, 5, 100}, y_vals = {0.05, 1.0, 3.0, 5.4, 7.4, 8.0, 8.0}) annotation(
          Placement(visible = true, transformation(origin = {-117.0, -220.0}, extent = {{-15.0, 16.0}, {15.0, -16.0}}, rotation = -180)));
        SystemDynamics.Functions.Tabular POLAT(x_vals = 0:10:60, y_vals = {0.6, 2.5, 5.0, 8.0, 11.5, 15.5, 20.0}) annotation(
          Placement(visible = true, transformation(origin = {-39.0, -220.0}, extent = {{-15.0, 16.0}, {15.0, -16.0}}, rotation = -180)));
        SystemDynamics.Functions.Tabular CFIFR(x_vals = {0, 0.5, 1, 1.5, 2, 20}, y_vals = {1.0, 0.6, 0.3, 0.15, 0.1, 0.1}) annotation(
          Placement(visible = true, transformation(origin = {69.0, -230.0}, extent = {{15.0, 16.0}, {-15.0, -16.0}}, rotation = -180)));
        SystemDynamics.Functions.Tabular FPM(x_vals = 0:10:60, y_vals = {1.02, 0.9, 0.65, 0.35, 0.2, 0.1, 0.05}) annotation(
          Placement(visible = true, transformation(origin = {-33.0, -66.0}, extent = {{-15.0, 16.0}, {15.0, -16.0}}, rotation = -180)));
        SystemDynamics.Auxiliary.Prod_2 Prod_2_5 annotation(
          Placement(visible = true, transformation(origin = {229.0, -200.0}, extent = {{-15.0, 16.0}, {15.0, -16.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Gain CIRA(k = 1.0 / CIAFN) annotation(
          Placement(visible = true, transformation(origin = {255.0, -225.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular FPCI(x_vals = {0, 1, 2, 3, 4, 5, 6, 100}, y_vals = {0.5, 1.0, 1.4, 1.7, 1.9, 2.05, 2.2, 2.2}) annotation(
          Placement(visible = true, transformation(origin = {-153.0, -107.0}, extent = {{15.0, 15.0}, {-15.0, -15.0}}, rotation = -180)));
        SystemDynamics.Functions.Tabular CIQR(y_vals = {0.7, 0.8, 1.0, 1.5, 2.0, 2.0}, x_vals = {0, 0.5, 1, 1.5, 2, 10}) annotation(
          Placement(visible = true, transformation(origin = {167.0, -230.0}, extent = {{-15.0, 16.0}, {15.0, -16.0}}, rotation = -180)));
        Modelica.Blocks.Math.Division QLMF annotation(
          Placement(visible = true, transformation(origin = {315.0, -223.0}, extent = {{15.0, -15.0}, {-15.0, 15.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular QLM(x_vals = {0, 1, 2, 3, 4, 5, 20}, y_vals = {0.2, 1.0, 1.7, 2.3, 2.7, 2.9, 2.9}) annotation(
          Placement(visible = true, transformation(origin = {319.0, -169.0}, extent = {{15.0, 17.0}, {-15.0, -17.0}}, rotation = -180)));
        SystemDynamics.Functions.Tabular QLF(x_vals = {0, 1, 2, 3, 4, 20}, y_vals = {0.0, 1.0, 1.8, 2.4, 2.7, 2.7}) annotation(
          Placement(visible = true, transformation(origin = {381.0, -232.0}, extent = {{-15.0, 16.0}, {15.0, -16.0}}, rotation = -180)));
        SystemDynamics.Auxiliary.Prod_4 Prod_4_1 annotation(
          Placement(visible = true, transformation(origin = {375.0, -163.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = -90)));
        SystemDynamics.Functions.Tabular QLC(x_vals = 0:0.5:5, y_vals = {2.0, 1.3, 1.0, 0.75, 0.55, 0.45, 0.38, 0.3, 0.25, 0.22, 0.2}) annotation(
          Placement(visible = true, transformation(origin = {335.0, -113.0}, extent = {{15.0, 15.0}, {-15.0, -15.0}}, rotation = -90)));
        SystemDynamics.Functions.Tabular QLP(x_vals = 0:10:60, y_vals = {1.04, 0.85, 0.6, 0.3, 0.15, 0.05, 0.02}) annotation(
          Placement(visible = true, transformation(origin = {375.0, -113.0}, extent = {{15.0, 15.0}, {-15.0, -15.0}}, rotation = -90)));
        SystemDynamics.Auxiliary.Gain Quality_of_Life(k = QLS) annotation(
          Placement(visible = true, transformation(origin = {412.0, -163.0}, extent = {{-20.0, -21.0}, {20.0, 21.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World2.Utilities.Parameter_Change NR_norm annotation(
          Placement(visible = true, transformation(origin = {160.0, 105.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = -360)));
        SystemDynamics.WorldDynamics.World2.Utilities.Parameter_Change Pol_norm annotation(
          Placement(visible = true, transformation(origin = {-138.175, -180.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = 0)),
          extent = {{-154, -196}, {-124, -166}});
        SystemDynamics.WorldDynamics.World2.Utilities.Parameter_Change DR_norm annotation(
          Placement(visible = true, transformation(origin = {-0.0, 100.0}, extent = {{15.0, -15.0}, {-15.0, 15.0}}, rotation = 0)));
      equation
        connect(Pol_norm.u1, Prod_2_4.y) annotation(
          Line(visible = true, points = {{-151.675, -174.0}, {-160.0, -174.0}, {-160.0, -208.8}}, color = {0, 0, 191}));
        connect(P_Generation.u, Pol_norm.y) annotation(
          Line(visible = true, points = {{-120.0, -161.0}, {-120.0, -180.0}, {-124.675, -180.0}}, color = {0, 0, 191}));
        connect(Depletion.u, NR_norm.y) annotation(
          Line(visible = true, origin = {177.8333, 109.6667}, points = {{2.1667, 9.3333}, {2.1667, -4.6667}, {-4.3333, -4.6667}}, color = {0, 0, 191}));
        connect(NR_norm.u1, Prod_2_1.y) annotation(
          Line(visible = true, points = {{146.5, 111.0}, {140.0, 111.0}, {140.0, 91.2}}, color = {0, 0, 191}));
        connect(DR_norm.u1, Prod_5_2.y) annotation(
          Line(visible = true, points = {{13.5, 106.0}, {20.0, 106.0}, {20.0, 89.5}}, color = {0, 0, 191}));
        connect(DR_norm.y, Death_Rate.u) annotation(
          Line(visible = true, origin = {-17.8333, 106.3333}, points = {{4.3333, -6.3333}, {-2.1667, -6.3333}, {-2.1667, 12.6667}}, color = {0, 0, 191}));
        connect(Food_Ratio.y, BRFM.u) annotation(
          Line(visible = true, points = {{-159.5, -66.0}, {-176.0, -66.0}, {-176.0, 22.2}}, color = {0, 0, 191}));
        connect(BRFM.y, Prod_5_1.u2) annotation(
          Line(visible = true, points = {{-176.0, 52.6}, {-176.0, 60.0}, {-167.36, 60.0}, {-167.36, 72.0}}, color = {0, 0, 191}));
        connect(BRPM.u, QLP.u) annotation(
          Line(visible = true, points = {{-135.0, 23.0}, {-135.0, -20.0}, {-214.0, -20.0}, {-214.0, 214.0}, {375.0, 214.0}, {375.0, -125.0}}, color = {0, 0, 191}));
        connect(Pol_Ratio.y, BRPM.u) annotation(
          Line(visible = true, points = {{-18.5, -95.0}, {0.0, -95.0}, {0.0, -20.0}, {-135.0, -20.0}, {-135.0, 23.0}}, color = {0, 0, 191}));
        connect(BRPM.y, Prod_5_1.u3) annotation(
          Line(visible = true, points = {{-135.0, 51.5}, {-135.0, 60.0}, {-160.0, 60.0}, {-160.0, 68.8}}, color = {0, 0, 191}));
        connect(Crowd_Rat.y, BRCM.u) annotation(
          Line(visible = true, points = {{-60.0, 23.8}, {-60.0, 8.0}, {-95.0, 8.0}, {-95.0, 23.0}}, color = {0, 0, 191}));
        connect(BRCM.y, Prod_5_1.u4) annotation(
          Line(visible = true, points = {{-95.0, 51.5}, {-95.0, 66.0}, {-152.64, 66.0}, {-152.64, 72.0}}, color = {0, 0, 191}));
        connect(Crowd_Rat.y, DRCM.u) annotation(
          Line(visible = true, points = {{-60.0, 23.8}, {-60.0, 8.0}, {-25.0, 8.0}, {-25.0, 23.0}}, color = {0, 0, 191}));
        connect(DRCM.y, Prod_5_2.u2) annotation(
          Line(visible = true, points = {{-25.0, 51.5}, {-25.0, 60.0}, {12.64, 60.0}, {12.64, 71.5}}, color = {0, 0, 191}));
        connect(Pol_Ratio.y, DRPM.u) annotation(
          Line(visible = true, points = {{-18.5, -95.0}, {0.0, -95.0}, {0.0, 8.0}, {15.0, 8.0}, {15.0, 23.0}}, color = {0, 0, 191}));
        connect(DRPM.y, Prod_5_2.u3) annotation(
          Line(visible = true, points = {{15.0, 51.5}, {15.0, 60.0}, {20.0, 60.0}, {20.0, 68.5}}, color = {0, 0, 191}));
        connect(Food_Ratio.y, DRFM.u) annotation(
          Line(visible = true, points = {{-159.5, -66.0}, {-176.0, -66.0}, {-176.0, 0.0}, {55.0, 0.0}, {55.0, 23.0}}, color = {0, 0, 191}));
        connect(DRFM.y, Prod_5_2.u4) annotation(
          Line(visible = true, points = {{55.0, 51.5}, {55.0, 60.0}, {27.36, 60.0}, {27.36, 71.5}}, color = {0, 0, 191}));
        connect(Crowd_Rat.y, QLC.u) annotation(
          Line(visible = true, points = {{-60.0, 23.8}, {-60.0, 8.0}, {-206.0, 8.0}, {-206.0, 208.0}, {335.0, 208.0}, {335.0, -125.0}}, color = {0, 0, 191}));
        connect(FCM.u, Crowd_Rat.y) annotation(
          Line(visible = true, points = {{-73.0, -47.0}, {-60.0, -47.0}, {-60.0, 23.8}}, color = {0, 0, 191}));
        connect(Crowd_Rat.u, Population.y3) annotation(
          Line(visible = true, points = {{-60.0, 46.2}, {-60.0, 66.0}, {-70.0, 66.0}, {-70.0, 127.0}}, color = {0, 0, 191}));
        connect(Prod_2_5.u2, Prod_3_1.u2) annotation(
          Line(visible = true, points = {{239.5, -200.0}, {260.0, -200.0}, {260.0, -20.0}, {160.0, -20.0}, {160.0, 30.0}, {203.8, 30.0}}, color = {0, 0, 191}));
        connect(Prod_3_1.y, ECIR.u) annotation(
          Line(visible = true, points = {{226.2, 30.0}, {232.5, 30.0}}, color = {0, 0, 191}));
        connect(CIR.y, Prod_3_1.u2) annotation(
          Line(visible = true, points = {{90.5, 6.0}, {80.0, 6.0}, {80.0, 30.0}, {203.8, 30.0}}, color = {0, 0, 191}));
        connect(NotCIAF.y, Prod_3_1.u3) annotation(
          Line(visible = true, points = {{202.5, 10.0}, {215.0, 10.0}, {215.0, 19.5}}, color = {0, 0, 191}));
        connect(Prod_3_1.u1, NREM.y) annotation(
          Line(visible = true, points = {{215.0, 40.5}, {215.0, 51.0}, {191.5, 51.0}}, color = {0, 0, 191}));
        connect(QLP.y, Prod_4_1.u1) annotation(
          Line(visible = true, points = {{375.0, -96.5}, {375.0, -152.5}}, color = {0, 0, 191}));
        connect(QLC.y, Prod_4_1.u2) annotation(
          Line(visible = true, points = {{335.0, -96.5}, {335.0, -157.0}, {366.6, -157.0}}, color = {0, 0, 191}));
        connect(Prod_4_1.y, Quality_of_Life.u) annotation(
          Line(visible = true, points = {{385.5, -163.0}, {398.0, -163.0}}, color = {0, 0, 191}));
        connect(QLF.y, Prod_4_1.u4) annotation(
          Line(visible = true, points = {{364.5, -232.0}, {356.0, -232.0}, {356.0, -190.0}, {375.0, -190.0}, {375.0, -173.5}}, color = {0, 0, 191}));
        connect(QLM.y, Prod_4_1.u3) annotation(
          Line(visible = true, points = {{335.5, -169.0}, {366.6, -169.0}}, color = {0, 0, 191}));
        connect(QLF.y, QLMF.u2) annotation(
          Line(visible = true, points = {{364.5, -232.0}, {333.0, -232.0}}, color = {0, 0, 191}));
        connect(QLMF.y, CIQR.u) annotation(
          Line(visible = true, points = {{298.5, -223.0}, {290.0, -223.0}, {290.0, -256.0}, {190.0, -256.0}, {190.0, -230.0}, {179.0, -230.0}}, color = {0, 0, 191}));
        connect(P_Abs.u1, Pollution.y3) annotation(
          Line(visible = true, points = {{-61.0, -170.4}, {-70.0, -170.4}, {-70.0, -153.0}}, color = {0, 0, 191}));
        connect(CIG_norm.y, CI_Generation.u) annotation(
          Line(visible = true, points = {{75.5, -77.0}, {80.0, -77.0}, {80.0, -61.0}}, color = {0, 0, 191}));
        connect(CI_Discard.y1, Sink3.MassInPort1) annotation(
          Line(visible = true, points = {{190.0, -40.0}, {199.0, -40.0}}, color = {191, 0, 191}));
        connect(Capital_Investment.u2, CI_Discard.y) annotation(
          Line(visible = true, points = {{152.0, -40.0}, {170.0, -40.0}}, color = {191, 0, 191}));
        connect(Source3.MassInPort1, CI_Generation.y) annotation(
          Line(visible = true, points = {{61.0, -40.0}, {70.0, -40.0}}, color = {191, 0, 191}));
        connect(CI_Generation.y1, Capital_Investment.u1) annotation(
          Line(visible = true, points = {{90.0, -40.0}, {108.0, -40.0}}, color = {191, 0, 191}));
        connect(FPM.u, POLAT.u) annotation(
          Line(visible = true, points = {{-21.0, -66.0}, {0.0, -66.0}, {0.0, -220.0}, {-27.0, -220.0}}, color = {0, 0, 191}));
        connect(CIRA.y, FPCI.u) annotation(
          Line(visible = true, points = {{265.5, -225.0}, {280.0, -225.0}, {280.0, -252.0}, {-210.0, -252.0}, {-210.0, -107.0}, {-165.0, -107.0}}, color = {0, 0, 191}));
        connect(Prod_2_1.u1, Population.y1) annotation(
          Line(visible = true, points = {{128.8, 80.0}, {100.0, 80.0}, {100.0, 194.0}, {-46.0, 194.0}, {-46.0, 151.0}, {-53.0, 151.0}}, color = {0, 0, 191}));
        connect(NRMM.u, DRMM.u) annotation(
          Line(visible = true, points = {{213.0, 80.0}, {300.0, 80.0}, {300.0, 171.0}, {63.0, 171.0}}, color = {0, 0, 191}));
        connect(NRMM.u, BRMM.u) annotation(
          Line(visible = true, points = {{213.0, 80.0}, {300.0, 80.0}, {300.0, 200.0}, {-70.0, 200.0}, {-70.0, 185.0}, {-93.0, 185.0}}, color = {0, 0, 191}));
        connect(CFIFR.u, QLF.u) annotation(
          Line(visible = true, points = {{57.0, -230.0}, {40.0, -230.0}, {40.0, -260.0}, {400.0, -260.0}, {400.0, -232.0}, {393.0, -232.0}}, color = {0, 0, 191}));
        connect(Food_Ratio.y, QLF.u) annotation(
          Line(visible = true, points = {{-159.5, -66.0}, {-220.0, -66.0}, {-220.0, -260.0}, {400.0, -260.0}, {400.0, -232.0}, {393.0, -232.0}}, color = {0, 0, 191}));
        connect(Pol_Ratio.y, FPM.u) annotation(
          Line(visible = true, points = {{-18.5, -95.0}, {0.0, -95.0}, {0.0, -66.0}, {-21.0, -66.0}}, color = {0, 0, 191}));
        connect(CIR.y, POLCM.u) annotation(
          Line(visible = true, points = {{90.5, 6.0}, {80.0, 6.0}, {80.0, -6.0}, {10.0, -6.0}, {10.0, -116.0}, {-100.0, -116.0}, {-100.0, -220.0}, {-105.0, -220.0}}, color = {0, 0, 191}));
        connect(QLM.u, CIM.u) annotation(
          Line(visible = true, points = {{307.0, -169.0}, {300.0, -169.0}, {300.0, -100.0}, {125.0, -100.0}}, color = {0, 0, 191}));
        connect(QLM.y, QLMF.u1) annotation(
          Line(visible = true, points = {{335.5, -169.0}, {344.0, -169.0}, {344.0, -214.0}, {333.0, -214.0}}, color = {0, 0, 191}));
        connect(MSL.y, QLM.u) annotation(
          Line(visible = true, points = {{287.5, 30.0}, {300.0, 30.0}, {300.0, -169.0}, {307.0, -169.0}}, color = {0, 0, 191}));
        connect(NRMM.y, Prod_2_1.u2) annotation(
          Line(visible = true, points = {{184.5, 80.0}, {151.2, 80.0}}, color = {0, 0, 191}));
        connect(MSL.y, NRMM.u) annotation(
          Line(visible = true, points = {{287.5, 30.0}, {300.0, 30.0}, {300.0, 80.0}, {213.0, 80.0}}, color = {0, 0, 191}));
        connect(ECIR.y, MSL.u) annotation(
          Line(visible = true, points = {{253.5, 30.0}, {266.5, 30.0}}, color = {0, 0, 191}));
        connect(NotCIAF.u, CIAF.y1) annotation(
          Line(visible = true, points = {{175.5, 10.0}, {168.0, 10.0}, {168.0, -8.0}, {240.0, -8.0}, {240.0, -110.0}, {154.0, -110.0}, {154.0, -129.0}, {147.0, -129.0}}, color = {0, 0, 191}));
        connect(Prod_2_2.u1, CIR.u2) annotation(
          Line(visible = true, points = {{30.2, -100.0}, {20.0, -100.0}, {20.0, -14.0}, {140.0, -14.0}, {140.0, -3.6}, {125.0, -3.6}}, color = {0, 0, 191}));
        connect(Prod_2_2.u1, Population.y1) annotation(
          Line(visible = true, points = {{30.2, -100.0}, {20.0, -100.0}, {20.0, -14.0}, {320.0, -14.0}, {320.0, 194.0}, {-46.0, 194.0}, {-46.0, 151.0}, {-53.0, 151.0}}, color = {0, 0, 191}));
        connect(Prod_2_4.u1, Population.y) annotation(
          Line(visible = true, points = {{-171.2, -220.0}, {-200.0, -220.0}, {-200.0, 164.0}, {-94.0, 164.0}, {-94.0, 151.0}, {-87.0, 151.0}}, color = {0, 0, 191}));
        connect(CID_norm.u, Capital_Investment.y2) annotation(
          Line(visible = true, points = {{154.5, -77.0}, {145.0, -77.0}, {145.0, -53.0}}, color = {0, 0, 191}));
        connect(CID_norm.y, CI_Discard.u) annotation(
          Line(visible = true, points = {{175.5, -77.0}, {180.0, -77.0}, {180.0, -61.0}}, color = {0, 0, 191}));
        connect(CIM.y, Prod_2_2.u2) annotation(
          Line(visible = true, points = {{96.5, -100.0}, {49.8, -100.0}}, color = {0, 0, 191}));
        connect(Prod_2_2.y, CIG_norm.u) annotation(
          Line(visible = true, points = {{40.0, -88.8}, {40.0, -77.0}, {54.5, -77.0}}, color = {0, 0, 191}));
        connect(Pol_Ratio.u, Pollution.y1) annotation(
          Line(visible = true, points = {{-39.5, -95.0}, {-46.0, -95.0}, {-46.0, -129.0}, {-53.0, -129.0}}, color = {0, 0, 191}));
        connect(POLCM.y, Prod_2_4.u2) annotation(
          Line(visible = true, points = {{-133.5, -220.0}, {-148.8, -220.0}}, color = {0, 0, 191}));
        connect(POLAT.y, P_Abs.u2) annotation(
          Line(visible = true, points = {{-55.5, -220.0}, {-70.0, -220.0}, {-70.0, -189.6}, {-61.0, -189.6}}, color = {0, 0, 191}));
        connect(P_Abs.y, P_Absorption.u) annotation(
          Line(visible = true, points = {{-26.5, -180.0}, {-20.0, -180.0}, {-20.0, -161.0}}, color = {0, 0, 191}));
        connect(CFIFR.y, Prod_2_3.u1) annotation(
          Line(visible = true, points = {{85.5, -230.0}, {108.8, -230.0}}, color = {0, 0, 191}));
        connect(CIQR.y, Prod_2_3.u2) annotation(
          Line(visible = true, points = {{150.5, -230.0}, {131.2, -230.0}}, color = {0, 0, 191}));
        connect(CIAF_G.y, CIAFG.u) annotation(
          Line(visible = true, points = {{84.5, -180.0}, {80.0, -180.0}, {80.0, -161.0}}, color = {0, 0, 191}));
        connect(CIAF_G.u, Prod_2_3.y) annotation(
          Line(visible = true, points = {{105.5, -180.0}, {120.0, -180.0}, {120.0, -218.8}}, color = {0, 0, 191}));
        connect(CIRA.u, Prod_2_5.y) annotation(
          Line(visible = true, points = {{244.5, -225.0}, {229.0, -225.0}, {229.0, -211.2}}, color = {0, 0, 191}));
        connect(Prod_2_5.u1, CIAF.y3) annotation(
          Line(visible = true, points = {{218.5, -200.0}, {130.0, -200.0}, {130.0, -153.0}}, color = {0, 0, 191}));
        connect(CIAF_D.u, CIAF.y2) annotation(
          Line(visible = true, points = {{152.5, -180.0}, {145.0, -180.0}, {145.0, -153.0}}, color = {0, 0, 191}));
        connect(CIAF_D.y, CIAFD.u) annotation(
          Line(visible = true, points = {{173.5, -180.0}, {180.0, -180.0}, {180.0, -161.0}}, color = {0, 0, 191}));
        connect(CIAFD.y1, Sink5.MassInPort1) annotation(
          Line(visible = true, points = {{190.0, -140.0}, {199.0, -140.0}}, color = {191, 0, 191}));
        connect(CIAF.u2, CIAFD.y) annotation(
          Line(visible = true, points = {{152.0, -140.0}, {170.0, -140.0}}, color = {191, 0, 191}));
        connect(CIAFG.y1, CIAF.u1) annotation(
          Line(visible = true, points = {{90.0, -140.0}, {108.0, -140.0}}, color = {191, 0, 191}));
        connect(Source5.MassInPort1, CIAFG.y) annotation(
          Line(visible = true, points = {{61.0, -140.0}, {70.0, -140.0}}, color = {191, 0, 191}));
        connect(P_Absorption.y1, Sink4.MassInPort1) annotation(
          Line(visible = true, points = {{-10.0, -140.0}, {-1.0, -140.0}}, color = {191, 0, 191}));
        connect(Pollution.u2, P_Absorption.y) annotation(
          Line(visible = true, points = {{-48.0, -140.0}, {-30.0, -140.0}}, color = {191, 0, 191}));
        connect(P_Generation.y1, Pollution.u1) annotation(
          Line(visible = true, points = {{-110.0, -140.0}, {-92.0, -140.0}}, color = {191, 0, 191}));
        connect(Source4.MassInPort1, P_Generation.y) annotation(
          Line(visible = true, points = {{-139.0, -140.0}, {-130.0, -140.0}}, color = {191, 0, 191}));
        connect(FPCI.y, Prod_3_2.u3) annotation(
          Line(visible = true, points = {{-136.5, -107.0}, {-117.0, -107.0}, {-117.0, -76.5}}, color = {0, 0, 191}));
        connect(FPM.y, Prod_3_2.u2) annotation(
          Line(visible = true, points = {{-49.5, -66.0}, {-107.2, -66.0}}, color = {0, 0, 191}));
        connect(Prod_3_2.u1, FCM.y) annotation(
          Line(visible = true, points = {{-117.0, -55.5}, {-117.0, -47.0}, {-101.5, -47.0}}, color = {0, 0, 191}));
        connect(Prod_3_2.y, Food_Ratio.u) annotation(
          Line(visible = true, points = {{-126.8, -66.0}, {-138.5, -66.0}}, color = {0, 0, 191}));
        connect(CIR.u1, Capital_Investment.y1) annotation(
          Line(visible = true, points = {{125.0, 15.6}, {154.0, 15.6}, {154.0, -29.0}, {147.0, -29.0}}, color = {0, 0, 191}));
        connect(NRFR.y, NREM.u) annotation(
          Line(visible = true, points = {{147.5, 51.0}, {163.0, 51.0}}, color = {0, 0, 191}));
        connect(DRMM.y, Prod_5_2.u5) annotation(
          Line(visible = true, points = {{34.5, 171.0}, {26.0, 171.0}, {26.0, 104.0}, {40.0, 104.0}, {40.0, 79.0}, {31.2, 79.0}}, color = {0, 0, 191}));
        connect(Prod_5_2.u1, Population.y2) annotation(
          Line(visible = true, points = {{8.8, 79.0}, {-55.0, 79.0}, {-55.0, 127.0}}, color = {0, 0, 191}));
        connect(BRMM.y, Prod_5_1.u1) annotation(
          Line(visible = true, points = {{-121.5, 185.0}, {-180.0, 185.0}, {-180.0, 80.0}, {-171.2, 80.0}}, color = {0, 0, 191}));
        connect(Prod_5_1.u5, Population.y4) annotation(
          Line(visible = true, points = {{-148.8, 80.0}, {-85.0, 80.0}, {-85.0, 127.0}}, color = {0, 0, 191}));
        connect(Prod_5_1.y, BR_norm.u) annotation(
          Line(visible = true, points = {{-160.0, 91.2}, {-160.0, 103.0}, {-145.5, 103.0}}, color = {0, 0, 191}));
        connect(BR_norm.y, Birth_Rate.u) annotation(
          Line(visible = true, points = {{-124.5, 103.0}, {-120.0, 103.0}, {-120.0, 119.0}}, color = {0, 0, 191}));
        connect(Source1.MassInPort1, Birth_Rate.y) annotation(
          Line(visible = true, points = {{-139.0, 140.0}, {-130.0, 140.0}}, color = {191, 0, 191}));
        connect(Birth_Rate.y1, Population.u1) annotation(
          Line(visible = true, points = {{-110.0, 140.0}, {-92.0, 140.0}}, color = {191, 0, 191}));
        connect(Population.u2, Death_Rate.y) annotation(
          Line(visible = true, points = {{-48.0, 140.0}, {-30.0, 140.0}}, color = {191, 0, 191}));
        connect(Death_Rate.y1, Sink1.MassInPort1) annotation(
          Line(visible = true, points = {{-10.0, 140.0}, {-1.0, 140.0}}, color = {191, 0, 191}));
        connect(Source2.MassInPort1, Generation.y) annotation(
          Line(visible = true, points = {{61.0, 140.0}, {70.0, 140.0}}, color = {191, 0, 191}));
        connect(Gen_Const.y, Generation.u) annotation(
          Line(visible = true, points = {{80.0, 111.5}, {80.0, 119.0}}, color = {0, 0, 191}));
        connect(NRFR.u, Natural_Resources.y4) annotation(
          Line(visible = true, points = {{126.5, 51.0}, {115.0, 51.0}, {115.0, 127.0}}, color = {0, 0, 191}));
        connect(Generation.y1, Natural_Resources.u1) annotation(
          Line(visible = true, points = {{90.0, 140.0}, {108.0, 140.0}}, color = {191, 0, 191}));
        connect(Natural_Resources.u2, Depletion.y) annotation(
          Line(visible = true, points = {{152.0, 140.0}, {170.0, 140.0}}, color = {191, 0, 191}));
        connect(Depletion.y1, Sink2.MassInPort1) annotation(
          Line(visible = true, points = {{190.0, 140.0}, {199.0, 140.0}}, color = {191, 0, 191}));
        Pop = Population.y;
        Pol = Pollution.y;
        Pol_rat = Pol_Ratio.y;
        Cap_inv = Capital_Investment.y;
        Qual_life = Quality_of_Life.y;
        Nat_res = Natural_Resources.y;
        NRUN = if time > 1970 then 0.25 else 1.0;
        NR_norm.u2 = NRUN;
        POLN = if time > 1970 then 0.25 else 1.0;
        Pol_norm.u2 = POLN;
        DRN = if time > 1970 then 0.02 else 0.028;
        DR_norm.u2 = DRN;
        Pop_meas = Functions.Utilities.Piecewise(x = time, x_grid = time_vals, y_grid = pop_vals);
        annotation(
          Icon(coordinateSystem(extent = {{-220.0, -260.0}, {440.0, 220.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, lineColor = {0, 0, 255}, fillColor = {255, 255, 0}, fillPattern = FillPattern.Solid, extent = {{-220.0, -264.0}, {442.0, 220.0}}), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-152.0, 70.0}, {368.0, 140.0}}, textString = "3rd Modification", fontName = "Arial"), Text(visible = true, lineColor = {0, 0, 255}, fillColor = {127, 0, 255}, extent = {{-148.0, -26.0}, {372.0, 44.0}}, textString = "DRN", fontName = "Arial"), Text(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, extent = {{-150.0, -106.0}, {370.0, -36.0}}, textString = "reduced to 0.2", fontName = "Arial"), Text(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, extent = {{-150.0, -192.0}, {370.0, -122.0}}, textString = "in 1970", fontName = "Arial")}),
          Diagram(coordinateSystem(extent = {{-220.0, -260.0}, {440.0, 220.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{-62.0, 6.0}, {-58.0, 10.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{98.0, 192.0}, {102.0, 196.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{138.0, -16.0}, {142.0, -12.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{-2.0, -22.0}, {2.0, -18.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{-178.0, -2.0}, {-174.0, 2.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{78.0, 4.0}, {82.0, 8.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{-2.0, -97.0}, {2.0, -93.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{-178.0, -68.0}, {-174.0, -64.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{-2.0, -68.0}, {2.0, -64.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{158.0, 28.0}, {162.0, 32.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{38.0, -262.0}, {42.0, -258.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{298.0, -102.0}, {302.0, -98.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{298.0, 28.0}, {302.0, 32.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{298.0, 78.0}, {302.0, 82.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{298.0, 169.0}, {302.0, 173.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{342.0, -171.0}, {346.0, -167.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{354.0, -234.0}, {358.0, -230.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{-97.0, 6.0}, {-93.0, 10.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{-137.0, -22.0}, {-133.0, -18.0}})}),
          experiment(StartTime = 1900, StopTime = 2000),
          experimentSetupOutput,
          Documentation(info = "<html>
This is a further modification of <a href=\"http://en.wikipedia.org/wiki/Jay_Wright_Forrester\">Jay Forrester's</a> <font color=red><b>WORLD2</b></font> model. The death rate is reduced in 1970 to better account for the recent advances in medicine. <p>
 
<hr> <p>
 
<b>References:</b> <p>
 
<ol>
<li> Cellier, F.E. (1991), <a href=\"http://www.amazon.com/Continuous-System-Modeling-Fran%C3%A7ois-Cellier/dp/0387975020\">Continuous System Modeling</a>, Springer-Verlag, New York, ISBN: 0-387-97502-0, 755p.
<li> Forrester, J.W. (1971), <a href=\"http://www.amazon.com/World-Dynamics-Jay-W-Forrester/dp/1883823382/ref=ed_oe_h/103-2487145-1208659\">World Dynamics</a>, Pegasus Communications, 160p.
</ol> <p>
 
<hr> <p>
 
Simulate the model across 100 years, and plot the simulated and the measured world populations together on a single graph against the calendar years: <p>
<img src=\"modelica://SystemDynamics/Resources/Images/SD_Fig4.png\"> <p>
 
<hr> <p>
</html>", revisions = ""));
      end Scenario_4;