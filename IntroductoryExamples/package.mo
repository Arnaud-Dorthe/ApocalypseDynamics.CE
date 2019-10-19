  package IntroductoryExamples "Introductory example codes of the System Dynamics methodology"
    extends Modelica.Icons.Example;

    model Gilpin "Gilpin population dynamics model"
      output Real x1 "Prey_1 population";
      output Real x2 "Prey_2 population";
      output Real x3 "Predator population";
      SystemDynamics.Sources.Source Source1 annotation(
        Placement(visible = true, transformation(origin = {-170.0, 100.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      SystemDynamics.Levels.Level Prey_1(x0 = 100) annotation(
        Placement(visible = true, transformation(origin = {-80.0, 100.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
      SystemDynamics.Sources.Sink Sink1 annotation(
        Placement(visible = true, transformation(origin = {10.0, 100.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      SystemDynamics.Sources.Source Source2 annotation(
        Placement(visible = true, transformation(origin = {50.0, 100.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      SystemDynamics.Levels.Level Prey_2(x0 = 100) annotation(
        Placement(visible = true, transformation(origin = {140.0, 100.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
      SystemDynamics.Sources.Sink Sink2 annotation(
        Placement(visible = true, transformation(origin = {230.0, 100.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      SystemDynamics.Rates.Rate_3 Death_1 annotation(
        Placement(visible = true, transformation(origin = {-30.0, 100.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
      SystemDynamics.Rates.Rate_1 Birth_2 annotation(
        Placement(visible = true, transformation(origin = {90.0, 100.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
      SystemDynamics.Rates.Rate_3 Death_2 annotation(
        Placement(visible = true, transformation(origin = {188.0, 100.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
      SystemDynamics.Auxiliary.Prod_3 Prod_3_1 annotation(
        Placement(visible = true, transformation(origin = {-30.0, 50.0}, extent = {{-16.0, -16.0}, {16.0, 16.0}}, rotation = 0)));
      SystemDynamics.Auxiliary.Const k1(k = 0.001) annotation(
        Placement(visible = true, transformation(origin = {0.0, 23.0}, extent = {{-20.0, -19.0}, {20.0, 19.0}}, rotation = 0)));
      SystemDynamics.Auxiliary.Prod_3 Prod_3_2 annotation(
        Placement(visible = true, transformation(origin = {188.0, 51.0}, extent = {{-16.0, -15.0}, {16.0, 15.0}}, rotation = 0)));
      SystemDynamics.Auxiliary.Const k2(k = 0.001) annotation(
        Placement(visible = true, transformation(origin = {220.0, 23.0}, extent = {{-20.0, -19.0}, {20.0, 19.0}}, rotation = 0)));
      SystemDynamics.Auxiliary.Prod_3 Prod_3_3 annotation(
        Placement(visible = true, transformation(origin = {-80.0, 160.0}, extent = {{-16.0, -16.0}, {16.0, 16.0}}, rotation = -450)));
      SystemDynamics.Auxiliary.Const k3(k = 0.001) annotation(
        Placement(visible = true, transformation(origin = {-120.0, 160.0}, extent = {{20.0, -20.0}, {-20.0, 20.0}}, rotation = -90)));
      SystemDynamics.Auxiliary.Prod_3 Prod_3_4 annotation(
        Placement(visible = true, transformation(origin = {189.0, 160.0}, extent = {{15.0, 16.0}, {-15.0, -16.0}}, rotation = -90)));
      SystemDynamics.Auxiliary.Const k4(k = 0.0015) annotation(
        Placement(visible = true, transformation(origin = {232.0, 160.0}, extent = {{20.0, -20.0}, {-20.0, 20.0}}, rotation = 90)));
      SystemDynamics.Levels.Level Predator(x0 = 100) annotation(
        Placement(visible = true, transformation(origin = {40.0, -70.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
      SystemDynamics.Rates.Rate_1 Death_P annotation(
        Placement(visible = true, transformation(origin = {100.0, -70.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
      SystemDynamics.Rates.Rate_2 Birth_P annotation(
        Placement(visible = true, transformation(origin = {-21.0, -70.0}, extent = {{-19.0, -20.0}, {19.0, 20.0}}, rotation = 0)));
      SystemDynamics.Sources.Source Source3 annotation(
        Placement(visible = true, transformation(origin = {-70.0, -70.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      SystemDynamics.Sources.Sink Sink3 annotation(
        Placement(visible = true, transformation(origin = {150.0, -70.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      SystemDynamics.Auxiliary.Prod_3 Prod_3_5 annotation(
        Placement(visible = true, transformation(origin = {-80.0, -16.0}, extent = {{-16.0, -14.0}, {16.0, 14.0}}, rotation = -90)));
      SystemDynamics.Auxiliary.Const k5(k = 0.01) annotation(
        Placement(visible = true, transformation(origin = {-120.0, -16.0}, extent = {{20.0, -20.0}, {-20.0, 20.0}}, rotation = -90)));
      SystemDynamics.Auxiliary.Prod_3 Prod_3_6 annotation(
        Placement(visible = true, transformation(origin = {140.0, -16.0}, extent = {{-16.0, -14.0}, {16.0, 14.0}}, rotation = -90)));
      SystemDynamics.Auxiliary.Const k6(k = 0.001) annotation(
        Placement(visible = true, transformation(origin = {100.0, -16.0}, extent = {{20.0, -20.0}, {-20.0, 20.0}}, rotation = -90)));
      SystemDynamics.Auxiliary.Prod_3 Prod_3_7 annotation(
        Placement(visible = true, transformation(origin = {-55.0, -146.0}, extent = {{-15.0, -14.0}, {15.0, 14.0}}, rotation = -90)));
      SystemDynamics.Auxiliary.Const k7(k = 0.005) annotation(
        Placement(visible = true, transformation(origin = {-100.0, -146.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = -90)));
      SystemDynamics.Auxiliary.Prod_3 Prod_3_8 annotation(
        Placement(visible = true, transformation(origin = {85.0, -145.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = 450)));
      SystemDynamics.Auxiliary.Const k8(k = 0.0005) annotation(
        Placement(visible = true, transformation(origin = {130.0, -145.0}, extent = {{20.0, -19.0}, {-20.0, 19.0}}, rotation = 90)));
      SystemDynamics.Rates.Rate_1 Birth_1 annotation(
        Placement(visible = true, transformation(origin = {-130.0, 100.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
    equation
      connect(Prod_3_8.u1, Predator.y3) annotation(
        Line(visible = true, points = {{85.0, -155.5}, {85.0, -166.0}, {40.0, -166.0}, {40.0, -83.0}}, color = {0, 0, 191}));
      connect(k8.y, Prod_3_8.u2) annotation(
        Line(visible = true, origin = {106.1, -145.0}, points = {{10.6, 0.0}, {-10.6, 0.0}}, color = {0, 0, 191}));
      connect(Prod_3_8.y, Birth_P.u1) annotation(
        Line(visible = true, origin = {15.9, -127.0}, points = {{58.6, -18.0}, {-29.3, -18.0}, {-29.3, 36.0}}, color = {0, 0, 191}));
      connect(Prod_3_8.u3, Prey_2.y3) annotation(
        Line(visible = true, points = {{85.0, -134.5}, {85.0, -120.0}, {180.0, -120.0}, {180.0, 10.0}, {140.0, 10.0}, {140.0, 87.0}}, color = {0, 0, 191}));
      connect(Birth_1.u, Prey_1.y4) annotation(
        Line(visible = true, points = {{-130.0, 79.0}, {-130.0, 70.0}, {-95.0, 70.0}, {-95.0, 87.0}}, color = {0, 0, 191}));
      connect(Prey_1.u1, Birth_1.y1) annotation(
        Line(visible = true, origin = {-111.0, 100.0}, points = {{9.0, 0.0}, {-9.0, 0.0}}, color = {191, 0, 191}));
      connect(Birth_1.y, Source1.MassInPort1) annotation(
        Line(visible = true, origin = {-149.5, 100.0}, points = {{9.5, 0.0}, {-9.5, 0.0}}, color = {191, 0, 191}));
      connect(k3.y, Prod_3_3.u2) annotation(
        Line(visible = true, points = {{-106.0, 160.0}, {-91.2, 160.0}}, color = {0, 0, 191}));
      connect(k5.y, Prod_3_5.u2) annotation(
        Line(visible = true, points = {{-106.0, -16.0}, {-99.0, -16.0}, {-99.0, -16.0}, {-89.8, -16.0}}, color = {0, 0, 191}));
      connect(k6.y, Prod_3_6.u2) annotation(
        Line(visible = true, points = {{114.0, -16.0}, {121.4, -16.0}, {121.4, -16.0}, {130.2, -16.0}}, color = {0, 0, 191}));
      connect(Prod_3_7.u3, Predator.y4) annotation(
        Line(visible = true, points = {{-55.0, -156.5}, {-55.0, -166.0}, {25.0, -166.0}, {25.0, -83.0}}, color = {0, 0, 191}));
      connect(k7.y, Prod_3_7.u2) annotation(
        Line(visible = true, points = {{-86.0, -146.0}, {-64.8, -146.0}}, color = {0, 0, 191}));
      connect(Prod_3_7.u1, Prey_1.y3) annotation(
        Line(visible = true, points = {{-55.0, -135.5}, {-55.0, -120.0}, {-160.0, -120.0}, {-160.0, 30.0}, {-80.0, 30.0}, {-80.0, 87.0}}, color = {0, 0, 191}));
      connect(Prod_3_7.y, Birth_P.u) annotation(
        Line(visible = true, points = {{-45.2, -146.0}, {-28.6, -146.0}, {-28.6, -91.0}}, color = {0, 0, 191}));
      connect(Prod_3_5.y, Death_1.u2) annotation(
        Line(visible = true, points = {{-70.2, -16.0}, {20.0, -16.0}, {20.0, 70.0}, {-22.0, 70.0}, {-22.0, 79.0}}, color = {0, 0, 191}));
      connect(Prod_3_5.u3, Predator.y) annotation(
        Line(visible = true, points = {{-80.0, -27.2}, {-80.0, -40.0}, {14.0, -40.0}, {14.0, -59.0}, {23.0, -59.0}}, color = {0, 0, 191}));
      connect(Prod_3_5.u1, Prey_1.y3) annotation(
        Line(visible = true, points = {{-80.0, -4.8}, {-80.0, 87.0}}, color = {0, 0, 191}));
      connect(Prod_3_6.u3, Predator.y1) annotation(
        Line(visible = true, points = {{140.0, -27.2}, {140.0, -40.0}, {70.0, -40.0}, {70.0, -59.0}, {57.0, -59.0}}, color = {0, 0, 191}));
      connect(Prod_3_6.y, Death_2.u2) annotation(
        Line(visible = true, points = {{149.8, -16.0}, {240.0, -16.0}, {240.0, 72.0}, {196.0, 72.0}, {196.0, 79.0}}, color = {0, 0, 191}));
      connect(Prod_3_6.u1, Prey_2.y3) annotation(
        Line(visible = true, points = {{140.0, -4.8}, {140.0, 87.0}}, color = {0, 0, 191}));
      connect(Prod_3_4.u3, Prey_2.y1) annotation(
        Line(visible = true, points = {{189.0, 170.5}, {189.0, 180.0}, {164.0, 180.0}, {164.0, 111.0}, {157.0, 111.0}}, color = {0, 0, 191}));
      connect(k4.y, Prod_3_4.u2) annotation(
        Line(visible = true, points = {{218.0, 160.0}, {200.2, 160.0}}, color = {0, 0, 191}));
      connect(Death_2.u, Prod_3_4.y) annotation(
        Line(visible = true, points = {{180.0, 79.0}, {180.0, 72.0}, {168.0, 72.0}, {168.0, 160.0}, {177.8, 160.0}}, color = {0, 0, 191}));
      connect(Prod_3_4.u1, Prey_1.y1) annotation(
        Line(visible = true, points = {{189.0, 149.5}, {189.0, 140.0}, {-58.0, 140.0}, {-58.0, 111.0}, {-63.0, 111.0}}, color = {0, 0, 191}));
      connect(Prod_3_3.y, Death_1.u) annotation(
        Line(visible = true, points = {{-68.8, 160.0}, {-50.0, 160.0}, {-50.0, 70.0}, {-38.0, 70.0}, {-38.0, 79.0}}, color = {0, 0, 191}));
      connect(Prod_3_3.u1, Prey_2.y) annotation(
        Line(visible = true, points = {{-80.0, 171.2}, {-80.0, 180.0}, {116.0, 180.0}, {116.0, 111.0}, {123.0, 111.0}}, color = {0, 0, 191}));
      connect(Prod_3_3.u3, Prey_1.y) annotation(
        Line(visible = true, points = {{-80.0, 148.8}, {-80.0, 140.0}, {-108.0, 140.0}, {-108.0, 111.0}, {-97.0, 111.0}}, color = {0, 0, 191}));
      connect(Birth_2.u, Prey_2.y4) annotation(
        Line(visible = true, points = {{90.0, 79.0}, {90.0, 72.0}, {125.0, 72.0}, {125.0, 87.0}}, color = {0, 0, 191}));
      connect(Birth_2.y1, Prey_2.u1) annotation(
        Line(visible = true, points = {{100.0, 100.0}, {118.0, 100.0}}, color = {191, 0, 191}));
      connect(Death_P.u, Predator.y2) annotation(
        Line(visible = true, points = {{100.0, -91.0}, {100.0, -106.0}, {55.0, -106.0}, {55.0, -83.0}}, color = {0, 0, 191}));
      connect(Source3.MassInPort1, Birth_P.y) annotation(
        Line(visible = true, points = {{-59.0, -70.0}, {-30.5, -70.0}}, color = {191, 0, 191}));
      connect(Birth_P.y1, Predator.u1) annotation(
        Line(visible = true, points = {{-11.5, -70.0}, {18.0, -70.0}}, color = {191, 0, 191}));
      connect(Predator.u2, Death_P.y) annotation(
        Line(visible = true, points = {{62.0, -70.0}, {90.0, -70.0}}, color = {191, 0, 191}));
      connect(Death_P.y1, Sink3.MassInPort1) annotation(
        Line(visible = true, points = {{110.0, -70.0}, {139.0, -70.0}}, color = {191, 0, 191}));
      connect(Prod_3_2.u2, Prey_2.y2) annotation(
        Line(visible = true, points = {{188.0, 40.5}, {188.0, 30.0}, {155.0, 30.0}, {155.0, 87.0}}, color = {0, 0, 191}));
      connect(Prod_3_2.u1, Prey_2.y2) annotation(
        Line(visible = true, points = {{176.8, 51.0}, {155.0, 51.0}, {155.0, 87.0}}, color = {0, 0, 191}));
      connect(Prod_3_2.y, Death_2.u1) annotation(
        Line(visible = true, points = {{188.0, 61.5}, {188.0, 79.0}}, color = {0, 0, 191}));
      connect(k2.y, Prod_3_2.u3) annotation(
        Line(visible = true, points = {{220.0, 36.3}, {220.0, 51.0}, {199.2, 51.0}}, color = {0, 0, 191}));
      connect(Death_1.y1, Sink1.MassInPort1) annotation(
        Line(visible = true, points = {{-20.0, 100.0}, {-1.0, 100.0}}, color = {191, 0, 191}));
      connect(Birth_2.y, Source2.MassInPort1) annotation(
        Line(visible = true, points = {{80.0, 100.0}, {61.0, 100.0}}, color = {191, 0, 191}));
      connect(Prey_1.u2, Death_1.y) annotation(
        Line(visible = true, points = {{-58.0, 100.0}, {-40.0, 100.0}}, color = {191, 0, 191}));
      connect(Prod_3_1.u2, Prey_1.y2) annotation(
        Line(visible = true, points = {{-30.0, 38.8}, {-30.0, 30.0}, {-65.0, 30.0}, {-65.0, 87.0}}, color = {0, 0, 191}));
      connect(Prod_3_1.u1, Prey_1.y2) annotation(
        Line(visible = true, points = {{-41.2, 50.0}, {-65.0, 50.0}, {-65.0, 87.0}}, color = {0, 0, 191}));
      connect(k1.y, Prod_3_1.u3) annotation(
        Line(visible = true, points = {{0.0, 36.3}, {0.0, 50.0}, {-18.8, 50.0}}, color = {0, 0, 191}));
      connect(Prod_3_1.y, Death_1.u1) annotation(
        Line(visible = true, points = {{-30.0, 61.2}, {-30.0, 79.0}}, color = {0, 0, 191}));
      connect(Death_2.y1, Sink2.MassInPort1) annotation(
        Line(visible = true, points = {{198.0, 100.0}, {219.0, 100.0}}, color = {127, 0, 255}));
      connect(Prey_2.u2, Death_2.y) annotation(
        Line(visible = true, points = {{162.0, 100.0}, {178.0, 100.0}}, color = {127, 0, 255}));
      x1 = Prey_1.y;
      x2 = Prey_2.y;
      x3 = Predator.y;
      annotation(
        Diagram(coordinateSystem(extent = {{-200.0, -200.0}, {260.0, 200.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{138.0, 8.0}, {142.0, 12.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{-82.0, 28.0}, {-78.0, 32.0}}), Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{-67.0, 48.0}, {-63.0, 52.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{153.0, 49.0}, {157.0, 53.0}})}),
        experiment(StopTime = 5000, Tolerance = 0.00000000001, StartTime = 0.0, Algorithm = "dassl"),
        experimentSetupOutput,
        Documentation(info = "<html>
The Gilpin model is a model to describe and analyze the natural occurrence of chaotic motion in population dynamics. <p>
 
<hr> <p>
 
<b>References:</b> <p>
 
<ol>
<li> Cellier, F.E. (1991), <a href=\"http://www.amazon.com/Continuous-System-Modeling-Fran%C3%A7ois-Cellier/dp/0387975020\">Continuous System Modeling</a>, Springer-Verlag, New York, ISBN: 0-387-97502-0, 755p.
<li> Gilpin, M.E. (1979), \"Spiral Chaos in a Predator-Prey Model,\" <i>The American Naturalist</i>, <b>113</b>, pp.306-308.
</ol> <p>
 
<hr> <p>
 
Simulate the model across 5000 time units and plot the three populations: <p>
<img src=\"modelica://SystemDynamics/Resources/Images/Gilpin_1.png\"> <p>
 
You need to reduce the accuracy to 1e-10 in order for the simulation to run correctly.
</html>", revisions = ""),
        Icon(coordinateSystem(extent = {{-200.0, -200.0}, {260.0, 200.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, fillColor = {192, 192, 192}, fillPattern = FillPattern.Solid, extent = {{-200.0, -200.0}, {260.0, 200.0}}), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-94.0, 60.0}, {154.0, 114.0}}, textString = "Gilpin's", fontName = "Arial"), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-150.0, -44.0}, {212.0, 56.0}}, textString = "Population Dynamics Model", fontName = "Arial"), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-76.0, -72.0}, {132.0, -10.0}}, textString = "with Spiral Chaos", fontName = "Arial")}));
    end Gilpin;

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

    package Influenza "Model of an influenza epidemic"
      extends Modelica.Icons.Example annotation(
        preferedView = "info",
        Documentation(info = "<html>
The influenza model describes the outbreak of an influenza epidemic.  The model was adapted from the <font color=red><b>STELLA</b></font> manual. <p>
 
<hr> <p>
 
<b>References:</b> <p>
 
<ol>
<li> Richmond, B., S. Peterson, and P. Vescuso (1987), <i>An Academic User's Guide to STELLA</i>, High Performance Systems, Inc., Lyme, N.H.
</ol> <p>
 
<hr> <p>
  </html>", revisions = ""));

      block Infection_Rate "Non-linear infection rate model"
        extends Interfaces.Nonlin_2;
        output Real P_ni "Noninfected population";
        output Real R_con "Contraction rate";
        output Real R_inf "Infection rate";
      equation
        P_ni = u1;
        R_con = u2;
        R_inf = noEvent(min([R_con, P_ni]));
        y = R_inf;
        annotation(
          Documentation(info = "<html>
Non-linear infection rate model.
</html>"));
      end Infection_Rate;

      block Rate_equation "Non-linear function describing the rate equations"
        extends Interfaces.Nonlin_2;
      equation
        y = u1 / u2;
        annotation(
          Documentation(info = "<html>
Non-linear function describing the rate equations.
</html>"));
      end Rate_equation;

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
    end Influenza;

    model Sugar_Cane "Model of osmosis process in sugar cane"
      output Real Water_conc_in "Water concentration inside sugar cane";
      output Real Water_conc_out "Water concentration outside sugar cane";
      output Real Sucr_conc_in "Sugar concentration inside sugar cane";
      output Real Sucr_conc_out "Sugar concentration outside sugar cane";
      output Real Vol_in "Volume inside sugar cane";
      output Real Vol_out "Volume outside sugar cane";
      SystemDynamics.Sources.Source Source1 annotation(
        Placement(visible = true, transformation(origin = {128.0, 120.0}, extent = {{10.0, -10.0}, {-10.0, 10.0}}, rotation = 0)));
      SystemDynamics.Rates.Rate_1 Sucr_Gen annotation(
        Placement(visible = true, transformation(origin = {99.0, 120.0}, extent = {{15.0, -16.0}, {-15.0, 16.0}}, rotation = 0)));
      SystemDynamics.Auxiliary.Const C1(k = 0) annotation(
        Placement(visible = true, transformation(origin = {99.0, 79.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = 0)));
      SystemDynamics.Levels.Level Sucrose_Inside(x0 = 1) annotation(
        Placement(visible = true, transformation(origin = {58.0, 120.0}, extent = {{20.0, -20.0}, {-20.0, 20.0}}, rotation = 0)));
      SystemDynamics.Sources.Sink Sink1 annotation(
        Placement(visible = true, transformation(origin = {-112.0, 120.0}, extent = {{10.0, -10.0}, {-10.0, 10.0}}, rotation = 0)));
      SystemDynamics.Rates.Rate_1 Sucr_Depl annotation(
        Placement(visible = true, transformation(origin = {-85.0, 120.0}, extent = {{15.0, -16.0}, {-15.0, 16.0}}, rotation = 0)));
      SystemDynamics.Levels.Level Sucrose_Outside(x0 = 0) annotation(
        Placement(visible = true, transformation(origin = {-42.0, 120.0}, extent = {{20.0, -20.0}, {-20.0, 20.0}}, rotation = 0)));
      SystemDynamics.Rates.Rate_1 Diffusion annotation(
        Placement(visible = true, transformation(origin = {9.0, 120.0}, extent = {{15.0, -16.0}, {-15.0, 16.0}}, rotation = 0)));
      SystemDynamics.Auxiliary.Const C2(k = 0) annotation(
        Placement(visible = true, transformation(origin = {-85.0, 79.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = 0)));
      SystemDynamics.Sources.Source Source2 annotation(
        Placement(visible = true, transformation(origin = {-112.0, -80.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      SystemDynamics.Rates.Rate_1 Water_Gen annotation(
        Placement(visible = true, transformation(origin = {-81.0, -80.0}, extent = {{-15.0, -16.0}, {15.0, 16.0}}, rotation = 0)));
      SystemDynamics.Auxiliary.Const C3(k = 0) annotation(
        Placement(visible = true, transformation(origin = {-81.0, -121.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = 0)));
      SystemDynamics.Levels.Level Water_Outside(x0 = 4) annotation(
        Placement(visible = true, transformation(origin = {-42.0, -80.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
      SystemDynamics.Rates.Rate_1 Osmosis annotation(
        Placement(visible = true, transformation(origin = {7.0, -80.0}, extent = {{-15.0, -16.0}, {15.0, 16.0}}, rotation = 0)));
      SystemDynamics.Levels.Level Water_Inside(x0 = 1) annotation(
        Placement(visible = true, transformation(origin = {58.0, -80.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
      SystemDynamics.Rates.Rate_1 Water_Depl annotation(
        Placement(visible = true, transformation(origin = {97.0, -80.0}, extent = {{-15.0, -16.0}, {15.0, 16.0}}, rotation = 0)));
      SystemDynamics.Sources.Sink Sink2 annotation(
        Placement(visible = true, transformation(origin = {128.0, -80.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      SystemDynamics.Auxiliary.Const C4(k = 0) annotation(
        Placement(visible = true, transformation(origin = {97.0, -123.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = 0)));
      Modelica.Blocks.Math.Add Vol_Outside annotation(
        Placement(visible = true, transformation(origin = {-112.0, 20.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      Modelica.Blocks.Math.Add Vol_Inside annotation(
        Placement(visible = true, transformation(origin = {128.0, 20.0}, extent = {{10.0, -10.0}, {-10.0, 10.0}}, rotation = 0)));
      Modelica.Blocks.Math.Division Sucr_Conc_Out annotation(
        Placement(visible = true, transformation(origin = {-72.0, 40.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      Modelica.Blocks.Math.Division Water_Conc_Out annotation(
        Placement(visible = true, transformation(origin = {-72.0, 0.0}, extent = {{-10.0, 10.0}, {10.0, -10.0}}, rotation = 0)));
      Modelica.Blocks.Math.Division Sucr_Conc_In annotation(
        Placement(visible = true, transformation(origin = {88.0, 40.0}, extent = {{10.0, -10.0}, {-10.0, 10.0}}, rotation = 0)));
      Modelica.Blocks.Math.Division Water_Conc_In annotation(
        Placement(visible = true, transformation(origin = {88.0, 0.0}, extent = {{10.0, 10.0}, {-10.0, -10.0}}, rotation = 0)));
      SystemDynamics.Auxiliary.Const Perm_H2O(k = 0.5) annotation(
        Placement(visible = true, transformation(origin = {37.0, -139.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = 0)));
      Modelica.Blocks.Math.Add Water_Grad(k2 = -1) annotation(
        Placement(visible = true, transformation(origin = {8.0, -40.0}, extent = {{10.0, -10.0}, {-10.0, 10.0}}, rotation = 0)));
      SystemDynamics.Auxiliary.Prod_2 Prod_2_1 annotation(
        Placement(visible = true, transformation(origin = {7.0, -117.0}, extent = {{-15.0, -13.0}, {15.0, 13.0}}, rotation = 0)));
      Modelica.Blocks.Math.Add Sucr_Grad(k2 = -1) annotation(
        Placement(visible = true, transformation(origin = {8.0, 34.0}, extent = {{10.0, -10.0}, {-10.0, 10.0}}, rotation = 0)));
      SystemDynamics.Auxiliary.Prod_2 Prod_2_2 annotation(
        Placement(visible = true, transformation(origin = {-11.0, 71.0}, extent = {{-15.0, -13.0}, {15.0, 13.0}}, rotation = 0)));
      SystemDynamics.Auxiliary.Gain Perm_Sucr(k = 0.02) annotation(
        Placement(visible = true, transformation(origin = {25.0, 71.0}, extent = {{15.0, -15.0}, {-15.0, 15.0}}, rotation = 0)));
    equation
      connect(C4.y, Water_Depl.u) annotation(
        Line(visible = true, points = {{97.0, -112.5}, {97.0, -105.25}, {97.0, -105.25}, {97.0, -96.8}}, color = {0, 0, 191}));
      connect(C2.y, Sucr_Depl.u) annotation(
        Line(visible = true, points = {{-85.0, 89.5}, {-85.0, 96.75}, {-85.0, 96.75}, {-85.0, 103.2}}, color = {0, 0, 191}));
      connect(Vol_Inside.u2, Water_Inside.y2) annotation(
        Line(visible = true, points = {{140.0, 14.0}, {150.0, 14.0}, {150.0, -140.0}, {73.0, -140.0}, {73.0, -93.0}}, color = {0, 0, 191}));
      connect(Vol_Outside.u2, Water_Outside.y4) annotation(
        Line(visible = true, points = {{-124.0, 14.0}, {-130.0, 14.0}, {-130.0, -140.0}, {-57.0, -140.0}, {-57.0, -93.0}}, color = {0, 0, 191}));
      connect(Vol_Outside.u1, Sucrose_Outside.y1) annotation(
        Line(visible = true, points = {{-124.0, 26.0}, {-130.0, 26.0}, {-130.0, 140.0}, {-68.0, 140.0}, {-68.0, 131.0}, {-59.0, 131.0}}, color = {0, 0, 191}));
      connect(Vol_Inside.u1, Sucrose_Inside.y) annotation(
        Line(visible = true, points = {{140.0, 26.0}, {150.0, 26.0}, {150.0, 140.0}, {80.0, 140.0}, {80.0, 131.0}, {75.0, 131.0}}, color = {0, 0, 191}));
      connect(Sucr_Conc_Out.u1, Sucrose_Outside.y2) annotation(
        Line(visible = true, points = {{-84.0, 46.0}, {-94.0, 46.0}, {-94.0, 60.0}, {-57.0, 60.0}, {-57.0, 107.0}}, color = {0, 0, 191}));
      connect(Vol_Outside.y, Water_Conc_Out.u2) annotation(
        Line(visible = true, points = {{-101.0, 20.0}, {-94.0, 20.0}, {-94.0, 6.0}, {-84.0, 6.0}}, color = {0, 0, 191}));
      connect(Vol_Outside.y, Sucr_Conc_Out.u2) annotation(
        Line(visible = true, points = {{-101.0, 20.0}, {-94.0, 20.0}, {-94.0, 34.0}, {-84.0, 34.0}}, color = {0, 0, 191}));
      connect(Sucr_Conc_Out.y, Sucr_Grad.u2) annotation(
        Line(visible = true, points = {{-61.0, 40.0}, {-40.0, 40.0}, {-40.0, 10.0}, {32.0, 10.0}, {32.0, 28.0}, {20.0, 28.0}}, color = {0, 0, 191}));
      connect(Prod_2_2.y, Diffusion.u) annotation(
        Line(visible = true, points = {{-11.0, 80.1}, {-11.0, 90.0}, {9.0, 90.0}, {9.0, 103.2}}, color = {0, 0, 191}));
      connect(C1.y, Sucr_Gen.u) annotation(
        Line(visible = true, points = {{99.0, 89.5}, {99.0, 95.75}, {99.0, 95.75}, {99.0, 103.2}}, color = {0, 0, 191}));
      connect(Sucr_Conc_In.u1, Sucrose_Inside.y4) annotation(
        Line(visible = true, points = {{100.0, 46.0}, {110.0, 46.0}, {110.0, 60.0}, {73.0, 60.0}, {73.0, 107.0}}, color = {0, 0, 191}));
      connect(Sucr_Conc_In.y, Sucr_Grad.u1) annotation(
        Line(visible = true, points = {{77.0, 40.0}, {20.0, 40.0}}, color = {0, 0, 191}));
      connect(Sucr_Grad.y, Prod_2_2.u1) annotation(
        Line(visible = true, points = {{-3.0, 34.0}, {-30.0, 34.0}, {-30.0, 71.0}, {-21.5, 71.0}}, color = {0, 0, 191}));
      connect(Perm_Sucr.y, Prod_2_2.u2) annotation(
        Line(visible = true, points = {{14.5, 71.0}, {8.25, 71.0}, {8.25, 71.0}, {-0.5, 71.0}}, color = {0, 0, 191}));
      connect(Vol_Inside.y, Perm_Sucr.u) annotation(
        Line(visible = true, points = {{117.0, 20.0}, {60.0, 20.0}, {60.0, 71.0}, {35.5, 71.0}}, color = {0, 0, 191}));
      connect(Vol_Inside.y, Sucr_Conc_In.u2) annotation(
        Line(visible = true, points = {{117.0, 20.0}, {110.0, 20.0}, {110.0, 34.0}, {100.0, 34.0}}, color = {0, 0, 191}));
      connect(Vol_Inside.y, Water_Conc_In.u2) annotation(
        Line(visible = true, points = {{117.0, 20.0}, {110.0, 20.0}, {110.0, 6.0}, {100.0, 6.0}}, color = {0, 0, 191}));
      connect(Water_Conc_In.u1, Water_Inside.y1) annotation(
        Line(visible = true, points = {{100.0, -6.0}, {110.0, -6.0}, {110.0, -50.0}, {80.0, -50.0}, {80.0, -69.0}, {75.0, -69.0}}, color = {0, 0, 191}));
      connect(Water_Conc_In.y, Water_Grad.u2) annotation(
        Line(visible = true, points = {{77.0, 0.0}, {40.0, 0.0}, {40.0, -46.0}, {20.0, -46.0}}, color = {0, 0, 191}));
      connect(Water_Conc_Out.u1, Water_Outside.y) annotation(
        Line(visible = true, points = {{-84.0, -6.0}, {-94.0, -6.0}, {-94.0, -50.0}, {-66.0, -50.0}, {-66.0, -69.0}, {-59.0, -69.0}}, color = {0, 0, 191}));
      connect(Water_Conc_Out.y, Water_Grad.u1) annotation(
        Line(visible = true, points = {{-61.0, 0.0}, {30.0, 0.0}, {30.0, -34.0}, {20.0, -34.0}}, color = {0, 0, 191}));
      connect(Water_Grad.y, Prod_2_1.u1) annotation(
        Line(visible = true, points = {{-3.0, -40.0}, {-10.0, -40.0}, {-10.0, -117.0}, {-3.5, -117.0}}, color = {0, 0, 191}));
      connect(Perm_H2O.y, Prod_2_1.u2) annotation(
        Line(visible = true, points = {{37.0, -128.5}, {37.0, -117.0}, {17.5, -117.0}}, color = {0, 0, 191}));
      connect(Prod_2_1.y, Osmosis.u) annotation(
        Line(visible = true, points = {{7.0, -107.9}, {7.0, -102.95}, {7.0, -102.95}, {7.0, -96.8}}, color = {0, 0, 191}));
      connect(C3.y, Water_Gen.u) annotation(
        Line(visible = true, points = {{-81.0, -110.5}, {-81.0, -104.25}, {-81.0, -104.25}, {-81.0, -96.8}}, color = {0, 0, 191}));
      connect(Source2.MassInPort1, Water_Gen.y) annotation(
        Line(visible = true, points = {{-101.0, -80.0}, {-88.5, -80.0}}, color = {191, 0, 191}));
      connect(Water_Gen.y1, Water_Outside.u1) annotation(
        Line(visible = true, points = {{-73.5, -80.0}, {-64.0, -80.0}}, color = {191, 0, 191}));
      connect(Water_Outside.u2, Osmosis.y) annotation(
        Line(visible = true, points = {{-20.0, -80.0}, {-0.5, -80.0}}, color = {191, 0, 191}));
      connect(Osmosis.y1, Water_Inside.u1) annotation(
        Line(visible = true, points = {{14.5, -80.0}, {36.0, -80.0}}, color = {191, 0, 191}));
      connect(Water_Inside.u2, Water_Depl.y) annotation(
        Line(visible = true, points = {{80.0, -80.0}, {89.5, -80.0}}, color = {191, 0, 191}));
      connect(Water_Depl.y1, Sink2.MassInPort1) annotation(
        Line(visible = true, points = {{104.5, -80.0}, {117.0, -80.0}}, color = {191, 0, 191}));
      connect(Source1.MassInPort1, Sucr_Gen.y) annotation(
        Line(visible = true, points = {{117.0, 120.0}, {106.5, 120.0}}, color = {191, 0, 191}));
      connect(Sucr_Gen.y1, Sucrose_Inside.u1) annotation(
        Line(visible = true, points = {{91.5, 120.0}, {80.0, 120.0}}, color = {191, 0, 191}));
      connect(Sucrose_Inside.u2, Diffusion.y) annotation(
        Line(visible = true, points = {{36.0, 120.0}, {16.5, 120.0}}, color = {191, 0, 191}));
      connect(Diffusion.y1, Sucrose_Outside.u1) annotation(
        Line(visible = true, points = {{1.5, 120.0}, {-20.0, 120.0}}, color = {191, 0, 191}));
      connect(Sucrose_Outside.u2, Sucr_Depl.y) annotation(
        Line(visible = true, points = {{-64.0, 120.0}, {-77.5, 120.0}}, color = {191, 0, 191}));
      connect(Sucr_Depl.y1, Sink1.MassInPort1) annotation(
        Line(visible = true, points = {{-92.5, 120.0}, {-101.0, 120.0}}, color = {191, 0, 191}));
      Water_conc_in = Water_Conc_In.y;
      Water_conc_out = Water_Conc_Out.y;
      Sucr_conc_in = Sucr_Conc_In.y;
      Sucr_conc_out = Sucr_Conc_Out.y;
      Vol_in = Vol_Inside.y;
      Vol_out = Vol_Outside.y;
      annotation(
        Icon(coordinateSystem(extent = {{-140.0, -160.0}, {160.0, 160.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, lineColor = {0, 0, 255}, fillColor = {191, 95, 0}, fillPattern = FillPattern.VerticalCylinder, extent = {{-20.0, -80.0}, {20.0, 100.0}}), Line(visible = true, points = {{-10.0, 50.0}, {-10.0, -8.0}}, color = {0, 0, 255}), Line(visible = true, points = {{-4.0, 30.0}, {-4.0, -28.0}}, color = {0, 0, 255}), Line(visible = true, points = {{10.0, 74.0}, {10.0, 16.0}}, color = {0, 0, 255}), Line(visible = true, points = {{6.0, -2.0}, {6.0, -60.0}}, color = {0, 0, 255}), Rectangle(visible = true, lineColor = {0, 0, 255}, fillColor = {160, 160, 160}, fillPattern = FillPattern.Backward, extent = {{-120.0, -100.0}, {140.0, -80.0}}), Rectangle(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-120.0, -80.0}, {-20.0, 40.0}}), Rectangle(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 255, 255}, fillPattern = FillPattern.Solid, extent = {{20.0, -80.0}, {140.0, 40.0}}), Line(visible = true, points = {{-92.0, 20.0}, {-70.0, 20.0}}, color = {0, 0, 255}), Line(visible = true, points = {{-78.0, 10.0}, {-56.0, 10.0}}, color = {0, 0, 255}), Line(visible = true, points = {{-100.0, -38.0}, {-78.0, -38.0}}, color = {0, 0, 255}), Line(visible = true, points = {{-62.0, -32.0}, {-40.0, -32.0}}, color = {0, 0, 255}), Line(visible = true, points = {{-106.0, -8.0}, {-84.0, -8.0}}, color = {0, 0, 255}), Line(visible = true, points = {{40.0, 14.0}, {62.0, 14.0}}, color = {0, 0, 255}), Line(visible = true, points = {{92.0, -44.0}, {114.0, -44.0}}, color = {0, 0, 255}), Line(visible = true, points = {{40.0, -58.0}, {62.0, -58.0}}, color = {0, 0, 255}), Line(visible = true, points = {{60.0, -38.0}, {82.0, -38.0}}, color = {0, 0, 255}), Line(visible = true, points = {{62.0, -4.0}, {84.0, -4.0}}, color = {0, 0, 255})}),
        Diagram(coordinateSystem(extent = {{-140.0, -160.0}, {160.0, 160.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{-96.0, 18.0}, {-92.0, 22.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{108.0, 18.0}, {112.0, 22.0}})}),
        experiment(StopTime = 20),
        experimentSetupOutput,
        Documentation(info = "<html>
The sugar cane model describes the processes of diffusion and osmosis in a sugar cane plant.  The model was adapted from the STELLA manual. <p>
 
<hr> <p>
 
<b>References:</b> <p>
 
<ol>
<li> Richmond, B., S. Peterson, and P. Vescuso (1987), <i>An Academic User's Guide to STELLA</i>, High Performance Systems, Inc., Lyme, N.H.
</ol> <p>
 
<hr> <p>
 
Simulate the model across 20 time units and plot on three separate graphs the two water concentrations (inside and outside), the two sugar concentrations, and the two volumes: <p>
<img src=\"modelica://SystemDynamics/Resources/Images/Sugar_Cane_1.png\"> <p>
<img src=\"modelica://SystemDynamics/Resources/Images/Sugar_Cane_2.png\"> <p>
<img src=\"modelica://SystemDynamics/Resources/Images/Sugar_Cane_3.png\">
</html>", revisions = ""));
    end Sugar_Cane;
    annotation(
      preferedView = "info",
      Documentation(info = "<html>
This package contains a number of introductory examples that can be used to familiarize oneself with the System Dynamics methodology and with the <font color=red><b>SystemDynamics</b></font> library.
</html>"));
  end IntroductoryExamples;