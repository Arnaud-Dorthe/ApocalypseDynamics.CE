      block Service_Sector_Investment "Investments in the service sector"
        parameter Real t_policy_year(unit = "yr") = 4000 "Year of policy change";
        parameter Real p_avg_life_serv_cap_1(unit = "yr") = 20 "Default average life of service sector capital";
        parameter Real p_avg_life_serv_cap_2(unit = "yr") = 20 "Controlled average life of service sector capital";
        parameter Real p_serv_cap_out_ratio_1(unit = "yr") = 1.0 "Default fraction of service sector output ratio";
        parameter Real p_serv_cap_out_ratio_2(unit = "yr") = 1.0 "Controlled fraction of service sector output ratio";
        parameter Real service_capital_init(unit = "dollar") = 144000000000.0 "Initial service sector investment";
        SystemDynamics.Sources.Source Source1 annotation(
          Placement(visible = true, transformation(origin = {-170.0, 30.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Rates.RRate Serv_Cap_Invest "p.230 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-120.0, 30.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = 0)));
        SystemDynamics.Levels.Level Service_Capital(x0 = service_capital_init) "p.230 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-60.0, 30.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = 0)));
        SystemDynamics.Rates.RRate Serv_Cap_Deprec "p.231 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {0.0, 30.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = 0)));
        SystemDynamics.Sources.Sink Sink1 annotation(
          Placement(visible = true, transformation(origin = {50.0, 30.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Prod_2 Serv_Cap_Inv "p.230 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-120.0, -10.0}, extent = {{-12.0, -12.0}, {12.0, 12.0}}, rotation = 0)));
        Modelica.Blocks.Math.Division Serv_Cap_Dep "p.231 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {0.0, -12.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -270)));
        SystemDynamics.WorldDynamics.World3.Utilities.S_Avg_Life_Serv_Cap S_Avg_Life_Serv_Cap(t_policy_year = t_policy_year, p_avg_life_serv_cap_1 = p_avg_life_serv_cap_1, p_avg_life_serv_cap_2 = p_avg_life_serv_cap_2) "p.231 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {43.0, -36.0}, extent = {{10.0, -10.0}, {-10.0, 10.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Utilities.Service_Output Service_Output "p.231 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-70.0, 80.0}, extent = {{10.0, -10.0}, {-10.0, 10.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Utilities.S_Serv_Cap_Out_Ratio S_Serv_Cap_Out_Ratio(t_policy_year = t_policy_year, p_serv_cap_out_ratio_1 = p_serv_cap_out_ratio_1, p_serv_cap_out_ratio_2 = p_serv_cap_out_ratio_2) "p.232 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-2.0, 80.0}, extent = {{10.0, -10.0}, {-10.0, 10.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Utilities.S_FIOA_Serv S_FIOA_Serv(t_policy_year = t_policy_year) "p.229 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-105.0, -80.0}, extent = {{10.0, -10.0}, {-10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular P_Fr_IO_Al_Serv_1(x_vals = {0, 0.5, 1, 1.5, 2, 5}, y_vals = {0.3, 0.2, 0.1, 0.05, 0, 0}) "p.229 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-42.0, -60.0}, extent = {{10.0, -10.0}, {-10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular P_Fr_IO_Al_Serv_2(x_vals = {0, 0.5, 1, 1.5, 2, 5}, y_vals = {0.3, 0.2, 0.1, 0.05, 0, 0}) "p.229 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-42.0, -100.0}, extent = {{10.0, -10.0}, {-10.0, 10.0}}, rotation = 0)));
        Modelica.Blocks.Math.Division Div1 "p.229 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {10.0, -80.0}, extent = {{10.0, -10.0}, {-10.0, 10.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Utilities.S_Indic_Serv_PC S_Indic_Serv_PC(t_policy_year = t_policy_year) "p.227 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {63.0, -100.0}, extent = {{10.0, -10.0}, {-10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular P_Indic_Serv_PC_1(x_vals = 0:200:1600, y_vals = {40, 300, 640, 1000, 1220, 1450, 1650, 1800, 2000}) "p.227 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {128.0, -80.0}, extent = {{10.0, -10.0}, {-10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular P_Indic_Serv_PC_2(x_vals = 0:200:1600, y_vals = {40, 300, 640, 1000, 1220, 1450, 1650, 1800, 2000}) "p.227 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {128.0, -120.0}, extent = {{10.0, -10.0}, {-10.0, 10.0}}, rotation = 0)));
        Modelica.Blocks.Math.Division Serv_Out_PC "p.232 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-110.0, 102.0}, extent = {{10.0, -10.0}, {-10.0, 10.0}}, rotation = -90)));
        SystemDynamics.Interfaces.MassInPort population "Population" annotation(
          Placement(visible = true, transformation(origin = {-210.0, 50.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-110.0, 20.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassInPort capital_util_fr "Capital utilization fraction" annotation(
          Placement(visible = true, transformation(origin = {-210.0, 110.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-110.0, 60.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassInPort industrial_output(unit = "dollar/yr") "Annual industrial output" annotation(
          Placement(visible = true, transformation(origin = {-210.0, -70.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-110.0, -20.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassInPort ind_out_pc(unit = "dollar/yr") "Per capita annual industrial output" annotation(
          Placement(visible = true, transformation(origin = {-210.0, -130.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-110.0, -60.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassOutPort serv_out_pc(unit = "dollar/yr") "Per capita annual expenditure in services" annotation(
          Placement(visible = true, transformation(origin = {210.0, 50.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {110.0, 50.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassOutPort service_capital(unit = "dollar") "Total capital invested in service sector" annotation(
          Placement(visible = true, transformation(origin = {210.0, -10.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {110.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassOutPort s_fioa_serv "Fraction of total investments allocated to the service sector" annotation(
          Placement(visible = true, transformation(origin = {210.0, -70.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {110.0, -50.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      equation
        connect(Service_Output.u1, capital_util_fr) annotation(
          Line(visible = true, points = {{-61.0, 86.0}, {-36.0, 86.0}, {-36.0, 130.0}, {-180.0, 130.0}, {-180.0, 110.0}, {-210.0, 110.0}}, color = {0, 0, 191}));
        connect(Service_Output.u3, Service_Capital.y1) annotation(
          Line(visible = true, points = {{-61.0, 74.0}, {-36.0, 74.0}, {-36.0, 38.25}, {-47.25, 38.25}}, color = {0, 0, 191}));
        connect(service_capital, Service_Capital.y2) annotation(
          Line(visible = true, points = {{210.0, -10.0}, {180.0, -10.0}, {180.0, 8.0}, {-48.75, 8.0}, {-48.75, 20.25}}, color = {0, 0, 191}));
        connect(Serv_Cap_Dep.u1, Service_Capital.y3) annotation(
          Line(visible = true, points = {{-6.0, -24.0}, {-6.0, -36.0}, {-60.0, -36.0}, {-60.0, 20.25}}, color = {0, 0, 191}));
        connect(P_Fr_IO_Al_Serv_1.y, S_FIOA_Serv.u1) annotation(
          Line(visible = true, points = {{-53.0, -60.0}, {-80.0, -60.0}, {-80.0, -76.0}, {-96.0, -76.0}}, color = {0, 0, 191}));
        connect(P_Fr_IO_Al_Serv_2.y, S_FIOA_Serv.u2) annotation(
          Line(visible = true, points = {{-53.0, -100.0}, {-80.0, -100.0}, {-80.0, -84.0}, {-96.0, -84.0}}, color = {0, 0, 191}));
        connect(P_Indic_Serv_PC_1.y, S_Indic_Serv_PC.u1) annotation(
          Line(visible = true, points = {{117.0, -80.0}, {90.0, -80.0}, {90.0, -96.0}, {72.0, -96.0}}, color = {0, 0, 191}));
        connect(P_Indic_Serv_PC_2.y, S_Indic_Serv_PC.u2) annotation(
          Line(visible = true, points = {{117.0, -120.0}, {90.0, -120.0}, {90.0, -104.0}, {72.0, -104.0}}, color = {0, 0, 191}));
        connect(P_Indic_Serv_PC_1.u, P_Indic_Serv_PC_2.u) annotation(
          Line(visible = true, points = {{136.0, -80.0}, {160.0, -80.0}, {160.0, -120.0}, {136.0, -120.0}}, color = {0, 0, 191}));
        connect(P_Indic_Serv_PC_2.u, ind_out_pc) annotation(
          Line(visible = true, points = {{136.0, -120.0}, {160.0, -120.0}, {160.0, -140.0}, {-180.0, -140.0}, {-180.0, -130.0}, {-210.0, -130.0}}, color = {0, 0, 191}));
        connect(S_Indic_Serv_PC.y, Div1.u2) annotation(
          Line(visible = true, points = {{54.0, -100.0}, {30.0, -100.0}, {30.0, -86.0}, {22.0, -86.0}}, color = {0, 0, 191}));
        connect(S_Avg_Life_Serv_Cap.y, Serv_Cap_Dep.u2) annotation(
          Line(visible = true, origin = {15.3333, -32.0}, points = {{18.6667, -4.0}, {-9.3333, -4.0}, {-9.3333, 8.0}}, color = {0, 0, 191}));
        connect(Div1.y, P_Fr_IO_Al_Serv_2.u) annotation(
          Line(visible = true, points = {{-1.0, -80.0}, {-10.0, -80.0}, {-10.0, -100.0}, {-34.0, -100.0}}, color = {0, 0, 191}));
        connect(Div1.y, P_Fr_IO_Al_Serv_1.u) annotation(
          Line(visible = true, points = {{-1.0, -80.0}, {-10.0, -80.0}, {-10.0, -60.0}, {-34.0, -60.0}}, color = {0, 0, 191}));
        connect(S_FIOA_Serv.y, s_fioa_serv) annotation(
          Line(visible = true, points = {{-114.0, -80.0}, {-130.0, -80.0}, {-130.0, -150.0}, {180.0, -150.0}, {180.0, -70.0}, {210.0, -70.0}}, color = {0, 0, 191}));
        connect(S_FIOA_Serv.y, Serv_Cap_Inv.u2) annotation(
          Line(visible = true, points = {{-114.0, -80.0}, {-130.0, -80.0}, {-130.0, -40.0}, {-100.0, -40.0}, {-100.0, -10.0}, {-111.6, -10.0}}, color = {0, 0, 191}));
        connect(Serv_Cap_Dep.y, Serv_Cap_Deprec.u) annotation(
          Line(visible = true, points = {{0.0, -1.0}, {0.0, 7.55}, {0.0, 7.55}, {0.0, 14.25}}, color = {0, 0, 191}));
        connect(Serv_Cap_Deprec.y1, Sink1.MassInPort1) annotation(
          Line(visible = true, origin = {23.25, 30.0}, points = {{-15.75, 0.0}, {15.75, 0.0}}, color = {95, 0, 191}));
        connect(Service_Capital.u2, Serv_Cap_Deprec.y) annotation(
          Line(visible = true, origin = {-25.5, 30.0}, points = {{-18.0, 0.0}, {18.0, 0.0}}, color = {95, 0, 191}));
        connect(Serv_Cap_Invest.y1, Service_Capital.u1) annotation(
          Line(visible = true, origin = {-94.5, 30.0}, points = {{-18.0, 0.0}, {18.0, 0.0}}, color = {95, 0, 191}));
        connect(Serv_Cap_Inv.y, Serv_Cap_Invest.u) annotation(
          Line(visible = true, origin = {-120.0, 6.325}, points = {{0.0, -7.925}, {0.0, 7.925}}, color = {0, 0, 191}));
        connect(Source1.MassInPort1, Serv_Cap_Invest.y) annotation(
          Line(visible = true, origin = {-143.25, 30.0}, points = {{-15.75, 0.0}, {15.75, 0.0}}, color = {95, 0, 191}));
        connect(S_Serv_Cap_Out_Ratio.y, Service_Output.u2) annotation(
          Line(visible = true, origin = {-36.0, 80.0}, points = {{25.0, 0.0}, {-25.0, 0.0}}, color = {0, 0, 191}));
        connect(Serv_Out_PC.u1, Service_Output.y) annotation(
          Line(visible = true, origin = {-95.6667, 83.3333}, points = {{-8.3333, 6.6667}, {-8.3333, -3.3333}, {16.6667, -3.3333}}, color = {0, 0, 191}));
        connect(Serv_Out_PC.y, serv_out_pc) annotation(
          Line(visible = true, points = {{-110.0, 113.0}, {-110.0, 120.0}, {180.0, 120.0}, {180.0, 50.0}, {210.0, 50.0}}, color = {0, 0, 191}));
        connect(Serv_Out_PC.u2, population) annotation(
          Line(visible = true, origin = {-147.3333, 63.3333}, points = {{31.3333, 26.6667}, {31.3333, -13.3333}, {-62.6667, -13.3333}}, color = {0, 0, 191}));
        connect(Serv_Out_PC.y, Div1.u1) annotation(
          Line(visible = true, points = {{-110.0, 113.0}, {-110.0, 120.0}, {80.0, 120.0}, {80.0, -74.0}, {22.0, -74.0}}, color = {0, 0, 191}));
        connect(Serv_Cap_Inv.u1, industrial_output) annotation(
          Line(points = {{-128.4, -10.0}, {-180.0, -10.0}, {-180.0, -70.0}, {-210.0, -70.0}}, color = {0, 0, 191}, visible = true));
        annotation(
          Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, fillColor = {170, 255, 170}, fillPattern = FillPattern.Solid, lineThickness = 1.0, extent = {{-100.0, -100.0}, {100.0, 100.0}}, radius = 0.5), Text(visible = true, origin = {0.1825, 50.0}, fillPattern = FillPattern.Solid, extent = {{-59.8175, -36.6918}, {59.8175, 36.6918}}, textString = "Service", fontSize = 102.0, fontName = "Arial"), Text(visible = true, origin = {-0.0, -50.0}, fillPattern = FillPattern.Solid, extent = {{-95.1836, -20.8986}, {95.1836, 20.8986}}, textString = "Investment", fontSize = 102.0, fontName = "Arial"), Text(visible = true, fillPattern = FillPattern.Solid, extent = {{-62.5202, -36.6918}, {62.5202, 36.6918}}, textString = "Sector", fontSize = 102.0, fontName = "Arial")}),
          Diagram(coordinateSystem(extent = {{-200.0, -160.0}, {200.0, 140.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{-11.0, -81.0}, {-9.0, -79.0}}), Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{159.0, -121.0}, {161.0, -119.0}}), Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{79.0, 119.0}, {81.0, 121.0}}), Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{-131.0, -81.0}, {-129.0, -79.0}})}),
          Documentation(info = "<html>
This model calculates the capital invested in the service sector. <p>
 
Whereas the earlier <font color=red><b>WORLD2</b></font> model lumped all capital investment into a single state variable from which it then split off the percentage of capital invested in the agricultural sector as a second state variable (a funny choice for a state variable, since percentages don't accumulate), the more modern <font color=red><b>WORLD3</b></font> model differentiates between capital invested in industry, capital invested in the service sector, capital invested in agriculture, and other capital investment. <p>
 
The service capital is measured in U.S. dollars.
</html>"));
      end Service_Sector_Investment;