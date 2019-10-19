    block DELAY3 "Third-order exponential delaying"
      parameter Real averaging_time = 1 "Averaging time";
      parameter Real delay_init = 0 "Initial value of delayed variable";
      SystemDynamics.Interfaces.MassInPort massInPort "Mass input signal" annotation(
        Placement(visible = true, transformation(origin = {-110.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-110.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      SystemDynamics.Interfaces.MassOutPort massOutPort "Mass output signal" annotation(
        Placement(visible = true, transformation(origin = {110.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {110.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealOutput state "State signal" annotation(
        Placement(visible = true, transformation(origin = {0.0, 110.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -270), iconTransformation(origin = {0.0, 110.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -270)));
      SystemDynamics.Levels.Level Level1(x0 = delay_init / 3) annotation(
        Placement(visible = true, transformation(origin = {-60.0, 70.0}, extent = {{-20.0, -15.0}, {20.0, 15.0}}, rotation = 0)));
      SystemDynamics.Rates.Rate_1 Rate1 annotation(
        Placement(visible = true, transformation(origin = {10.0, 70.0}, extent = {{-16.0, -15.0}, {16.0, 15.0}}, rotation = 0)));
      SystemDynamics.Auxiliary.Gain Delaying1(k = 3 / averaging_time) annotation(
        Placement(visible = true, transformation(origin = {-17.0, 41.0}, extent = {{-29.0, 14.0}, {29.0, -14.0}}, rotation = 0)));
      SystemDynamics.Levels.Level Level2(x0 = delay_init / 3) annotation(
        Placement(visible = true, transformation(origin = {-40.0, 10.0}, extent = {{-20.0, -15.0}, {20.0, 15.0}}, rotation = 0)));
      SystemDynamics.Rates.Rate_1 Rate2 annotation(
        Placement(visible = true, transformation(origin = {30.0, 10.0}, extent = {{-16.0, -15.0}, {16.0, 15.0}}, rotation = 0)));
      SystemDynamics.Auxiliary.Gain Delaying2(k = 3 / averaging_time) annotation(
        Placement(visible = true, transformation(origin = {3.0, -19.0}, extent = {{-29.0, 14.0}, {29.0, -14.0}}, rotation = 0)));
      SystemDynamics.Levels.Level Level3(x0 = delay_init / 3) annotation(
        Placement(visible = true, transformation(origin = {-20.0, -50.0}, extent = {{-20.0, -15.0}, {20.0, 15.0}}, rotation = 0)));
      SystemDynamics.Rates.Rate_1 Rate3 annotation(
        Placement(visible = true, transformation(origin = {50.0, -50.0}, extent = {{-16.0, -15.0}, {16.0, 15.0}}, rotation = 0)));
      SystemDynamics.Auxiliary.Gain Delaying3(k = 3 / averaging_time) annotation(
        Placement(visible = true, transformation(origin = {23.0, -79.0}, extent = {{-29.0, 14.0}, {29.0, -14.0}}, rotation = 0)));
      Modelica.Blocks.Math.Add3 Add3 annotation(
        Placement(visible = true, transformation(origin = {70.0, 70.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -270)));
    equation
      connect(Rate1.y, Level1.u2) annotation(
        Line(points = {{2.0, 70.0}, {-38.0, 70.0}}, color = {95, 0, 191}, visible = true));
      connect(Delaying1.u, Level1.y2) annotation(
        Line(points = {{-37.3, 41.0}, {-45.0, 41.0}, {-45.0, 60.25}}, color = {0, 0, 191}, visible = true));
      connect(Delaying1.y, Rate1.u) annotation(
        Line(points = {{3.3, 41.0}, {10.0, 41.0}, {10.0, 54.25}}, color = {0, 0, 191}, visible = true));
      connect(Rate2.y, Level2.u2) annotation(
        Line(points = {{22.0, 10.0}, {-18.0, 10.0}}, color = {95, 0, 191}, visible = true));
      connect(Delaying2.u, Level2.y2) annotation(
        Line(points = {{-17.3, -19.0}, {-25.0, -19.0}, {-25.0, 0.25}}, color = {0, 0, 191}, visible = true));
      connect(Delaying2.y, Rate2.u) annotation(
        Line(points = {{23.3, -19.0}, {30.0, -19.0}, {30.0, -5.75}}, color = {0, 0, 191}, visible = true));
      connect(Rate3.y, Level3.u2) annotation(
        Line(points = {{42.0, -50.0}, {2.0, -50.0}}, color = {95, 0, 191}, visible = true));
      connect(Delaying3.u, Level3.y2) annotation(
        Line(points = {{2.7, -79.0}, {-5.0, -79.0}, {-5.0, -59.75}}, color = {0, 0, 191}, visible = true));
      connect(Delaying3.y, Rate3.u) annotation(
        Line(points = {{43.3, -79.0}, {50.0, -79.0}, {50.0, -65.75}}, color = {0, 0, 191}, visible = true));
      connect(Level1.u1, massInPort) annotation(
        Line(points = {{-82.0, 70.0}, {-90.0, 70.0}, {-90.0, 0.0}, {-110.0, 0.0}}, color = {95, 0, 191}, visible = true));
      connect(Rate1.y1, Level2.u1) annotation(
        Line(points = {{18.0, 70.0}, {30.0, 70.0}, {30.0, 28.0}, {-70.0, 28.0}, {-70.0, 10.0}, {-62.0, 10.0}}, color = {95, 0, 191}, visible = true));
      connect(Rate2.y1, Level3.u1) annotation(
        Line(points = {{38.0, 10.0}, {50.0, 10.0}, {50.0, -32.0}, {-50.0, -32.0}, {-50.0, -50.0}, {-42.0, -50.0}}, color = {95, 0, 191}, visible = true));
      connect(Rate3.y1, massOutPort) annotation(
        Line(points = {{58.0, -50.0}, {90.0, -50.0}, {90.0, 0.0}, {110.0, 0.0}}, color = {95, 0, 191}, visible = true));
      connect(Add3.u1, Level1.y1) annotation(
        Line(points = {{62.0, 58.0}, {62.0, 50.0}, {50.0, 50.0}, {50.0, 84.0}, {-30.0, 84.0}, {-30.0, 78.25}, {-43.0, 78.25}}, color = {0, 0, 191}, visible = true));
      connect(Add3.u2, Level2.y1) annotation(
        Line(points = {{70.0, 58.0}, {70.0, 24.0}, {-10.0, 24.0}, {-10.0, 18.25}, {-23.0, 18.25}}, color = {0, 0, 191}, visible = true));
      connect(Add3.u3, Level3.y1) annotation(
        Line(points = {{78.0, 58.0}, {78.0, -36.0}, {10.0, -36.0}, {10.0, -41.75}, {-3.0, -41.75}}, color = {0, 0, 191}, visible = true));
      connect(Add3.y, state) annotation(
        Line(points = {{70.0, 81.0}, {70.0, 90.0}, {0.0, 90.0}, {0.0, 110.0}}, color = {0, 0, 191}, visible = true));
      annotation(
        Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100.0, -100.0}, {100.0, 100.0}}), Text(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 191}, extent = {{-64.0, -44.0}, {68.0, 42.0}}, textString = "DELAY3", fontName = "Arial")}),
        Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics),
        Documentation(info = "<html>
This is a third-order exponential delaying function.  It describes the delaying of mass flows. <p>
 
Incoming goods are delayed temporarily in three consecutive internal states.  The <b>state</b> output represents the amount of goods currently stored in the DELAY block. <p>
 
The initial number of items in the DELAY block can be set.  By default, it assumes a value of zero.
</html>"));
    end DELAY3;