      block Labor_Utilization "Utilization of the labor force"
        parameter Real labor_util_fr_del_init = 1 "Initial delayed labor utilization fraction";
        parameter Real labor_util_fr_del_time(unit = "yr") = 2 "Labor utilization fraction delay time";
        SystemDynamics.Levels.Level1a Labor_Util_Fr_Del(x0 = labor_util_fr_del_init) annotation(
          Placement(visible = true, transformation(origin = {0.0, -5.1833}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = 0)),
          Dialog(group = "Variables"));
        SystemDynamics.Rates.Rate_1 Chg_Lab_Util_Fr_Del annotation(
          Placement(visible = true, transformation(origin = {-40.0, -4.6542}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = 0)),
          Dialog(group = "Variables"));
        SystemDynamics.Sources.Source Source1 annotation(
          Placement(visible = true, transformation(origin = {-70.0, -13.65}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Utilities.Ch_Lab_Util_Fr_Del Ch_Lab_Util_Fr_Del(labor_util_fr_del_time = labor_util_fr_del_time) "p.241 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-40.0, -37.4563}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -270)),
          Dialog(group = "Variables"));
        SystemDynamics.Functions.Tabular Capital_Util_Fr(x_vals = (-1):2:11, y_vals = {1, 1, 0.9, 0.7, 0.3, 0.1, 0.1}) "p.241 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {57.225, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)),
          Dialog(group = "Variables"));
        Modelica.Blocks.Math.Division Labor_Util_Fr "p.241 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-44.7625, -72.0625}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -270)),
          Dialog(group = "Variables"));
        Modelica.Blocks.Math.Add3 Jobs "p.233 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-65.4417, 30.0}, extent = {{10.0, -10.0}, {-10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Prod_2 Pot_Jobs_Agr_Sector "p.237 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-75.075, 80.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -180)));
        SystemDynamics.Functions.Tabular Jobs_Per_Hect(x_vals = {0, 2, 6, 10, 14, 18, 22, 26, 30, 10000}, y_vals = {2, 2, 0.5, 0.4, 0.3, 0.27, 0.24, 0.2, 0.2, 0.2}) "p.239 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-50.0, 80.0}, extent = {{10.0, -10.0}, {-10.0, 10.0}}, rotation = 0)),
          Dialog(group = "Variables"));
        SystemDynamics.Auxiliary.Prod_2 Pot_Jobs_Ind_Sector "p.233 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-22.0, 44.6542}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -180)));
        SystemDynamics.Functions.Tabular Jobs_Per_Ind_Cap_Unit(x_vals = (-100):150:800, y_vals = {0.00037, 0.00037, 0.00018, 0.00012, 0.00009, 0.00007, 0.00006}) "p.236 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {10.0, 44.6542}, extent = {{10.0, -10.0}, {-10.0, 10.0}}, rotation = 0)),
          Dialog(group = "Variables"));
        SystemDynamics.Auxiliary.Prod_2 Pot_Jobs_In_Serv_Sector "p.236 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {56.1333, 35.2917}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -180)));
        SystemDynamics.Functions.Tabular Jobs_Per_Serv_Cap_Unit(x_vals = {0, 50, 200, 350, 500, 650, 800, 1200}, y_vals = {0.0011, 0.0011, 0.0006, 0.00035, 0.0002, 0.00015, 0.00015, 0.00015}) "p.237 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {80.0, 50.0}, extent = {{10.0, -10.0}, {-10.0, 10.0}}, rotation = 0)),
          Dialog(group = "Variables"));
        SystemDynamics.Interfaces.MassInPort service_capital(unit = "dollar") "Total capital invested in service sector" annotation(
          Placement(visible = true, transformation(origin = {-110.0, 80.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-110.0, 80.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassInPort ind_out_pc(unit = "dollar/yr") "Per capita annual industrial output" annotation(
          Placement(visible = true, transformation(origin = {-110.0, 41.5333}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-110.0, 40.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassInPort industrial_capital(unit = "dollar") "Total capital invested in the military/industrial sector" annotation(
          Placement(visible = true, transformation(origin = {-110.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-110.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassInPort agr_inp_per_hect(unit = "dollar/(hectare.yr)") "Agricultural investments per hectare" annotation(
          Placement(visible = true, transformation(origin = {-110.0, -40.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-110.0, -40.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassInPort arable_land(unit = "hectare") "Arable land" annotation(
          Placement(visible = true, transformation(origin = {-110.0, -80.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-110.0, -80.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassInPort labor_force "Total human labor force" annotation(
          Placement(visible = true, transformation(origin = {-76.1597, -102.9722}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -90), iconTransformation(origin = {-60.0, -110.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -270)));
        SystemDynamics.Interfaces.MassInPort serv_out_pc(unit = "dollar/yr") "Per capita annual expenditure in services" annotation(
          Placement(visible = true, transformation(origin = {-77.925, 103.0806}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 90), iconTransformation(origin = {-60.0, 110.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -90)));
        SystemDynamics.Interfaces.MassOutPort capital_util_fr "Capital utilization fraction" annotation(
          Placement(visible = true, transformation(origin = {111.575, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {110.0, -40.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      equation
        connect(Jobs_Per_Hect.u, agr_inp_per_hect) annotation(
          Line(visible = true, points = {{-42.0, 80.0}, {-17.4625, 80.0}, {-17.4625, 93.1333}, {-90.0, 93.1333}, {-90.0, -40.0}, {-110.0, -40.0}}, color = {0, 0, 191}));
        connect(Pot_Jobs_In_Serv_Sector.u2, service_capital) annotation(
          Line(visible = true, points = {{49.1333, 35.2917}, {45.5083, 35.2917}, {45.5083, 100.0}, {-100.0, 100.0}, {-100.0, 80.0}, {-110.0, 80.0}}, color = {0, 0, 191}));
        connect(Capital_Util_Fr.u, Labor_Util_Fr_Del.y1) annotation(
          Line(visible = true, points = {{49.225, 0.0}, {30.0, 0.0}, {30.0, 3.0667}, {12.75, 3.0667}}, color = {0, 0, 191}));
        connect(Ch_Lab_Util_Fr_Del.u2, Labor_Util_Fr_Del.y4) annotation(
          Line(visible = true, points = {{-36.0, -46.4563}, {-36.0, -54.5042}, {-11.25, -54.5042}, {-11.25, -14.9333}}, color = {0, 0, 191}));
        connect(Labor_Util_Fr.y, Ch_Lab_Util_Fr_Del.u1) annotation(
          Line(visible = true, points = {{-44.7625, -61.0625}, {-44.0, -61.0625}, {-44.0, -46.4563}}, color = {0, 0, 191}));
        connect(Ch_Lab_Util_Fr_Del.y, Chg_Lab_Util_Fr_Del.u) annotation(
          Line(visible = true, origin = {-40.0, -24.4302}, points = {{0.0, -4.026}, {0.0, 4.026}}, color = {0, 0, 191}));
        connect(Chg_Lab_Util_Fr_Del.y1, Labor_Util_Fr_Del.u1) annotation(
          Line(visible = true, origin = {-22.0, -4.9188}, points = {{-10.5, 0.2645}, {2.5, 0.2645}, {2.5, -0.2645}, {5.5, -0.2645}}, color = {95, 0, 191}));
        connect(Source1.MassInPort1, Chg_Lab_Util_Fr_Del.y) annotation(
          Line(visible = true, origin = {-54.625, -9.1521}, points = {{-4.375, -4.4979}, {-1.375, -4.4979}, {-1.375, 4.4979}, {7.125, 4.4979}}, color = {95, 0, 191}));
        connect(Pot_Jobs_In_Serv_Sector.y, Jobs.u3) annotation(
          Line(visible = true, origin = {19.6083, 24.0972}, points = {{36.525, 4.1945}, {36.525, -2.0972}, {-73.05, -2.0972}}, color = {0, 0, 191}));
        connect(Jobs_Per_Serv_Cap_Unit.y, Pot_Jobs_In_Serv_Sector.u1) annotation(
          Line(visible = true, origin = {66.6, 42.6458}, points = {{2.4, 7.3542}, {0.5333, 7.3542}, {0.5333, -7.3541}, {-3.4667, -7.3541}}, color = {0, 0, 191}));
        connect(Pot_Jobs_Ind_Sector.u2, industrial_capital) annotation(
          Line(visible = true, points = {{-29.0, 44.6542}, {-40.0, 44.6542}, {-40.0, 94.1917}, {-94.1917, 94.1917}, {-94.1917, 0.0}, {-110.0, 0.0}}, color = {0, 0, 191}));
        connect(Jobs_Per_Ind_Cap_Unit.y, Pot_Jobs_Ind_Sector.u1) annotation(
          Line(visible = true, origin = {-8.0, 44.6542}, points = {{7.0, 0.0}, {-7.0, 0.0}}, color = {0, 0, 191}));
        connect(Pot_Jobs_Ind_Sector.y, Jobs.u2) annotation(
          Line(visible = true, origin = {-32.4806, 32.5514}, points = {{10.4806, 5.1028}, {10.4806, -2.5514}, {-20.9611, -2.5514}}, color = {0, 0, 191}));
        connect(Pot_Jobs_Agr_Sector.u2, arable_land) annotation(
          Line(visible = true, points = {{-82.075, 80.0}, {-83.6083, 80.0}, {-83.6083, -80.0}, {-110.0, -80.0}}, color = {0, 0, 191}));
        connect(Jobs_Per_Hect.y, Pot_Jobs_Agr_Sector.u1) annotation(
          Line(visible = true, origin = {-64.5375, 80.0}, points = {{3.5375, 0.0}, {-3.5375, 0.0}}, color = {0, 0, 191}));
        connect(Pot_Jobs_Agr_Sector.y, Jobs.u1) annotation(
          Line(visible = true, origin = {-60.895, 56.6}, points = {{-14.18, 16.4}, {-14.18, 10.4}, {10.4533, 10.4}, {10.4533, -18.6}, {7.4533, -18.6}}, color = {0, 0, 191}));
        connect(Labor_Util_Fr.u1, Jobs.y) annotation(
          Line(points = {{-50.7625, -84.0625}, {-50.7625, -90.0}, {-80.0, -90.0}, {-80.0, 30.0}, {-76.4417, 30.0}}, color = {0, 0, 191}, visible = true));
        connect(Labor_Util_Fr.u2, labor_force) annotation(
          Line(points = {{-38.7625, -84.0625}, {-40.0, -94.7208}, {-76.2, -94.7208}, {-76.1597, -102.9722}}, color = {0, 0, 191}, visible = true));
        connect(Jobs_Per_Ind_Cap_Unit.u, ind_out_pc) annotation(
          Line(points = {{18.0, 44.6542}, {30.0, 44.6542}, {30.0, 95.7792}, {-97.3667, 95.7792}, {-97.3667, 41.5333}, {-110.0, 41.5333}}, color = {0, 0, 191}, visible = true));
        connect(Jobs_Per_Serv_Cap_Unit.u, serv_out_pc) annotation(
          Line(points = {{88.0, 50.0}, {97.3667, 50.0}, {97.3667, 96.8375}, {-77.925, 98.425}, {-77.925, 103.0806}}, color = {0, 0, 191}, visible = true));
        connect(capital_util_fr, Capital_Util_Fr.y) annotation(
          Line(points = {{111.575, 0.0}, {90.0, 0.0}, {87.3125, 0.0}, {68.225, 0.0}}, color = {0, 0, 191}, visible = true));
        annotation(
          Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, fillColor = {170, 255, 170}, fillPattern = FillPattern.Solid, lineThickness = 1.0, extent = {{-100.0, -100.0}, {100.0, 100.0}}, radius = 0.5), Text(visible = true, origin = {0.0, 30.0}, fillPattern = FillPattern.Solid, extent = {{-47.3724, -36.6918}, {47.3724, 36.6918}}, textString = "Labor", fontSize = 102.0, fontName = "Arial"), Text(visible = true, origin = {0.0, -30.0}, fillPattern = FillPattern.Solid, extent = {{-95.4145, -36.6918}, {95.4145, 36.6918}}, textString = "Utilization", fontSize = 102.0, fontName = "Arial")}),
          Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics),
          Documentation(info = "<html>
This model computes the available labor work force that is available to be employed by agriculture, industry, and in the service sector. <p>
 
The labor utilization fraction is dimensionless.
</html>"));
      end Labor_Utilization;