      model Flu "Model of an influenza epidemic"
        output Real Non_inf_pop "Non-infected population";
        output Real Inf_pop "Infected population";
        output Real Sick_pop "Sick population";
        output Real Immune_pop "Immune population";
        SystemDynamics.Levels.Level Non_infected(x0 = 10000) annotation(
          Placement(visible = true, transformation(origin = {-140.0, -80.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.Rates.Rate_1 Infection annotation(
          Placement(visible = true, transformation(origin = {-71.0, -80.0}, extent = {{-21.0, -20.0}, {21.0, 20.0}}, rotation = 0)));
        SystemDynamics.Levels.Level Infected(x0 = 0) annotation(
          Placement(visible = true, transformation(origin = {0.0, -80.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.Rates.Rate_1 Incubation annotation(
          Placement(visible = true, transformation(origin = {71.0, -80.0}, extent = {{-21.0, -20.0}, {21.0, 20.0}}, rotation = 0)));
        SystemDynamics.Levels.Level Sick(x0 = 0) annotation(
          Placement(visible = true, transformation(origin = {140.0, -80.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.IntroductoryExamples.Influenza.Infection_Rate Infection_Rate1 annotation(
          Placement(visible = true, transformation(origin = {-97.0, -132.0}, extent = {{-19.0, -20.0}, {19.0, 20.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Prod_4 Prod_4_1 annotation(
          Placement(visible = true, transformation(origin = {-140.0, -140.0}, extent = {{20.0, 20.0}, {-20.0, -20.0}}, rotation = 90)));
        SystemDynamics.Auxiliary.Const Contacts(k = 15) annotation(
          Placement(visible = true, transformation(origin = {-180.0, -180.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Const Contraction(k = 0.25) annotation(
          Placement(visible = true, transformation(origin = {-140.0, -180.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.IntroductoryExamples.Influenza.Rate_equation Incubation_rate annotation(
          Placement(visible = true, transformation(origin = {60.0, -140.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Const Time_to_Breakdown(k = 4) annotation(
          Placement(visible = true, transformation(origin = {28.0, -180.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        Modelica.Blocks.Math.Add Contagious annotation(
          Placement(visible = true, transformation(origin = {57.0, -25.0}, extent = {{15.0, 15.0}, {-15.0, -15.0}}, rotation = -90)));
        Modelica.Blocks.Math.Division Perc_Infected annotation(
          Placement(visible = true, transformation(origin = {-85.0, -25.0}, extent = {{15.0, -15.0}, {-15.0, 15.0}}, rotation = 0)));
        Modelica.Blocks.Math.Add3 Total_Pop annotation(
          Placement(visible = true, transformation(origin = {-15.0, 35.0}, extent = {{15.0, -15.0}, {-15.0, 15.0}}, rotation = 0)));
        SystemDynamics.Levels.Level Immune(x0 = 0) annotation(
          Placement(visible = true, transformation(origin = {-20.0, 120.0}, extent = {{20.0, -20.0}, {-20.0, 20.0}}, rotation = 0)));
        SystemDynamics.Rates.Rate_1 Cure annotation(
          Placement(visible = true, transformation(origin = {80.0, 120.0}, extent = {{20.0, -20.0}, {-20.0, 20.0}}, rotation = 0)));
        SystemDynamics.IntroductoryExamples.Influenza.Rate_equation Cure_rate annotation(
          Placement(visible = true, transformation(origin = {110.0, 60.0}, extent = {{20.0, -20.0}, {-20.0, 20.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Const Sick_Duration(k = 2) annotation(
          Placement(visible = true, transformation(origin = {140.0, 20.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Const Immune_Period(k = 26) annotation(
          Placement(visible = true, transformation(origin = {-120.0, 32.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.Rates.Rate_1 Activation annotation(
          Placement(visible = true, transformation(origin = {-120.0, 120.0}, extent = {{20.0, -20.0}, {-20.0, 20.0}}, rotation = 0)));
        SystemDynamics.IntroductoryExamples.Influenza.Rate_equation Activation_rate annotation(
          Placement(visible = true, transformation(origin = {-80.0, 80.0}, extent = {{20.0, -20.0}, {-20.0, 20.0}}, rotation = 0)));
      equation
        connect(Infected.u2, Incubation.y) annotation(
          Line(visible = true, origin = {41.25, -80.0}, points = {{-19.25, 0.0}, {19.25, 0.0}}, color = {191, 0, 191}));
        connect(Incubation.y1, Sick.u1) annotation(
          Line(visible = true, origin = {99.75, -80.0}, points = {{-18.25, 0.0}, {18.25, 0.0}}, color = {191, 0, 191}));
        connect(Incubation_rate.y, Incubation.u) annotation(
          Line(visible = true, points = {{78.0, -140.0}, {90.0, -140.0}, {90.0, -110.0}, {71.0, -110.0}, {71.0, -101.0}}, color = {0, 0, 191}));
        connect(Contagious.y, Total_Pop.u2) annotation(
          Line(visible = true, origin = {39.0, 20.5}, points = {{18.0, -29.0}, {18.0, 14.5}, {-36.0, 14.5}}, color = {0, 0, 191}));
        connect(Contagious.y, Perc_Infected.u1) annotation(
          Line(visible = true, points = {{50.2972, -16.5}, {50.2972, -8.0}, {-20.0, -8.0}, {-20.0, -24.0}, {-73.7028, -24.0}}, color = {0, 0, 191}, origin = {6.7028, 8.0}));
        connect(Contagious.u1, Infected.y1) annotation(
          Line(visible = true, points = {{48.0, -43.0}, {48.0, -69.0}, {17.0, -69.0}}, color = {0, 0, 191}));
        connect(Contagious.u2, Sick.y) annotation(
          Line(visible = true, points = {{66.0, -43.0}, {66.0, -56.0}, {100.0, -56.0}, {100.0, -69.0}, {123.0, -69.0}}, color = {0, 0, 191}));
        connect(Prod_4_1.y, Infection_Rate1.u2) annotation(
          Line(visible = true, origin = {-120.05, -140.0}, points = {{-5.95, 0.0}, {5.95, 0.0}}, color = {0, 0, 191}));
        connect(Perc_Infected.y, Prod_4_1.u2) annotation(
          Line(visible = true, points = {{-101.5, -25.0}, {-188.0, -25.0}, {-188.0, -132.0}, {-151.2, -132.0}}, color = {0, 0, 191}));
        connect(Contraction.y, Prod_4_1.u4) annotation(
          Line(visible = true, points = {{-140.0, -166.0}, {-140.0, -154.0}}, color = {0, 0, 191}));
        connect(Contacts.y, Prod_4_1.u3) annotation(
          Line(visible = true, points = {{-180.0, -166.0}, {-180.0, -148.0}, {-151.2, -148.0}}, color = {0, 0, 191}));
        connect(Prod_4_1.u1, Non_infected.y3) annotation(
          Line(visible = true, points = {{-140.0, -126.0}, {-140.0, -93.0}}, color = {0, 0, 191}));
        connect(Total_Pop.u3, Non_infected.y1) annotation(
          Line(visible = true, points = {{3.0, 23.0}, {20.0, 23.0}, {20.0, -50.0}, {-100.0, -50.0}, {-100.0, -69.0}, {-123.0, -69.0}}, color = {0, 0, 191}));
        connect(Total_Pop.y, Perc_Infected.u2) annotation(
          Line(visible = true, points = {{-31.5, 35.0}, {-50.0, 35.0}, {-50.0, -34.0}, {-67.0, -34.0}}, color = {0, 0, 191}));
        connect(Incubation_rate.u1, Infected.y2) annotation(
          Line(visible = true, points = {{42.0, -132.0}, {15.0, -132.0}, {15.0, -93.0}}, color = {0, 0, 191}));
        connect(Time_to_Breakdown.y, Incubation_rate.u2) annotation(
          Line(visible = true, points = {{28.0, -166.0}, {28.0, -148.0}, {42.0, -148.0}}, color = {0, 0, 191}));
        connect(Infection_Rate1.u1, Non_infected.y2) annotation(
          Line(visible = true, points = {{-114.1, -124.0}, {-125.0, -124.0}, {-125.0, -93.0}}, color = {0, 0, 191}));
        connect(Infection_Rate1.y, Infection.u) annotation(
          Line(visible = true, points = {{-79.9, -132.0}, {-71.0, -132.0}, {-71.0, -101.0}}, color = {0, 0, 191}));
        connect(Non_infected.u2, Infection.y) annotation(
          Line(visible = true, points = {{-118.0, -80.0}, {-81.5, -80.0}}, color = {191, 0, 191}));
        connect(Infection.y1, Infected.u1) annotation(
          Line(visible = true, points = {{-60.5, -80.0}, {-22.0, -80.0}}, color = {191, 0, 191}));
        connect(Sick.u2, Cure.y) annotation(
          Line(visible = true, points = {{162.0, -80.0}, {180.0, -80.0}, {180.0, 120.0}, {90.0, 120.0}}, color = {191, 0, 191}));
        connect(Cure_rate.u1, Sick.y1) annotation(
          Line(visible = true, points = {{128.0, 68.0}, {166.0, 68.0}, {166.0, -69.0}, {157.0, -69.0}}, color = {0, 0, 191}));
        connect(Sick_Duration.y, Cure_rate.u2) annotation(
          Line(visible = true, points = {{140.0, 34.0}, {140.0, 52.0}, {128.0, 52.0}}, color = {0, 0, 191}));
        connect(Cure_rate.y, Cure.u) annotation(
          Line(visible = true, points = {{92.0, 60.0}, {80.0, 60.0}, {80.0, 99.0}}, color = {0, 0, 191}));
        connect(Cure.y1, Immune.u1) annotation(
          Line(visible = true, points = {{70.0, 120.0}, {2.0, 120.0}}, color = {191, 0, 191}));
        connect(Total_Pop.u1, Immune.y4) annotation(
          Line(visible = true, points = {{3.0, 47.0}, {20.0, 47.0}, {20.0, 88.0}, {-5.0, 88.0}, {-5.0, 107.0}}, color = {0, 0, 191}));
        connect(Immune_Period.y, Activation_rate.u2) annotation(
          Line(visible = true, points = {{-120.0, 46.0}, {-120.0, 56.0}, {-50.0, 56.0}, {-50.0, 72.0}, {-62.0, 72.0}}, color = {0, 0, 191}));
        connect(Activation_rate.y, Activation.u) annotation(
          Line(visible = true, points = {{-98.0, 80.0}, {-120.0, 80.0}, {-120.0, 99.0}}, color = {0, 0, 191}));
        connect(Activation_rate.u1, Immune.y2) annotation(
          Line(visible = true, points = {{-62.0, 88.0}, {-35.0, 88.0}, {-35.0, 107.0}}, color = {0, 0, 191}));
        connect(Activation.y1, Non_infected.u1) annotation(
          Line(visible = true, points = {{-130.0, 120.0}, {-180.0, 120.0}, {-180.0, -80.0}, {-162.0, -80.0}}, color = {191, 0, 191}));
        connect(Immune.u2, Activation.y) annotation(
          Line(visible = true, points = {{-42.0, 120.0}, {-110.0, 120.0}}, color = {191, 0, 191}));
        Non_inf_pop = Non_infected.y;
        Inf_pop = Infected.y;
        Sick_pop = Sick.y;
        Immune_pop = Immune.y;
        when time > 8.0 then
          reinit(Non_infected.Integrator1.y, 9999);
          reinit(Infected.Integrator1.y, 1);
        end when;
        annotation(
          Icon(coordinateSystem(extent = {{-100.0, -100.0}, {140.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, fillColor = {160, 160, 160}, fillPattern = FillPattern.Solid, extent = {{-100.0, -100.0}, {140.0, 100.0}}), Text(visible = true, origin = {2.8968, 10.4851}, lineColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{-64.2134, 12.5294}, {97.1032, 59.5149}}, textString = "Influenza", fontName = "Arial"), Text(visible = true, origin = {1.9076, -50.6957}, lineColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{-24.3826, -12.1913}, {45.7174, 6.0957}}, textString = "epidemic", fontName = "Arial"), Text(visible = true, origin = {-18.2479, -50.0}, lineColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{-68.1021, -0.0}, {141.0687, 51.3859}}, textString = "Outbreak of an influenza", fontName = "Arial")}),
          Diagram(coordinateSystem(extent = {{-220.0, -220.0}, {200.0, 160.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{54.0, -3.0}, {60.0, 3.0}})}),
          experiment(StopTime = 52, StartTime = 0.0, NumberOfIntervals = 1000, Algorithm = "dassl", Tolerance = 0.000001),
          experimentSetupOutput,
          Documentation(info = "<html>
The influenza model describes the outbreak of an influenza epidemic.  The model was adapted from the <font color=red><b>STELLA</b></font> manual. <p>
 
<hr> <p>
 
<b>References:</b> <p>
 
<ol>
<li> Richmond, B., S. Peterson, and P. Vescuso (1987), <i>An Academic User's Guide to STELLA</i>, High Performance Systems, Inc., Lyme, N.H.
</ol> <p>
 
<hr> <p>
 
Simulate the model across 52 time units and plot the four populations: <p>
<img src=\"modelica://SystemDynamics/Resources/Images/Influenza_1.png\">
</html>", revisions = ""));
      end Flu;