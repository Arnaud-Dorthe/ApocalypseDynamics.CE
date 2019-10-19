      block Life_Expectancy "Life expectancy"
        parameter Real hlth_serv_impact_del(unit = "yr") = 20 "Health services impact delay";
        parameter Real life_expect_norm(unit = "yr") = 28 "Normal life expectancy";
        parameter Real subsist_food_pc(unit = "kg/yr") = 230 "Available per capita food";
        SystemDynamics.Auxiliary.Prod_5 Life_Expectancy annotation(
          Placement(visible = true, transformation(origin = {140.0, -10.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -90)));
        SystemDynamics.Interfaces.MassOutPort life_expectancy(unit = "yr") "Average life expectancy of human population" annotation(
          Placement(visible = true, transformation(origin = {210.0, -10.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {110.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Const Life_Expect_Norm(k = life_expect_norm) annotation(
          Placement(visible = true, transformation(origin = {140.0, 103.0}, extent = {{-10.0, 10.0}, {10.0, -10.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Utilities.Lifet_Mult_Hlth_Serv Lifet_Mult_Hlth_Serv "p.76 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {85.0, 80.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular Lifet_Mlt_Hlth_Serv_1(x_vals = {0, 20, 40, 60, 80, 100, 200}, y_vals = {1, 1.1, 1.4, 1.6, 1.7, 1.8, 1.8}) "p.76 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {10.0, 100.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular Lifet_Mlt_Hlth_Serv_2(x_vals = {0, 20, 40, 60, 80, 100, 200}, y_vals = {1, 1.5, 1.9, 2, 2, 2, 2}) "p.76 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {10.0, 60.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Functions.SMTH1 Eff_Hlth_Serv_PC(averaging_time(unit = "yr") = hlth_serv_impact_del, smooth_init(unit = "dollar/yr") = 0) "p.71 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-58.0, 80.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular Hlth_Serv_Al_PC(x_vals = 0:250:2000, y_vals = {0, 20, 50, 95, 140, 175, 200, 220, 230}) "p.70 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-114.0, 80.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassInPort serv_out_pc(unit = "dollar/yr") "Per capita annual expenditure in services" annotation(
          Placement(visible = true, transformation(origin = {-210.0, 110.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-110.0, 80.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Utilities.Lifet_Mlt_Crowd Lifet_Mlt_Crowd "p.90 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {81.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular Crowd_Mult_Ind(x_vals = 0:200:1600, y_vals = {0.5, 0.05, -0.1, -0.08, -0.02, 0.05, 0.1, 0.15, 0.2}) "p.90 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {10.0, 20.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular Fr_Pop_Urban(x_vals = 0:2000000000.0:16000000000.0, y_vals = {0, 0.2, 0.4, 0.5, 0.58, 0.65, 0.72, 0.78, 0.8}) "p.88 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {10.0, -20.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassInPort ind_out_pc(unit = "dollar/yr") "Per capita annual industrial output" annotation(
          Placement(visible = true, transformation(origin = {-210.0, 50.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-110.0, 40.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassInPort population "Population" annotation(
          Placement(visible = true, transformation(origin = {-210.0, -10.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-110.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular Lifet_Mlt_Food(x_vals = 0:5, y_vals = {0, 1, 1.43, 1.5, 1.5, 1.5}) "p.66 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {10.0, -60.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        Modelica.Blocks.Math.Gain Gain1(k = 1 / subsist_food_pc) annotation(
          Placement(visible = true, transformation(origin = {-51.0, -60.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassInPort food_pc(unit = "kg/yr") "Per capita annually consumed food" annotation(
          Placement(visible = true, transformation(origin = {-210.0, -70.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-110.0, -40.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular Lifet_Mlt_PPoll(x_vals = 0:10:100, y_vals = {1, 0.99, 0.97, 0.95, 0.9, 0.85, 0.75, 0.65, 0.55, 0.4, 0.2}) "p.94 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {10.0, -100.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassInPort ppoll_index "Persistent pollution index" annotation(
          Placement(visible = true, transformation(origin = {-210.0, -130.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-110.0, -80.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      equation
        connect(Life_Expect_Norm.y, Life_Expectancy.u1) annotation(
          Line(visible = true, origin = {140.0, 46.5}, points = {{0.0, 49.5}, {0.0, -49.5}}, color = {0, 0, 191}));
        connect(Lifet_Mlt_Hlth_Serv_1.y, Lifet_Mult_Hlth_Serv.u1) annotation(
          Line(visible = true, points = {{21.0, 100.0}, {50.0, 100.0}, {50.0, 84.0}, {76.0, 84.0}}, color = {0, 0, 191}));
        connect(Lifet_Mlt_Hlth_Serv_2.y, Lifet_Mult_Hlth_Serv.u2) annotation(
          Line(visible = true, points = {{21.0, 60.0}, {50.0, 60.0}, {50.0, 76.0}, {76.0, 76.0}}, color = {0, 0, 191}));
        connect(Lifet_Mult_Hlth_Serv.y, Life_Expectancy.u2) annotation(
          Line(visible = true, points = {{94.0, 80.0}, {120.0, 80.0}, {120.0, -5.4}, {135.0, -5.4}}, color = {0, 0, 191}));
        connect(Lifet_Mlt_Food.y, Life_Expectancy.u4) annotation(
          Line(visible = true, points = {{21.0, -60.0}, {120.0, -60.0}, {120.0, -14.6}, {135.0, -14.6}}, color = {0, 0, 191}));
        connect(Lifet_Mlt_PPoll.y, Life_Expectancy.u5) annotation(
          Line(visible = true, origin = {100.3333, -72.3333}, points = {{-79.3333, -27.6667}, {39.6667, -27.6667}, {39.6667, 55.3333}}, color = {0, 0, 191}));
        connect(Lifet_Mlt_Crowd.y, Life_Expectancy.u3) annotation(
          Line(visible = true, points = {{90.0, 0.0}, {110.0, 0.0}, {110.0, -10.0}, {133.0, -10.0}}, color = {0, 0, 191}));
        connect(Life_Expectancy.y, life_expectancy) annotation(
          Line(visible = true, origin = {178.5, -10.0}, points = {{-31.5, 0.0}, {31.5, 0.0}}, color = {0, 0, 191}));
        connect(Crowd_Mult_Ind.y, Lifet_Mlt_Crowd.u1) annotation(
          Line(visible = true, points = {{21.0, 20.0}, {50.0, 20.0}, {50.0, 4.0}, {72.0, 4.0}}, color = {0, 0, 191}));
        connect(Fr_Pop_Urban.y, Lifet_Mlt_Crowd.u2) annotation(
          Line(visible = true, points = {{21.0, -20.0}, {50.0, -20.0}, {50.0, -4.0}, {72.0, -4.0}}, color = {0, 0, 191}));
        connect(Gain1.u, food_pc) annotation(
          Line(visible = true, points = {{-63.0, -60.0}, {-180.0, -60.0}, {-180.0, -70.0}, {-210.0, -70.0}}, color = {0, 0, 191}));
        connect(Gain1.y, Lifet_Mlt_Food.u) annotation(
          Line(visible = true, origin = {-19.0, -60.0}, points = {{-21.0, 0.0}, {21.0, 0.0}}, color = {0, 0, 191}));
        connect(Lifet_Mlt_PPoll.u, ppoll_index) annotation(
          Line(visible = true, points = {{2.0, -100.0}, {-180.0, -100.0}, {-180.0, -130.0}, {-210.0, -130.0}}, color = {0, 0, 191}));
        connect(Fr_Pop_Urban.u, population) annotation(
          Line(visible = true, points = {{2.0, -20.0}, {-180.0, -20.0}, {-180.0, -10.0}, {-210.0, -10.0}}, color = {0, 0, 191}));
        connect(Crowd_Mult_Ind.u, ind_out_pc) annotation(
          Line(visible = true, points = {{2.0, 20.0}, {-180.0, 20.0}, {-180.0, 50.0}, {-210.0, 50.0}}, color = {0, 0, 191}));
        connect(Eff_Hlth_Serv_PC.y, Lifet_Mlt_Hlth_Serv_2.u) annotation(
          Line(visible = true, points = {{-47.0, 80.0}, {-30.0, 80.0}, {-30.0, 60.0}, {2.0, 60.0}}, color = {0, 0, 191}));
        connect(Eff_Hlth_Serv_PC.y, Lifet_Mlt_Hlth_Serv_1.u) annotation(
          Line(visible = true, points = {{-47.0, 80.0}, {-30.0, 80.0}, {-30.0, 100.0}, {2.0, 100.0}}, color = {0, 0, 191}));
        connect(Hlth_Serv_Al_PC.y, Eff_Hlth_Serv_PC.u) annotation(
          Line(visible = true, origin = {-86.0, 80.0}, points = {{-17.0, 0.0}, {17.0, 0.0}}, color = {0, 0, 191}));
        connect(Hlth_Serv_Al_PC.u, serv_out_pc) annotation(
          Line(visible = true, points = {{-122.0, 80.0}, {-180.0, 80.0}, {-180.0, 110.0}, {-210.0, 110.0}}, color = {0, 0, 191}));
        annotation(
          Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, fillColor = {170, 255, 170}, fillPattern = FillPattern.Solid, lineThickness = 1.0, extent = {{-100.0, -100.0}, {100.0, 100.0}}, radius = 0.5), Text(visible = true, origin = {0.0, 30.0}, fillPattern = FillPattern.Solid, extent = {{-47.3724, -36.6918}, {47.3724, 36.6918}}, textString = "Life", fontSize = 102.0, fontName = "Arial"), Text(visible = true, origin = {-0.0, -30.0}, fillPattern = FillPattern.Solid, extent = {{-95.2722, -36.6918}, {95.2722, 36.6918}}, textString = "Expectancy", fontSize = 102.0, fontName = "Arial")}),
          Diagram(coordinateSystem(extent = {{-200.0, -160.0}, {200.0, 140.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{-31.0, 79.0}, {-29.0, 81.0}})}),
          Documentation(info = "<html>
This model computes the average life expectancy of the human inhabitants of this planet as a function of their living conditions. <p>
 
The life expectancy is measured in numbers of years. <p>
 
This model is described on p.61 of <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>.
</html>"));
      end Life_Expectancy;