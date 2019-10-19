      block Human_Fertility "Human fertility"
        parameter Real des_compl_fam_size_norm = 3.8 "Desired normal complete family size";
        parameter Real hlth_serv_impact_del(unit = "yr") = 20 "Health service impact delay";
        parameter Real income_expect_avg_time(unit = "yr") = 3 "Income expected average time";
        parameter Real lifet_perc_del(unit = "yr") = 20 "Perceived life-time delay";
        parameter Real max_tot_fert_norm = 12 "Normal maximal total fertility";
        parameter Real social_adj_del(unit = "yr") = 20 "Social adjustment delay";
        parameter Real t_fert_cont_eff_time(unit = "yr") = 4000 "Year of continued fertility change";
        parameter Real t_zero_pop_grow_time(unit = "yr") = 4000 "Time to zero population growth";
        SystemDynamics.Interfaces.MassInPort ind_out_pc(unit = "dollar/yr") "Per capita annual industrial output" annotation(
          Placement(visible = true, transformation(origin = {-210.0, -80.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-110.0, -50.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Functions.SMTH1 Avg_Ind_Out_PC(averaging_time(unit = "yr") = income_expect_avg_time, smooth_init(unit = "dollar/yr") = 43.3) "p.122 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-125.0, -100.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Utilities.Fam_Income_Expect Fam_Income_Expect "p.122 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-65.0, -96.1504}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular Fam_Resp_To_Soc_Norm(x_vals = (-0.2):0.1:0.2, y_vals = {0.5, 0.6, 0.7, 0.85, 1}) "p.122 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-4.3835, -96.1504}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Functions.SMTH3 Del_Ind_Out_PC(averaging_time(unit = "yr") = social_adj_del, smooth_init(unit = "dollar/yr") = 0) "p.119 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-125.0, -60.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular Soc_Fam_Size_Norm(x_vals = 0:200:800, y_vals = {1.25, 0.94, 0.715, 0.59, 0.5}) "p.119 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-67.0, -60.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Utilities.Des_Compl_Fam_Size Des_Compl_Fam_Size(t_zero_pop_grow_time = t_zero_pop_grow_time, des_compl_fam_size_norm = des_compl_fam_size_norm) "p.113 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {72.0, -80.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassInPort life_expectancy(unit = "yr") "Average life expectancy of human population" annotation(
          Placement(visible = true, transformation(origin = {-210.0, -10.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-110.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Functions.SMTH3 Perc_Life_Expectancy(averaging_time(unit = "yr") = lifet_perc_del, smooth_init(unit = "yr") = 0) "p.112 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-125.0, -20.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular Compl_Mlt_Perc_Lifet(x_vals = 0:10:90, y_vals = {3, 2.1, 1.6, 1.4, 1.3, 1.2, 1.1, 1.05, 1, 1}) "p.112 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-67.0, -20.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Prod_2 Des_Tot_Fert "p.107 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-10.0, -30.0}, extent = {{-12.0, -12.0}, {12.0, 12.0}}, rotation = -90)));
        SystemDynamics.Functions.Tabular Fecundity_Mult(x_vals = 0:10:90, y_vals = {0, 0.2, 0.4, 0.6, 0.7, 0.75, 0.79, 0.84, 0.87, 0.87}) "p.104 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-124.8043, 20.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        Modelica.Blocks.Math.Gain Max_Tot_Fert(k = max_tot_fert_norm) "p.104 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-50.0, 20.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Utilities.Need_For_Fert_Cont Need_For_Fert_Cont "p.131 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {41.5, -24.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular Fr_Serv_Al_Fert_Cont(x_vals = 0:2:10, y_vals = {0, 0.005, 0.015, 0.025, 0.03, 0.035}) "p.132 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {99.0, -24.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassInPort serv_out_pc(unit = "dollar/yr") "Per capita annual expenditure in services" annotation(
          Placement(visible = true, transformation(origin = {-210.0, 60.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-110.0, 50.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Prod_2 Fert_Cont_Al_PC "p.132 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-140.0, 60.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Functions.SMTH3 Fert_Cont_Facil_PC(averaging_time(unit = "yr") = hlth_serv_impact_del, smooth_init(unit = "dollar/yr") = 0) "p.133 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-113.0, 90.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular Fert_Cont_Eff_Table(y_vals = {0.75, 0.85, 0.9, 0.95, 0.98, 0.99, 1, 1}, x_vals = {0, 0.5, 1, 1.5, 2, 2.5, 3, 15}) "p.133 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-63.0, 90.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Utilities.Fert_Cont_Eff Fert_Cont_Eff(t_fert_cont_eff_time = t_fert_cont_eff_time) "p.133 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-6.0, 90.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Utilities.Total_Fertility Total_Fertility "p.97 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {120.0, 100.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassOutPort total_fertility "Average human fertility" annotation(
          Placement(visible = true, transformation(origin = {210.0, -10.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {110.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      equation
        connect(Fam_Income_Expect.u1, ind_out_pc) annotation(
          Line(visible = true, points = {{-74.0, -92.1504}, {-100.0, -92.1504}, {-100.0, -80.0}, {-210.0, -80.0}}, color = {0, 0, 191}));
        connect(Des_Compl_Fam_Size.u2, Fam_Resp_To_Soc_Norm.y) annotation(
          Line(visible = true, points = {{63.0, -84.0}, {40.0, -84.0}, {40.0, -96.1504}, {6.6165, -96.1504}}, color = {0, 0, 191}));
        connect(Fam_Resp_To_Soc_Norm.u, Fam_Income_Expect.y) annotation(
          Line(visible = true, origin = {-34.1917, -96.1504}, points = {{21.8083, 0.0}, {-21.8083, 0.0}}, color = {0, 0, 191}));
        connect(Fam_Income_Expect.u2, Avg_Ind_Out_PC.y) annotation(
          Line(visible = true, points = {{-74.0, -100.1504}, {-100.0, -100.0}, {-100.0, -100.0}, {-114.0, -100.0}}, color = {0, 0, 191}));
        connect(Max_Tot_Fert.u, Fecundity_Mult.y) annotation(
          Line(visible = true, origin = {-87.9022, 20.0}, points = {{25.9022, 0.0}, {-25.9022, 0.0}}, color = {0, 0, 191}));
        connect(Fecundity_Mult.u, life_expectancy) annotation(
          Line(visible = true, points = {{-132.8043, 20.0}, {-150.0, 20.0}, {-150.0, -10.0}, {-210.0, -10.0}}, color = {0, 0, 191}));
        connect(Fr_Serv_Al_Fert_Cont.y, Fert_Cont_Al_PC.u2) annotation(
          Line(visible = true, points = {{110.0, -24.0}, {140.0, -24.0}, {140.0, 60.0}, {-133.0, 60.0}}, color = {0, 0, 191}));
        connect(Fr_Serv_Al_Fert_Cont.u, Need_For_Fert_Cont.y) annotation(
          Line(visible = true, origin = {70.75, -24.0}, points = {{20.25, 0.0}, {-20.25, 0.0}}, color = {0, 0, 191}));
        connect(Need_For_Fert_Cont.u1, Max_Tot_Fert.y) annotation(
          Line(visible = true, points = {{32.5, -20.0}, {10.0, -20.0}, {10.0, 20.0}, {-39.0, 20.0}}, color = {0, 0, 191}));
        connect(Des_Tot_Fert.y, Need_For_Fert_Cont.u2) annotation(
          Line(visible = true, origin = {21.975, -29.0}, points = {{-23.575, -1.0}, {6.525, -1.0}, {6.525, 1.0}, {10.525, 1.0}}, color = {0, 0, 191}));
        connect(Soc_Fam_Size_Norm.y, Des_Compl_Fam_Size.u1) annotation(
          Line(visible = true, points = {{-56.0, -60.0}, {40.0, -60.0}, {40.0, -76.0}, {63.0, -76.0}}, color = {0, 0, 191}));
        connect(Des_Compl_Fam_Size.y, Des_Tot_Fert.u2) annotation(
          Line(visible = true, points = {{81.0, -80.0}, {110.0, -80.0}, {110.0, -50.0}, {-10.0, -50.0}, {-10.0, -38.4}}, color = {0, 0, 191}));
        connect(Soc_Fam_Size_Norm.u, Del_Ind_Out_PC.y) annotation(
          Line(visible = true, origin = {-94.5, -60.0}, points = {{19.5, 0.0}, {-19.5, 0.0}}, color = {0, 0, 191}));
        connect(Compl_Mlt_Perc_Lifet.y, Des_Tot_Fert.u1) annotation(
          Line(visible = true, points = {{-56.0, -20.0}, {-30.0, -20.0}, {-30.0, -10.0}, {-10.0, -10.0}, {-10.0, -21.6}}, color = {0, 0, 191}));
        connect(Compl_Mlt_Perc_Lifet.u, Perc_Life_Expectancy.y) annotation(
          Line(visible = true, origin = {-94.5, -20.0}, points = {{19.5, 0.0}, {-19.5, 0.0}}, color = {0, 0, 191}));
        connect(Avg_Ind_Out_PC.u, ind_out_pc) annotation(
          Line(visible = true, points = {{-136.0, -100.0}, {-150.0, -100.0}, {-150.0, -80.0}, {-210.0, -80.0}}, color = {0, 0, 191}));
        connect(Del_Ind_Out_PC.u, ind_out_pc) annotation(
          Line(visible = true, points = {{-136.0, -60.0}, {-150.0, -60.0}, {-150.0, -80.0}, {-210.0, -80.0}}, color = {0, 0, 191}));
        connect(Perc_Life_Expectancy.u, life_expectancy) annotation(
          Line(visible = true, points = {{-136.0, -20.0}, {-150.0, -20.0}, {-150.0, -10.0}, {-210.0, -10.0}}, color = {0, 0, 191}));
        connect(Max_Tot_Fert.y, Total_Fertility.u2) annotation(
          Line(visible = true, points = {{-39.0, 20.0}, {80.0, 20.0}, {80.0, 100.0}, {111.0, 100.0}}, color = {0, 0, 191}));
        connect(Des_Tot_Fert.y, Total_Fertility.u3) annotation(
          Line(visible = true, points = {{-1.6, -30.0}, {10.0, -30.0}, {10.0, -40.0}, {150.0, -40.0}, {150.0, 70.0}, {90.0, 70.0}, {90.0, 94.0}, {111.0, 94.0}}, color = {0, 0, 191}));
        connect(Fert_Cont_Eff.y, Total_Fertility.u1) annotation(
          Line(visible = true, points = {{3.0, 90.0}, {70.0, 90.0}, {70.0, 106.0}, {111.0, 106.0}}, color = {0, 0, 191}));
        connect(Total_Fertility.y, total_fertility) annotation(
          Line(visible = true, points = {{129.0, 100.0}, {180.0, 100.0}, {180.0, -10.0}, {210.0, -10.0}}, color = {0, 0, 191}));
        connect(Fert_Cont_Eff.u, Fert_Cont_Eff_Table.y) annotation(
          Line(visible = true, origin = {-33.5, 90.0}, points = {{18.5, 0.0}, {-18.5, 0.0}}, color = {0, 0, 191}));
        connect(Fert_Cont_Eff_Table.u, Fert_Cont_Facil_PC.y) annotation(
          Line(visible = true, origin = {-86.5, 90.0}, points = {{15.5, 0.0}, {-15.5, 0.0}}, color = {0, 0, 191}));
        connect(Fert_Cont_Facil_PC.u, Fert_Cont_Al_PC.y) annotation(
          Line(visible = true, origin = {-134.6667, 82.3333}, points = {{10.6667, 7.6667}, {-5.3333, 7.6667}, {-5.3333, -15.3333}}, color = {0, 0, 191}));
        connect(Fert_Cont_Al_PC.u1, serv_out_pc) annotation(
          Line(visible = true, origin = {-178.5, 60.0}, points = {{31.5, 0.0}, {-31.5, 0.0}}, color = {0, 0, 191}));
        annotation(
          Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, fillColor = {170, 255, 170}, fillPattern = FillPattern.Solid, lineThickness = 1.0, extent = {{-100.0, -100.0}, {100.0, 100.0}}, radius = 0.5), Text(visible = true, origin = {-0.0, 30.0}, fillPattern = FillPattern.Solid, extent = {{-65.7919, -36.6918}, {65.7919, 36.6918}}, textString = "Human", fontSize = 102.0, fontName = "Arial"), Text(visible = true, origin = {0.0, -30.0}, fillPattern = FillPattern.Solid, extent = {{-65.0807, -36.6918}, {65.0807, 36.6918}}, textString = "Fertility", fontSize = 102.0, fontName = "Arial")}),
          Diagram(coordinateSystem(extent = {{-200.0, -160.0}, {200.0, 140.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{-151.0, -81.0}, {-149.0, -79.0}}), Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{-151.0, -11.0}, {-149.0, -9.0}}), Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{9.0, 19.0}, {11.0, 21.0}}), Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{9.0, -31.0}, {11.0, -29.0}})}),
          Documentation(info = "<html>
This model estimates the human fertility factor used by the population dynamics model. <p>
 
The human fertility factor is dimensionless.
</html>"),
          experiment(StopTime = 200),
          experimentSetupOutput);
      end Human_Fertility;