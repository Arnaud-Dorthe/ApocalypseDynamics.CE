      block Industrial_Investment "Investments in the military/industrial sector"
        parameter Real industrial_capital_init(unit = "dollar") = 210000000000.0 "Initial industrial investment";
        parameter Real ind_out_pc_des(unit = "dollar/yr") = 400 "Desired annual industrial per capita output";
        parameter Real p_avg_life_ind_cap_1(unit = "yr") = 14 "Default average life of industrial capital";
        parameter Real p_avg_life_ind_cap_2(unit = "yr") = 14 "Controlled average life of industrial capital";
        parameter Real p_fioa_cons_const_1 = 0.43 "Default fraction of industrial output allocated to consumption";
        parameter Real p_fioa_cons_const_2 = 0.43 "Controlled fraction of industrial output allocated to consumption";
        parameter Real p_ind_cap_out_ratio_1(unit = "yr") = 3 "Default industrial capital output ratio";
        parameter Real t_ind_equil_time(unit = "yr") = 4000 "Year of industrial equilibrium";
        parameter Real t_policy_year(unit = "yr") = 4000 "Year of policy change";
        SystemDynamics.Levels.Level Industrial_Capital(x0 = industrial_capital_init) "p.218 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-60.0, -10.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = 0)));
        SystemDynamics.Rates.RRate Ind_Cap_Invest "p.222 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-120.0, -10.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = 0)));
        SystemDynamics.Rates.RRate Ind_Cap_Deprec "p.221 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {0.0, -10.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Prod_2 Ind_Cap_Inv "p.222 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-120.0, -50.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        Modelica.Blocks.Math.Division Ind_Cap_Dep "p.221 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {0.0, -49.0}, extent = {{-10.0, -11.0}, {10.0, 11.0}}, rotation = -270)));
        SystemDynamics.WorldDynamics.World3.Utilities.Industrial_Output Industrial_Output "p.216 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-70.0, 40.0}, extent = {{10.0, -10.0}, {-10.0, 10.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Utilities.S_Ind_Cap_Out_Ratio S_Ind_Cap_Out_Ratio(t_policy_year = t_policy_year, p_ind_cap_out_ratio_1 = p_ind_cap_out_ratio_1) "p.216 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-5.0, 40.0}, extent = {{10.0, -10.0}, {-10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Prod_3 P_Ind_Cap_Out_Ratio_2 annotation(
          Placement(visible = true, transformation(origin = {50.0, 40.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -270)));
        SystemDynamics.WorldDynamics.World3.Utilities.S_Avg_Life_Ind_Cap S_Avg_Life_Ind_Cap(t_policy_year = t_policy_year, p_avg_life_ind_cap_1 = p_avg_life_ind_cap_1, p_avg_life_ind_cap_2 = p_avg_life_ind_cap_2) "p.221 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {41.0, -70.0}, extent = {{10.0, -10.0}, {-10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Sources.Source Source1 annotation(
          Placement(visible = true, transformation(origin = {-170.0, -10.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Sources.Sink Sink1 annotation(
          Placement(visible = true, transformation(origin = {50.0, -10.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Utilities.FIOA_Ind FIOA_Ind "p.223 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-140.0, -75.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -270)));
        SystemDynamics.WorldDynamics.World3.Utilities.S_FIOA_Cons S_FIOA_Cons(t_ind_equil_time = t_ind_equil_time) "p.223 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-97.0, -110.0}, extent = {{10.0, -10.0}, {-10.0, 10.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Utilities.S_FIOA_Cons_Const S_FIOA_Cons_Const(p_fioa_cons_const_1 = p_fioa_cons_const_1, p_fioa_cons_const_2 = p_fioa_cons_const_2, t_policy_year = t_policy_year) "p.223 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-40.0, -100.0}, extent = {{10.0, -10.0}, {-10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular P_FIOA_Cons_Var(x_vals = 0:0.2:2, y_vals = {0.3, 0.32, 0.34, 0.36, 0.38, 0.43, 0.73, 0.77, 0.81, 0.82, 0.83}) "p.225 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-36.0, -130.0}, extent = {{10.0, -10.0}, {-10.0, 10.0}}, rotation = 0)));
        Modelica.Blocks.Math.Gain Gain1(k = 1 / ind_out_pc_des) annotation(
          Placement(visible = true, transformation(origin = {21.0, -130.0}, extent = {{10.0, -10.0}, {-10.0, 10.0}}, rotation = 0)));
        Modelica.Blocks.Math.Division Ind_Out_PC "p.214 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {70.0, -130.0}, extent = {{10.0, -10.0}, {-10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassInPort population "Population" annotation(
          Placement(visible = true, transformation(origin = {-110.0, -170.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -90), iconTransformation(origin = {-20.0, -110.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -270)));
        SystemDynamics.Interfaces.MassInPort s_fioa_serv "Fraction of total investments allocated to the service sector" annotation(
          Placement(visible = true, transformation(origin = {-170.0, -170.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -90), iconTransformation(origin = {-60.0, -110.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -270)));
        SystemDynamics.Interfaces.MassInPort s_fioa_agr "Fraction of total investments allocated to the agricultural sector" annotation(
          Placement(visible = true, transformation(origin = {-210.0, -130.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-110.0, -80.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassInPort s_fr_cap_al_obt_res "Fraction of capital allocated to resource use efficiency" annotation(
          Placement(visible = true, transformation(origin = {-210.0, -70.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-110.0, -40.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassInPort capital_util_fr "Capital utilization fraction" annotation(
          Placement(visible = true, transformation(origin = {-210.0, -10.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-110.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassInPort ppoll_tech_mult_icor_COPM "Technology induced reduction in persistent pollution release" annotation(
          Placement(visible = true, transformation(origin = {-210.0, 50.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-110.0, 40.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassInPort yield_tech_mult_icor_COYM "Technology induced relative enhancement of land yield" annotation(
          Placement(visible = true, transformation(origin = {-210.0, 110.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-110.0, 80.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassInPort ind_cap_out_ratio_2_ICOR2T "Industrial capital output ratio" annotation(
          Placement(visible = true, transformation(origin = {-170.0, 150.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 90), iconTransformation(origin = {-60.0, 110.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -90)));
        SystemDynamics.Interfaces.MassOutPort industrial_output(unit = "dollar/yr") "Annual industrial output" annotation(
          Placement(visible = true, transformation(origin = {210.0, 50.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {110.0, 21.707}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassOutPort industrial_capital(unit = "dollar") "Total capital invested in the military/industrial sector" annotation(
          Placement(visible = true, transformation(origin = {210.0, -10.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {110.0, -20.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassOutPort ind_out_pc(unit = "dollar/yr") "Per capita annual industrial output" annotation(
          Placement(visible = true, transformation(origin = {210.0, -70.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {110.0, -60.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Prod_2 Cons_Ind_Out annotation(
          Placement(visible = true, transformation(origin = {-100.0, -70.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -90)));
        Modelica.Blocks.Math.Division Cons_Ind_Out_PC annotation(
          Placement(visible = true, transformation(origin = {146.0, 110.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassOutPort cons_ind_out_pc1(unit = "dollar/yr") "Per capita general industrial output" annotation(
          Placement(visible = true, transformation(origin = {210.0, 110.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {110.0, 60.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      equation
        connect(P_FIOA_Cons_Var.y, S_FIOA_Cons.u2) annotation(
          Line(visible = true, points = {{-47.0, -130.0}, {-74.0, -130.0}, {-74.0, -114.0}, {-88.0, -114.0}}, color = {0, 0, 191}));
        connect(S_FIOA_Cons_Const.y, S_FIOA_Cons.u1) annotation(
          Line(visible = true, points = {{-49.0, -100.0}, {-74.0, -100.0}, {-74.0, -106.0}, {-88.0, -106.0}}, color = {0, 0, 191}));
        connect(FIOA_Ind.u1, s_fioa_agr) annotation(
          Line(visible = true, points = {{-146.0, -84.0}, {-146.0, -130.0}, {-210.0, -130.0}}, color = {0, 0, 191}));
        connect(FIOA_Ind.u3, S_FIOA_Cons.y) annotation(
          Line(visible = true, points = {{-134.0, -84.0}, {-134.0, -110.0}, {-106.0, -110.0}}, color = {0, 0, 191}));
        connect(industrial_capital, Industrial_Capital.y2) annotation(
          Line(visible = true, points = {{210.0, -10.0}, {160.0, -10.0}, {160.0, -32.0}, {-48.75, -32.0}, {-48.75, -19.75}}, color = {0, 0, 191}));
        connect(Industrial_Output.u4, Industrial_Capital.y1) annotation(
          Line(visible = true, points = {{-61.0, 34.0}, {-36.0, 34.0}, {-36.0, -1.75}, {-47.25, -1.75}}, color = {0, 0, 191}));
        connect(S_Ind_Cap_Out_Ratio.y, Industrial_Output.u3) annotation(
          Line(visible = true, points = {{-14.0, 40.0}, {-36.0, 40.0}, {-36.0, 38.0}, {-61.0, 38.0}}, color = {0, 0, 191}));
        connect(Industrial_Output.u2, capital_util_fr) annotation(
          Line(visible = true, points = {{-61.0, 42.0}, {-40.0, 42.0}, {-40.0, 90.0}, {-190.0, 90.0}, {-190.0, -10.0}, {-210.0, -10.0}}, color = {0, 0, 191}));
        connect(Industrial_Output.u1, s_fr_cap_al_obt_res) annotation(
          Line(visible = true, points = {{-61.0, 46.0}, {-44.0, 46.0}, {-44.0, 80.0}, {-186.0, 80.0}, {-186.0, -70.0}, {-210.0, -70.0}}, color = {0, 0, 191}));
        connect(Cons_Ind_Out.y, Cons_Ind_Out_PC.u1) annotation(
          Line(visible = true, points = {{-93.0, -70.0}, {-80.0, -70.0}, {-80.0, -78.0}, {0.0, -78.0}, {0.0, -90.0}, {110.0, -90.0}, {110.0, 116.0}, {134.0, 116.0}}, color = {0, 0, 191}));
        connect(Ind_Out_PC.u2, Cons_Ind_Out_PC.u2) annotation(
          Line(visible = true, points = {{82.0, -136.0}, {120.0, -136.0}, {120.0, 104.0}, {134.0, 104.0}}, color = {0, 0, 191}));
        connect(Ind_Cap_Dep.u2, S_Avg_Life_Ind_Cap.y) annotation(
          Line(visible = true, origin = {15.0667, -67.0}, points = {{-8.4667, 6.0}, {-8.4667, -3.0}, {16.9333, -3.0}}, color = {0, 0, 191}));
        connect(Ind_Out_PC.y, Gain1.u) annotation(
          Line(visible = true, origin = {46.0, -130.0}, points = {{13.0, 0.0}, {-13.0, 0.0}}, color = {0, 0, 191}));
        connect(Gain1.y, P_FIOA_Cons_Var.u) annotation(
          Line(visible = true, origin = {-9.0, -130.0}, points = {{19.0, 0.0}, {-19.0, 0.0}}, color = {0, 0, 191}));
        connect(S_FIOA_Cons.y, Cons_Ind_Out.u2) annotation(
          Line(visible = true, points = {{-106.0, -110.0}, {-120.0, -110.0}, {-120.0, -86.0}, {-100.0, -86.0}, {-100.0, -77.0}}, color = {0, 0, 191}));
        connect(Industrial_Output.y, Cons_Ind_Out.u1) annotation(
          Line(visible = true, origin = {-93.0, 5.6667}, points = {{14.0, 34.3333}, {-7.0, 34.3333}, {-7.0, -68.6667}}, color = {0, 0, 191}));
        connect(FIOA_Ind.u2, s_fioa_serv) annotation(
          Line(visible = true, points = {{-140.0, -84.0}, {-140.0, -150.0}, {-170.0, -150.0}, {-170.0, -170.0}}, color = {0, 0, 191}));
        connect(Ind_Cap_Inv.u1, FIOA_Ind.y) annotation(
          Line(visible = true, points = {{-127.0, -50.0}, {-140.0, -50.0}, {-140.0, -66.0}}, color = {0, 0, 191}));
        connect(Industrial_Output.y, Ind_Cap_Inv.u2) annotation(
          Line(visible = true, points = {{-79.0, 40.0}, {-100.0, 40.0}, {-100.0, -50.0}, {-113.0, -50.0}}, color = {0, 0, 191}));
        connect(Ind_Cap_Inv.y, Ind_Cap_Invest.u) annotation(
          Line(visible = true, origin = {-120.0, -34.375}, points = {{0.0, -8.625}, {0.0, 8.625}}, color = {0, 0, 191}));
        connect(Sink1.MassInPort1, Ind_Cap_Deprec.y1) annotation(
          Line(visible = true, origin = {23.25, -10.0}, points = {{15.75, 0.0}, {-15.75, 0.0}}, color = {95, 0, 191}));
        connect(Ind_Cap_Dep.y, Ind_Cap_Deprec.u) annotation(
          Line(visible = true, points = {{0.0, -38.0}, {0.0, -33.5}, {0.0, -33.5}, {0.0, -25.75}}, color = {0, 0, 191}));
        connect(Industrial_Capital.u2, Ind_Cap_Deprec.y) annotation(
          Line(visible = true, origin = {-25.5, -10.0}, points = {{-18.0, 0.0}, {18.0, 0.0}}, color = {95, 0, 191}));
        connect(Ind_Cap_Dep.u1, Industrial_Capital.y3) annotation(
          Line(visible = true, points = {{-6.6, -61.0}, {-6.6, -70.0}, {-60.0, -70.0}, {-60.0, -19.75}}, color = {0, 0, 191}));
        connect(Ind_Cap_Invest.y1, Industrial_Capital.u1) annotation(
          Line(visible = true, origin = {-94.5, -10.0}, points = {{-18.0, 0.0}, {18.0, 0.0}}, color = {95, 0, 191}));
        connect(Source1.MassInPort1, Ind_Cap_Invest.y) annotation(
          Line(visible = true, origin = {-143.25, -10.0}, points = {{-15.75, 0.0}, {15.75, 0.0}}, color = {95, 0, 191}));
        connect(Industrial_Output.y, industrial_output) annotation(
          Line(visible = true, points = {{-79.0, 40.0}, {-100.0, 40.0}, {-100.0, 20.0}, {160.0, 20.0}, {160.0, 50.0}, {210.0, 50.0}}, color = {0, 0, 191}));
        connect(Ind_Out_PC.u1, Industrial_Output.y) annotation(
          Line(visible = true, points = {{82.0, -124.0}, {90.0, -124.0}, {90.0, 20.0}, {-100.0, 20.0}, {-100.0, 40.0}, {-79.0, 40.0}}, color = {0, 0, 191}));
        connect(P_Ind_Cap_Out_Ratio_2.y, S_Ind_Cap_Out_Ratio.u) annotation(
          Line(visible = true, origin = {23.5, 40.0}, points = {{19.5, 0.0}, {-19.5, 0.0}}, color = {0, 0, 191}));
        connect(P_Ind_Cap_Out_Ratio_2.u3, ppoll_tech_mult_icor_COPM) annotation(
          Line(visible = true, points = {{50.0, 47.0}, {50.0, 100.0}, {-194.0, 100.0}, {-194.0, 50.0}, {-210.0, 50.0}}, color = {0, 0, 191}));
        connect(P_Ind_Cap_Out_Ratio_2.u2, yield_tech_mult_icor_COYM) annotation(
          Line(visible = true, points = {{57.0, 40.0}, {70.0, 40.0}, {70.0, 110.0}, {-210.0, 110.0}}, color = {0, 0, 191}));
        connect(P_Ind_Cap_Out_Ratio_2.u1, ind_cap_out_ratio_2_ICOR2T) annotation(
          Line(visible = true, points = {{50.0, 33.0}, {50.0, 26.0}, {90.0, 26.0}, {90.0, 120.0}, {-170.0, 120.0}, {-170.0, 150.0}}, color = {0, 0, 191}));
        connect(Cons_Ind_Out_PC.y, cons_ind_out_pc1) annotation(
          Line(visible = true, origin = {183.5, 110.0}, points = {{-26.5, 0.0}, {26.5, 0.0}}, color = {0, 0, 191}));
        connect(Ind_Out_PC.u2, population) annotation(
          Line(points = {{82.0, -136.0}, {90.0, -136.0}, {90.0, -150.0}, {-110.0, -150.0}, {-110.0, -170.0}}, color = {0, 0, 191}, visible = true));
        connect(Ind_Out_PC.y, ind_out_pc) annotation(
          Line(points = {{59.0, -130.0}, {52.0, -130.0}, {52.0, -160.0}, {160.0, -160.0}, {160.0, -70.0}, {210.0, -70.0}}, color = {0, 0, 191}, visible = true));
        annotation(
          Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, fillColor = {170, 255, 170}, fillPattern = FillPattern.Solid, lineThickness = 1.0, extent = {{-100.0, -100.0}, {100.0, 100.0}}, radius = 0.5), Text(visible = true, origin = {0.0, 30.0}, fillPattern = FillPattern.Solid, extent = {{-86.8431, -36.6918}, {86.8431, 36.6918}}, textString = "Industrial", fontSize = 102.0, fontName = "Arial"), Text(visible = true, origin = {-0.0, -30.0}, fillPattern = FillPattern.Solid, extent = {{-92.5404, -36.6918}, {92.5404, 36.6918}}, textString = "Investment", fontSize = 102.0, fontName = "Arial")}),
          Diagram(coordinateSystem(extent = {{-200.0, -160.0}, {200.0, 140.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{-101.0, 19.0}, {-99.0, 21.0}}), Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{89.0, 19.0}, {91.0, 21.0}}), Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{51.0, -131.0}, {53.0, -129.0}}), Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{-121.0, -111.0}, {-119.0, -109.0}}), Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{-101.0, -51.0}, {-99.0, -49.0}}), Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{89.0, -137.0}, {91.0, -135.0}})}),
          Documentation(info = "<html>
This model calculates the capital invested in industry. <p>
 
Whereas the earlier <font color=red><b>WORLD2</b></font> model lumped all capital investment into a single state variable from which it then split off the percentage of capital invested in the agricultural sector as a second state variable (a funny choice for a state variable, since percentages don't accumulate), the more modern <font color=red><b>WORLD3</b></font> model differentiates between capital invested in industry, capital invested in the service sector, capital invested in agriculture, and other capital investment. <p>
 
The industrial capital is measured in U.S. dollars.
</html>"));
      end Industrial_Investment;