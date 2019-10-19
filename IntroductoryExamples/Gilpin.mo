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