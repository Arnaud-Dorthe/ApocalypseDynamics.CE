    model Hair_Lynx_Interaction "Predator/prey model"
      output Real hare "Hare population";
      output Real lynx "Lynx population";
      SystemDynamics.Levels.Level Hare(x0 = 50000.0) annotation(
        Placement(visible = true, transformation(origin = {0.0, 50.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      SystemDynamics.Rates.Rate_1 Hare_Birth annotation(
        Placement(visible = true, transformation(origin = {-40.0, 50.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      SystemDynamics.Auxiliary.Gain hare_birth_factor(k = 1.25) annotation(
        Placement(visible = true, transformation(origin = {-22.0, 30.0}, extent = {{14.0, -10.0}, {-14.0, 10.0}}, rotation = 0)));
      SystemDynamics.Sources.Source Source1 annotation(
        Placement(visible = true, transformation(origin = {-70.0, 50.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      SystemDynamics.Auxiliary.Gain hare_density(k = 0.001) annotation(
        Placement(visible = true, transformation(origin = {20.0, 20.0}, extent = {{-14.0, -10.0}, {14.0, 10.0}}, rotation = 0)));
      SystemDynamics.Functions.Tabular Hares_Killed_Per_Lynx(x_vals = {0, 500, 1000}, y_vals = {0, 500, 500}) annotation(
        Placement(visible = true, transformation(origin = {53.0, 20.0}, extent = {{-18.0, -10.0}, {18.0, 10.0}}, rotation = 0)));
      SystemDynamics.Rates.Rate_1 Hare_Death annotation(
        Placement(visible = true, transformation(origin = {88.0, 50.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      SystemDynamics.Sources.Sink Sink1 annotation(
        Placement(visible = true, transformation(origin = {120.0, 50.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      SystemDynamics.Levels.Level Lynx(x0 = 1250) annotation(
        Placement(visible = true, transformation(origin = {0.0, -40.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      SystemDynamics.Rates.Rate_1 Lynx_Birth annotation(
        Placement(visible = true, transformation(origin = {-40.0, -40.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      SystemDynamics.Auxiliary.Gain lynx_birth_factor(k = 0.25) annotation(
        Placement(visible = true, transformation(origin = {-22.0, -60.0}, extent = {{14.0, -10.0}, {-14.0, 10.0}}, rotation = 0)));
      SystemDynamics.Sources.Source Source2 annotation(
        Placement(visible = true, transformation(origin = {-70.0, -40.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      SystemDynamics.Rates.Rate_2 Lynx_Death annotation(
        Placement(visible = true, transformation(origin = {60.0, -40.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      SystemDynamics.Auxiliary.Prod_2 prod_2_1 annotation(
        Placement(visible = true, transformation(origin = {64.0, -80.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      SystemDynamics.Functions.Tabular Lynx_Death_Fraction(y_vals = {0.94, 0.66, 0.4, 0.35, 0.3, 0.25, 0.2, 0.15, 0.1, 0.07, 0.05, 0.05}, x_vals = {0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 1000}) annotation(
        Placement(visible = true, transformation(origin = {53.0, -10.0}, extent = {{-18.0, -10.0}, {18.0, 10.0}}, rotation = 0)));
      SystemDynamics.Sources.Sink Sink2 annotation(
        Placement(visible = true, transformation(origin = {90.0, -40.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      Modelica.Blocks.Sources.Pulse Hunting(amplitude = 6000, width = 0.125, period = 100, startTime = 4) annotation(
        Placement(visible = true, transformation(origin = {30.0, -60.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      SystemDynamics.Auxiliary.Prod_2 prod_2_2 annotation(
        Placement(visible = true, transformation(origin = {88.0, 20.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
    equation
      connect(Lynx_Death.u, Hunting.y) annotation(
        Line(visible = true, points = {{56.0, -50.5}, {56.0, -60.0}, {41.0, -60.0}}, color = {0, 0, 191}));
      connect(prod_2_1.y, Lynx_Death.u1) annotation(
        Line(visible = true, points = {{64.0, -73.0}, {64.0, -50.5}}, color = {0, 0, 191}));
      connect(prod_2_2.u2, Lynx.y1) annotation(
        Line(visible = true, points = {{95.0, 20.0}, {100.0, 20.0}, {100.0, -26.0}, {14.0, -26.0}, {14.0, -34.5}, {8.5, -34.5}}, color = {0, 0, 191}));
      connect(prod_2_2.y, Hare_Death.u) annotation(
        Line(visible = true, points = {{88.0, 27.0}, {88.0, 39.5}}, color = {0, 0, 191}));
      connect(prod_2_2.u1, Hares_Killed_Per_Lynx.y) annotation(
        Line(visible = true, points = {{81.0, 20.0}, {72.8, 20.0}}, color = {0, 0, 191}));
      connect(Sink2.MassInPort1, Lynx_Death.y1) annotation(
        Line(visible = true, points = {{79.0, -40.0}, {65.0, -40.0}}, color = {95, 0, 191}));
      connect(Lynx_Death_Fraction.y, prod_2_1.u2) annotation(
        Line(visible = true, points = {{72.8, -10.0}, {110.0, -10.0}, {110.0, -80.0}, {71.0, -80.0}}, color = {0, 0, 191}));
      connect(Lynx_Death_Fraction.u, hare_density.y) annotation(
        Line(visible = true, points = {{38.6, -10.0}, {34.0, -10.0}, {34.0, 20.0}, {29.8, 20.0}}, color = {0, 0, 191}));
      connect(prod_2_1.u1, Lynx.y3) annotation(
        Line(visible = true, points = {{57.0, -80.0}, {0.0, -80.0}, {0.0, -46.5}}, color = {0, 0, 191}));
      connect(Lynx.u2, Lynx_Death.y) annotation(
        Line(visible = true, points = {{11.0, -40.0}, {55.0, -40.0}}, color = {95, 0, 191}));
      connect(Source2.MassInPort1, Lynx_Birth.y) annotation(
        Line(visible = true, points = {{-59.0, -40.0}, {-45.0, -40.0}}, color = {95, 0, 191}));
      connect(Lynx_Birth.y1, Lynx.u1) annotation(
        Line(visible = true, points = {{-35.0, -40.0}, {-11.0, -40.0}}, color = {95, 0, 191}));
      connect(lynx_birth_factor.y, Lynx_Birth.u) annotation(
        Line(visible = true, points = {{-31.8, -60.0}, {-40.0, -60.0}, {-40.0, -50.5}}, color = {0, 0, 191}));
      connect(lynx_birth_factor.u, Lynx.y4) annotation(
        Line(visible = true, points = {{-12.2, -60.0}, {-7.5, -60.0}, {-7.5, -46.5}}, color = {0, 0, 191}));
      connect(Sink1.MassInPort1, Hare_Death.y1) annotation(
        Line(visible = true, points = {{109.0, 50.0}, {93.0, 50.0}}, color = {95, 0, 191}));
      connect(hare_density.u, Hare.y3) annotation(
        Line(visible = true, points = {{10.2, 20.0}, {0.0, 20.0}, {0.0, 43.5}}, color = {0, 0, 191}));
      connect(Hare.u2, Hare_Death.y) annotation(
        Line(visible = true, points = {{11.0, 50.0}, {83.0, 50.0}}, color = {95, 0, 191}));
      connect(hare_density.y, Hares_Killed_Per_Lynx.u) annotation(
        Line(visible = true, points = {{29.8, 20.0}, {38.6, 20.0}}, color = {0, 0, 191}));
      connect(Source1.MassInPort1, Hare_Birth.y) annotation(
        Line(visible = true, points = {{-59.0, 50.0}, {-45.0, 50.0}}, color = {95, 0, 191}));
      connect(Hare_Birth.y1, Hare.u1) annotation(
        Line(visible = true, points = {{-35.0, 50.0}, {-11.0, 50.0}}, color = {95, 0, 191}));
      connect(hare_birth_factor.y, Hare_Birth.u) annotation(
        Line(visible = true, points = {{-31.8, 30.0}, {-40.0, 30.0}, {-40.0, 39.5}}, color = {0, 0, 191}));
      connect(hare_birth_factor.u, Hare.y4) annotation(
        Line(visible = true, points = {{-12.2, 30.0}, {-7.5, 30.0}, {-7.5, 43.5}}, color = {0, 0, 191}));
      hare = Hare.y;
      lynx = Lynx.y;
      annotation(
        Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {140.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{33.0, 19.0}, {35.0, 21.0}})}),
        experiment(StopTime = 60, Tolerance = 0.0000000001, Algorithm = "dassl"),
        experimentSetupOutput,
        Documentation(info = "<html>
The hare/lynx interaction model is a typical two-species predator/prey model.  This example has been borrowed from <font color=red><b>SystemDynamics 1.0</b></font>.  The original version of this example can be found in the <font color=red><b>STELLA</b></font> tutorial. <p>
 
<hr> <p>
 
<b>References:</b> <p>
 
<ol>
<li> Richmond, B., S. Peterson, and P. Vescuso (1987), <a href=\"http://www.amazon.com/ACADEMIC-USERS-GUIDE-STELLA/dp/B000RRMJHS/ref=sr_1_6/103-2487145-1208659?ie=UTF8&s=books&qid=1188791651&sr=1-6\">An Academic User's Guide to STELLA</a>, High Performance Systems, Inc., Lyme, N.H.
</ol> <p>
 
<hr> <p>
 
Simulate the model across 60 time units and plot the two animal populations against simulation time: <p>
<img src=\"modelica://SystemDynamics/Resources/Images/Hare_1.png\"> <p>
 
You need to reduce the accuracy to 1e-10 in order for the simulation to run correctly. <p>
 
Also plot the two population against each other: <p>
<img src=\"modelica://SystemDynamics/Resources/Images/Hare_2.png\"> <p>
 
You shall notice that the limit cycle is mildly unstable. <p>
 
The simulation results obtained are not exactly the same as with <font color=red><b>SystemDynamics 1.0</b></font>.  The reason is that the previous version used tabular interpolation functions with linear extrapolation, whereas the new version uses tabular interpolation functions without extrapolation capability (a more prudent approach).  In line with <font color=red><b>STELLA</b></font> philosophy, the support values of the two tabular functions were manually extended to reflect a <i>constant</i> rather than a <i>linear</i> extrapolation.
</html>", revisions = ""),
        Icon(coordinateSystem(extent = {{-100.0, -100.0}, {140.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, fillColor = {160, 160, 160}, fillPattern = FillPattern.Solid, extent = {{-100.0, -100.0}, {140.0, 100.0}}), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-82.0, 16.0}, {124.0, 76.0}}, textString = "Hare/Lynx interaction", fontName = "Arial"), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-32.0, -16.0}, {60.0, 8.0}}, textString = "predator/prey", fontName = "Arial"), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-28.0, 0.0}, {58.0, 30.0}}, textString = "two species", fontName = "Arial"), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-28.0, -34.0}, {54.0, -14.0}}, textString = "model", fontName = "Arial")}));
    end Hair_Lynx_Interaction;