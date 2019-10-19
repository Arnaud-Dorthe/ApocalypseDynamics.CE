      block Population_Dynamics "Population dynamics"
        parameter Real pop1_init = 650000000.0 "Initial population 14 years and younger";
        parameter Real pop2_init = 700000000.0 "Initial population 15 to 44 years old";
        parameter Real pop3_init = 190000000.0 "Initial population 45 to 64 years old";
        parameter Real pop4_init = 60000000.0 "Initial population 65 years and older";
        parameter Real labor_force_partic = 0.75 "Percentage of participating labor force";
        parameter Real reproductive_lifetime(unit = "yr") = 30 "Reproductive life time";
        parameter Real t_pop_equil_time(unit = "yr") = 4000 "Population equilibrium time";
        SystemDynamics.Rates.RRate Births "p.96 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-140.0, 0.0}, extent = {{-12.0, -12.0}, {12.0, 12.0}}, rotation = 0)));
        SystemDynamics.Sources.Source source annotation(
          Placement(visible = true, transformation(origin = {-170.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Levels.Level2b Pop_0_14(x0 = pop1_init) annotation(
          Placement(visible = true, transformation(origin = {-110.0, 0.0}, extent = {{-12.0, -12.0}, {12.0, 12.0}}, rotation = 0)));
        SystemDynamics.Rates.RRate Matur_14 "p.141 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-70.0, 5.0}, extent = {{-12.0, -12.0}, {12.0, 12.0}}, rotation = 0)));
        SystemDynamics.Levels.Level2b Pop_15_44(x0 = pop2_init) "p.57 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-39.0, 5.0}, extent = {{-12.0, -12.0}, {12.0, 12.0}}, rotation = 0)));
        SystemDynamics.Rates.RRate Matur_44 "p.141 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {0.0, 10.0}, extent = {{-12.0, -12.0}, {12.0, 12.0}}, rotation = 0)));
        SystemDynamics.Levels.Level2b Pop_45_64(x0 = pop3_init) "p.57 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {30.0, 10.0}, extent = {{-12.0, -12.0}, {12.0, 12.0}}, rotation = 0)));
        SystemDynamics.Rates.RRate Matur_64 "p.141 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {70.0, 15.0}, extent = {{-12.0, -12.0}, {12.0, 12.0}}, rotation = 0)));
        SystemDynamics.Levels.Level Pop_65plus(x0 = pop4_init) "p.57 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {102.0, 15.0}, extent = {{-12.0, -12.0}, {12.0, 12.0}}, rotation = 0)));
        SystemDynamics.Rates.RRate Deaths_65p "p.57 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {132.0, 15.0}, extent = {{-12.0, -12.0}, {12.0, 12.0}}, rotation = 0)));
        SystemDynamics.Sources.Sink sink annotation(
          Placement(visible = true, transformation(origin = {160.0, 15.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Utilities.Birth_Factors births(Repro_Life = reproductive_lifetime, t_pop_equil_time = t_pop_equil_time) "p.96 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-140.0, -29.0}, extent = {{-10.0, -11.0}, {10.0, 11.0}}, rotation = -270)));
        SystemDynamics.Rates.RRate Deaths_0_14 "p.57 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-90.0, -60.0}, extent = {{-12.0, -12.0}, {12.0, 12.0}}, rotation = -270)));
        SystemDynamics.Sources.Sink sink1 annotation(
          Placement(visible = true, transformation(origin = {-80.0, -90.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -90)));
        SystemDynamics.Rates.RRate Deaths_15_44 "p.57 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-20.0, -60.0}, extent = {{-12.0, -12.0}, {12.0, 12.0}}, rotation = -270)));
        SystemDynamics.Sources.Sink sink2 annotation(
          Placement(visible = true, transformation(origin = {-10.0, -90.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -90)));
        SystemDynamics.Rates.RRate Deaths_45_64 "p.57 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {50.0, -60.0}, extent = {{-12.0, -12.0}, {12.0, 12.0}}, rotation = -270)));
        SystemDynamics.Sources.Sink sink3 annotation(
          Placement(visible = true, transformation(origin = {60.0, -90.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -90)));
        SystemDynamics.WorldDynamics.World3.Utilities.Matur_Factors matur_14(bracket = 15) "p.141 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-70.0, -25.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -270)));
        SystemDynamics.WorldDynamics.World3.Utilities.Matur_Factors matur_44(bracket = 30) "p.141 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {0.0, -19.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -270)));
        SystemDynamics.WorldDynamics.World3.Utilities.Matur_Factors matur_64(bracket = 20) "p.141 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {70.0, -15.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -270)));
        SystemDynamics.WorldDynamics.World3.Utilities.Death_Factors deaths_0_14 "p.57 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-110.0, -82.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -270)));
        SystemDynamics.WorldDynamics.World3.Utilities.Death_Factors deaths_15_44 "p.57 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-40.0, -82.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -270)));
        SystemDynamics.WorldDynamics.World3.Utilities.Death_Factors deaths_45_64 "p.57 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {30.0, -82.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -270)));
        SystemDynamics.WorldDynamics.World3.Utilities.Death_Factors deaths_65p "p.57 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {132.0, -23.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -270)));
        SystemDynamics.Functions.Tabular Mort_0_14(x_vals = 20:10:90, y_vals = {0.0567, 0.0366, 0.0243, 0.0155, 0.0082, 0.0023, 0.001, 0.001}) "p.57 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-70.0, -124.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -270)));
        SystemDynamics.Functions.Tabular Mort_15_44(x_vals = 20:10:90, y_vals = {0.0266, 0.0171, 0.011, 0.0065, 0.004, 0.0016, 0.0008, 0.0008}) "p.57 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {0.0, -124.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -270)));
        SystemDynamics.Functions.Tabular Mort_45_64(x_vals = 20:10:90, y_vals = {0.0562, 0.0373, 0.0252, 0.0171, 0.0118, 0.0083, 0.006, 0.006}) "p.57 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {70.0, -124.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -270)));
        SystemDynamics.Functions.Tabular Mort_65p(x_vals = 20:10:90, y_vals = {0.13, 0.11, 0.09, 0.07, 0.06, 0.05, 0.04, 0.04}) "p.57 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {138.0, -77.2554}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -270)));
        SystemDynamics.Interfaces.MassInPort life_expectancy(unit = "yr") "Average life expectancy of human population" annotation(
          Placement(visible = true, transformation(origin = {-210.0, -80.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-110.0, -50.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        Modelica.Blocks.Math.Add Pop_Young annotation(
          Placement(visible = true, transformation(origin = {-150.0, 110.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        Modelica.Blocks.Math.Add Pop_Old annotation(
          Placement(visible = true, transformation(origin = {-150.0, 80.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        Modelica.Blocks.Math.Add Population annotation(
          Placement(visible = true, transformation(origin = {-112.0, 94.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        Modelica.Blocks.Math.Add Death_Young annotation(
          Placement(visible = true, transformation(origin = {149.0, 110.0}, extent = {{11.0, -10.0}, {-11.0, 10.0}}, rotation = 0)));
        Modelica.Blocks.Math.Add Death_Old annotation(
          Placement(visible = true, transformation(origin = {149.0, 80.0}, extent = {{11.0, -10.0}, {-11.0, 10.0}}, rotation = 0)));
        Modelica.Blocks.Math.Add Deaths annotation(
          Placement(visible = true, transformation(origin = {110.0, 94.0}, extent = {{10.0, -10.0}, {-10.0, 10.0}}, rotation = 0)));
        Modelica.Blocks.Math.Add Work_Pop "p.241 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {50.0, 50.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        Modelica.Blocks.Math.Gain Labor_Force(k = labor_force_partic) "p.241 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {96.0, 50.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassOutPort labor_force "Total human labor force" annotation(
          Placement(visible = true, transformation(origin = {210.0, -80.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {110.0, -50.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Utilities.BD_Rates Birth_Rate "p.97 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-73.0, 99.0}, extent = {{-13.0, -13.0}, {13.0, 13.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Utilities.BD_Rates Death_Rate "p.140 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {68.0, 99.0}, extent = {{14.0, -13.0}, {-14.0, 13.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassInPort total_fertility "Average human fertility" annotation(
          Placement(visible = true, transformation(origin = {-210.0, 60.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-110.0, 50.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)),
          Dialog(group = "Variables"));
        SystemDynamics.Interfaces.MassOutPort population "Population" annotation(
          Placement(visible = true, transformation(origin = {210.0, 60.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {110.0, 50.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      equation
        connect(Labor_Force.y, labor_force) annotation(
          Line(visible = true, points = {{107.0, 50.0}, {188.0, 50.0}, {188.0, -80.0}, {210.0, -80.0}}, color = {0, 0, 191}));
        connect(Labor_Force.u, Work_Pop.y) annotation(
          Line(visible = true, origin = {72.5, 50.0}, points = {{11.5, 0.0}, {-11.5, 0.0}}, color = {0, 0, 191}));
        connect(matur_64.u1, Pop_45_64.y1) annotation(
          Line(visible = true, points = {{66.0, -24.0}, {66.0, -30.0}, {39.0, -30.0}, {39.0, 2.2}}, color = {0, 0, 191}));
        connect(matur_44.u1, Pop_15_44.y1) annotation(
          Line(visible = true, points = {{-4.0, -28.0}, {-4.0, -34.0}, {-29.25, -34.0}, {-30.0, -2.8}}, color = {0, 0, 191}));
        connect(matur_14.u1, Pop_0_14.y1) annotation(
          Line(visible = true, points = {{-74.0, -34.0}, {-74.0, -40.0}, {-101.0, -40.0}, {-101.0, -7.8}}, color = {0, 0, 191}));
        connect(deaths_0_14.u1, Pop_0_14.y2) annotation(
          Line(visible = true, points = {{-114.0, -91.0}, {-114.0, -104.0}, {-126.0, -104.0}, {-126.0, -48.0}, {-110.0, -48.0}, {-110.0, -7.8}}, color = {0, 0, 191}));
        connect(Mort_0_14.y, deaths_0_14.u2) annotation(
          Line(visible = true, points = {{-70.0, -113.0}, {-70.0, -104.0}, {-106.0, -104.0}, {-106.0, -91.0}}, color = {0, 0, 191}));
        connect(deaths_15_44.u1, Pop_15_44.y2) annotation(
          Line(visible = true, points = {{-44.0, -91.0}, {-44.0, -104.0}, {-56.0, -104.0}, {-56.0, -48.0}, {-39.0, -48.0}, {-39.0, -2.8}}, color = {0, 0, 191}));
        connect(Mort_15_44.y, deaths_15_44.u2) annotation(
          Line(visible = true, points = {{0.0, -113.0}, {0.0, -104.0}, {-36.0, -104.0}, {-36.0, -91.0}}, color = {0, 0, 191}));
        connect(deaths_45_64.u1, Pop_45_64.y2) annotation(
          Line(visible = true, points = {{26.0, -91.0}, {26.0, -104.0}, {14.0, -104.0}, {14.0, -30.0}, {30.0, -30.0}, {30.0, 2.2}}, color = {0, 0, 191}));
        connect(Mort_45_64.y, deaths_45_64.u2) annotation(
          Line(visible = true, points = {{70.0, -113.0}, {70.0, -104.0}, {34.0, -104.0}, {34.0, -91.0}}, color = {0, 0, 191}));
        connect(Work_Pop.u2, Pop_45_64.y) annotation(
          Line(visible = true, points = {{38.0, 44.0}, {14.0, 44.0}, {14.0, 16.6}, {19.8, 16.6}}, color = {0, 0, 191}));
        connect(Pop_Old.u1, Pop_45_64.y) annotation(
          Line(visible = true, points = {{-162.0, 86.0}, {-172.0, 86.0}, {-172.0, 28.0}, {14.0, 28.0}, {14.0, 16.6}, {19.8, 16.6}}, color = {0, 0, 191}));
        connect(Pop_45_64.u3, Deaths_45_64.y) annotation(
          Line(visible = true, origin = {47.7333, -18.5333}, points = {{-4.5333, 23.7333}, {2.2667, 23.7333}, {2.2667, -47.4667}}, color = {191, 0, 191}));
        connect(Pop_45_64.u2, Matur_64.y) annotation(
          Line(visible = true, points = {{43.2, 14.8}, {52.6, 14.8}, {52.6, 15.0}, {64.0, 15.0}}, color = {191, 0, 191}));
        connect(Matur_44.y1, Pop_45_64.u1) annotation(
          Line(visible = true, origin = {11.4, 10.0}, points = {{-5.4, 0.0}, {5.4, 0.0}}, color = {191, 0, 191}));
        connect(deaths_65p.u1, Pop_65plus.y2) annotation(
          Line(visible = true, points = {{128.0, -32.0}, {128.0, -40.0}, {111.0, -40.0}, {111.0, 7.2}}, color = {0, 0, 191}));
        connect(Pop_Old.u2, Pop_65plus.y) annotation(
          Line(visible = true, points = {{-162.0, 74.0}, {-168.0, 74.0}, {-168.0, 32.0}, {84.0, 32.0}, {84.0, 22.15}, {91.8, 21.6}}, color = {0, 0, 191}));
        connect(Pop_65plus.u2, Deaths_65p.y) annotation(
          Line(visible = true, origin = {120.6, 15.0}, points = {{-5.4, 0.0}, {5.4, 0.0}}, color = {191, 0, 191}));
        connect(Matur_64.y1, Pop_65plus.u1) annotation(
          Line(visible = true, origin = {82.4, 15.0}, points = {{-6.4, 0.0}, {6.4, 0.0}}, color = {191, 0, 191}));
        connect(matur_64.y, Matur_64.u) annotation(
          Line(visible = true, origin = {70.0, -1.8}, points = {{0.0, -4.2}, {0.0, 4.2}}, color = {0, 0, 191}));
        connect(Matur_14.y1, Pop_15_44.u1) annotation(
          Line(visible = true, origin = {-58.1, 5.0}, points = {{-5.9, 0.0}, {5.9, 0.0}}, color = {191, 0, 191}));
        connect(Work_Pop.u1, Pop_15_44.y) annotation(
          Line(visible = true, points = {{38.0, 56.0}, {-56.0, 56.0}, {-56.0, 12.15}, {-49.2, 11.6}}, color = {0, 0, 191}));
        connect(Pop_Young.u2, Pop_15_44.y) annotation(
          Line(visible = true, points = {{-162.0, 104.0}, {-176.0, 104.0}, {-176.0, 24.0}, {-56.0, 24.0}, {-56.0, 12.15}, {-49.2, 11.6}}, color = {0, 0, 191}));
        connect(births.u3, Pop_15_44.y3) annotation(
          Line(visible = true, points = {{-133.4, -38.0}, {-133.4, -44.0}, {-48.75, -44.0}, {-48.0, -2.8}}, color = {0, 0, 191}));
        connect(Pop_15_44.u3, Deaths_15_44.y) annotation(
          Line(visible = true, origin = {-21.9333, -21.8667}, points = {{-3.8667, 22.0667}, {1.9333, 22.0667}, {1.9333, -44.1333}}, color = {191, 0, 191}));
        connect(Pop_15_44.u2, Matur_44.y) annotation(
          Line(visible = true, points = {{-25.8, 9.8}, {-17.4, 10.2}, {-17.4, 10.0}, {-6.0, 10.0}}, color = {191, 0, 191}));
        connect(matur_14.y, Matur_14.u) annotation(
          Line(visible = true, origin = {-70.0, -11.8}, points = {{0.0, -4.2}, {0.0, 4.2}}, color = {0, 0, 191}));
        connect(Pop_0_14.u2, Matur_14.y) annotation(
          Line(visible = true, points = {{-96.8, 4.8}, {-88.4, 4.8}, {-88.4, 5.0}, {-76.0, 5.0}}, color = {191, 0, 191}));
        connect(Deaths_65p.y1, sink.MassInPort1) annotation(
          Line(visible = true, origin = {143.5, 15.0}, points = {{-5.5, 0.0}, {5.5, 0.0}}, color = {191, 0, 191}));
        connect(deaths_65p.y, Deaths_65p.u) annotation(
          Line(visible = true, origin = {132.0, -5.8}, points = {{0.0, -8.2}, {0.0, 8.2}}, color = {0, 0, 191}));
        connect(deaths_45_64.y, Deaths_45_64.u) annotation(
          Line(visible = true, origin = {40.8667, -64.3333}, points = {{-10.8667, -8.6667}, {-10.8667, 4.3333}, {21.7333, 4.3333}}, color = {0, 0, 191}));
        connect(Deaths_45_64.y1, sink3.MassInPort1) annotation(
          Line(visible = true, origin = {55.0, -71.25}, points = {{-5.0, 17.25}, {-5.0, -4.75}, {5.0, -4.75}, {5.0, -7.75}}, color = {191, 0, 191}));
        connect(deaths_45_64.y, Death_Old.u1) annotation(
          Line(visible = true, points = {{30.0, -73.0}, {30.0, -42.0}, {176.0, -42.0}, {176.0, 86.0}, {162.2, 86.0}}, color = {0, 0, 191}));
        connect(deaths_15_44.y, Death_Young.u2) annotation(
          Line(visible = true, points = {{-40.0, -73.0}, {-40.0, -60.0}, {-60.0, -60.0}, {-60.0, -144.0}, {180.0, -144.0}, {180.0, 104.0}, {162.2, 104.0}}, color = {0, 0, 191}));
        connect(deaths_15_44.y, Deaths_15_44.u) annotation(
          Line(visible = true, origin = {-29.1333, -64.3333}, points = {{-10.8667, -8.6667}, {-10.8667, 4.3333}, {21.7333, 4.3333}}, color = {0, 0, 191}));
        connect(Deaths_15_44.y1, sink2.MassInPort1) annotation(
          Line(visible = true, origin = {-15.0, -71.25}, points = {{-5.0, 17.25}, {-5.0, -4.75}, {5.0, -4.75}, {5.0, -7.75}}, color = {191, 0, 191}));
        connect(deaths_0_14.y, Deaths_0_14.u) annotation(
          Line(visible = true, origin = {-99.1333, -64.3333}, points = {{-10.8667, -8.6667}, {-10.8667, 4.3333}, {21.7333, 4.3333}}, color = {0, 0, 191}));
        connect(Deaths_0_14.y1, sink1.MassInPort1) annotation(
          Line(visible = true, origin = {-85.0, -71.25}, points = {{-5.0, 17.25}, {-5.0, -4.75}, {5.0, -4.75}, {5.0, -7.75}}, color = {191, 0, 191}));
        connect(Pop_0_14.u3, Deaths_0_14.y) annotation(
          Line(visible = true, origin = {-92.2667, -25.2}, points = {{-4.5333, 20.4}, {2.2667, 20.4}, {2.2667, -40.8}}, color = {191, 0, 191}));
        connect(Mort_0_14.y, matur_14.u2) annotation(
          Line(visible = true, points = {{-70.0, -113.0}, {-70.0, -104.0}, {-66.0, -104.0}, {-66.0, -34.0}}, color = {0, 0, 191}));
        connect(Mort_15_44.y, matur_44.u2) annotation(
          Line(visible = true, points = {{0.0, -113.0}, {0.0, -104.0}, {5.2, -104.0}, {4.0, -28.0}}, color = {0, 0, 191}));
        connect(matur_44.y, Matur_44.u) annotation(
          Line(visible = true, points = {{0.0, -10.0}, {0.0, -6.55}, {0.0, -6.55}, {0.0, -2.6}}, color = {0, 0, 191}));
        connect(Mort_45_64.y, matur_64.u2) annotation(
          Line(visible = true, points = {{70.0, -113.0}, {70.0, -104.0}, {75.2, -104.0}, {74.0, -24.0}}, color = {0, 0, 191}));
        connect(deaths_65p.y, Death_Old.u2) annotation(
          Line(visible = true, points = {{132.0, -14.0}, {132.0, -4.0}, {172.0, -4.0}, {172.0, 74.0}, {162.2, 74.0}}, color = {0, 0, 191}));
        connect(Mort_65p.y, deaths_65p.u2) annotation(
          Line(visible = true, origin = {137.0, -42.5639}, points = {{1.0, -23.6915}, {1.0, 6.5639}, {-1.0, 6.5639}, {-1.0, 10.5639}}, color = {0, 0, 191}));
        connect(Mort_65p.u, Mort_45_64.u) annotation(
          Line(visible = true, points = {{138.0, -85.2554}, {138.0, -140.0}, {70.0, -140.0}, {70.0, -132.0}}, color = {0, 0, 191}));
        connect(Mort_45_64.u, Mort_15_44.u) annotation(
          Line(visible = true, points = {{70.0, -132.0}, {70.0, -140.0}, {0.0, -140.0}, {0.0, -132.0}}, color = {0, 0, 191}));
        connect(Mort_15_44.u, Mort_0_14.u) annotation(
          Line(visible = true, points = {{0.0, -132.0}, {0.0, -140.0}, {-70.0, -140.0}, {-70.0, -132.0}}, color = {0, 0, 191}));
        connect(Mort_0_14.u, life_expectancy) annotation(
          Line(visible = true, points = {{-70.0, -132.0}, {-70.0, -140.0}, {-180.0, -140.0}, {-180.0, -80.0}, {-210.0, -80.0}}, color = {0, 0, 191}));
        connect(deaths_0_14.y, Death_Young.u1) annotation(
          Line(visible = true, points = {{-110.0, -73.0}, {-110.0, -60.0}, {-130.0, -60.0}, {-130.0, -148.0}, {184.0, -148.0}, {184.0, 116.0}, {162.2, 116.0}}, color = {0, 0, 191}));
        connect(source.MassInPort1, Births.y) annotation(
          Line(points = {{-159.0, 0.0}, {-146.0, 0.0}}, color = {191, 0, 191}, visible = true));
        connect(Births.y1, Pop_0_14.u1) annotation(
          Line(points = {{-134.0, 0.0}, {-123.2, 0.0}}, color = {191, 0, 191}, visible = true));
        connect(births.y, Births.u) annotation(
          Line(points = {{-140.0, -20.0}, {-140.0, -12.6}}, color = {0, 0, 191}, visible = true));
        connect(Pop_Young.u1, Pop_0_14.y) annotation(
          Line(points = {{-162.0, 116.0}, {-180.0, 116.0}, {-180.0, 20.0}, {-126.0, 20.0}, {-126.0, 6.6}, {-120.2, 6.6}}, color = {0, 0, 191}, visible = true));
        connect(Pop_Young.y, Population.u1) annotation(
          Line(points = {{-139.0, 110.0}, {-132.0, 110.0}, {-132.0, 100.0}, {-124.0, 100.0}}, color = {0, 0, 191}, visible = true));
        connect(Pop_Old.y, Population.u2) annotation(
          Line(points = {{-139.0, 80.0}, {-132.0, 80.0}, {-132.0, 88.0}, {-124.0, 88.0}}, color = {0, 0, 191}, visible = true));
        connect(Death_Young.y, Deaths.u1) annotation(
          Line(points = {{136.9, 110.0}, {130.0, 110.0}, {130.0, 100.0}, {122.0, 100.0}}, color = {0, 0, 191}, visible = true));
        connect(Death_Old.y, Deaths.u2) annotation(
          Line(points = {{136.9, 80.0}, {130.0, 80.0}, {130.0, 88.0}, {122.0, 88.0}}, color = {0, 0, 191}, visible = true));
        connect(Birth_Rate.u2, Population.y) annotation(
          Line(points = {{-84.7, 93.8}, {-92.35, 93.8}, {-92.35, 94.0}, {-101.0, 94.0}}, color = {0, 0, 191}, visible = true));
        connect(births.y, Birth_Rate.u1) annotation(
          Line(points = {{-140.0, -20.0}, {-140.0, -16.0}, {-184.0, -16.0}, {-184.0, 128.0}, {-94.0, 128.0}, {-94.0, 104.2}, {-84.7, 104.2}}, color = {0, 0, 191}, visible = true));
        connect(Population.y, Death_Rate.u2) annotation(
          Line(points = {{-101.0, 94.0}, {-94.0, 94.0}, {-94.0, 74.0}, {86.0, 74.0}, {86.0, 93.8}, {80.6, 93.8}}, color = {0, 0, 191}, visible = true));
        connect(Deaths.y, Death_Rate.u1) annotation(
          Line(points = {{99.0, 94.0}, {92.0, 94.0}, {92.0, 104.2}, {80.6, 104.2}}, color = {0, 0, 191}, visible = true));
        connect(Deaths.y, births.u2) annotation(
          Line(points = {{99.0, 94.0}, {92.0, 94.0}, {92.0, 70.0}, {-60.0, 70.0}, {-60.0, 36.0}, {-156.0, 36.0}, {-156.0, -60.0}, {-140.0, -60.0}, {-140.0, -38.0}}, color = {0, 0, 191}, visible = true));
        connect(births.u1, total_fertility) annotation(
          Line(points = {{-146.6, -38.0}, {-146.6, -48.0}, {-188.0, -48.0}, {-188.0, 60.0}, {-210.0, 60.0}}, color = {0, 0, 191}, visible = true));
        connect(Population.y, population) annotation(
          Line(points = {{-101.0, 94.0}, {-94.0, 94.0}, {-94.0, 74.0}, {120.0, 74.0}, {120.0, 60.0}, {210.0, 60.0}}, color = {0, 0, 191}, visible = true));
        annotation(
          Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, fillColor = {170, 255, 170}, fillPattern = FillPattern.Solid, lineThickness = 1.0, extent = {{-100.0, -100.0}, {100.0, 100.0}}, radius = 0.5), Text(visible = true, origin = {-0.5365, 30.0}, fillPattern = FillPattern.Solid, extent = {{-89.4635, -36.6918}, {89.4635, 36.6918}}, textString = "Population", fontSize = 102.0, fontName = "Arial"), Text(visible = true, origin = {0.0, -30.0}, fillPattern = FillPattern.Solid, extent = {{-81.6353, -36.6918}, {81.6353, 36.6918}}, textString = "Dynamics", fontSize = 102.0, fontName = "Arial")}),
          Diagram(coordinateSystem(extent = {{-200.0, -160.0}, {200.0, 140.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{-71.0, -105.0}, {-69.0, -103.0}}), Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{-1.0, -105.0}, {1.0, -103.0}}), Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{69.0, -105.0}, {71.0, -103.0}}), Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{-71.0, -141.0}, {-69.0, -139.0}}), Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{-1.0, -141.0}, {1.0, -139.0}}), Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{69.0, -141.0}, {71.0, -139.0}}), Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{29.0, -61.0}, {31.0, -59.0}}), Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{-41.0, -61.0}, {-39.0, -59.0}}), Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{-111.0, -61.0}, {-109.0, -59.0}}), Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{131.0, -5.0}, {133.0, -3.0}}), Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{13.0, 27.0}, {15.0, 29.0}}), Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{-57.0, 23.0}, {-55.0, 25.0}}), Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{-141.0, -17.0}, {-139.0, -15.0}}), Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{-95.0, 93.0}, {-93.0, 95.0}}), Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{91.0, 93.0}, {93.0, 95.0}}), Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{85.0, 73.0}, {87.0, 75.0}})}),
          Documentation(info = "<html>
This model describes the population dynamics of the <font color=red><b>WORLD3</b></font> model.  Whereas the earlier <font color=red><b>WORLD2</b></font> model had lumped all of the population together into a single state variable, <font color=red><b>WORLD3</b></font> offers a demographic model that distinguishes between four age groups, those of the children, those of the younger adults representing the child-bearing population, those of the older adults who are still in the work force, and finally, those of the retired population. <p>
 
Population is measured in numbers of living humans.  In accordance with engineering practice, which (arbitrarily) assigns measurement units only to real-valued quantities and not to integer-valued quantities, this model lists the population as dimensionless. <p>
 
This model is described on p.142 of <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>.
</html>"));
      end Population_Dynamics;