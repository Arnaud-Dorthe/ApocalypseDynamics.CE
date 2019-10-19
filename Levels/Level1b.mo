    block Level1b "General System Dynamics level with no inflow"
      parameter Real x0 = 0 "Initial condition";
      output Real level "Continuous state variable";
      Modelica.Blocks.Continuous.Integrator Integrator1(y_start = x0) annotation(
        Placement(visible = true, transformation(origin = {20.0, 0.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
      SystemDynamics.Interfaces.MassInPort u1 "Outflow variable" annotation(
        Placement(visible = true, transformation(origin = {110.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {110.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      SystemDynamics.Interfaces.MassOutPort y "State variable" annotation(
        Placement(visible = true, transformation(origin = {-85.0, 55.0}, extent = {{5.0, -5.0}, {-5.0, 5.0}}, rotation = 0), iconTransformation(origin = {-85.0, 55.0}, extent = {{5.0, -5.0}, {-5.0, 5.0}}, rotation = 0)));
      SystemDynamics.Interfaces.MassOutPort y1 "State variable" annotation(
        Placement(visible = true, transformation(origin = {85.0, 55.0}, extent = {{-5.0, -5.0}, {5.0, 5.0}}, rotation = 0), iconTransformation(origin = {85.0, 55.0}, extent = {{-5.0, -5.0}, {5.0, 5.0}}, rotation = 0)));
      SystemDynamics.Interfaces.MassOutPort y2 "State variable" annotation(
        Placement(visible = true, transformation(origin = {75.0, -65.0}, extent = {{-5.0, -5.0}, {5.0, 5.0}}, rotation = -90), iconTransformation(origin = {75.0, -65.0}, extent = {{-5.0, -5.0}, {5.0, 5.0}}, rotation = -90)));
      SystemDynamics.Interfaces.MassOutPort y3 "State variable" annotation(
        Placement(visible = true, transformation(origin = {0.0, -65.0}, extent = {{-5.0, -5.0}, {5.0, 5.0}}, rotation = -90), iconTransformation(origin = {0.0, -65.0}, extent = {{-5.0, -5.0}, {5.0, 5.0}}, rotation = -90)));
      SystemDynamics.Interfaces.MassOutPort y4 "State variable" annotation(
        Placement(visible = true, transformation(origin = {-75.0, -65.0}, extent = {{-5.0, -5.0}, {5.0, 5.0}}, rotation = -90), iconTransformation(origin = {-75.0, -65.0}, extent = {{-5.0, -5.0}, {5.0, 5.0}}, rotation = -90)));
      Modelica.Blocks.Math.Gain Gain1(k = -1) annotation(
        Placement(visible = true, transformation(origin = {-40.0, 0.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
    equation
      level = y;
      connect(y, Integrator1.y) annotation(
        Line(points = {{-85.0, 55.0}, {60.0, 55.0}, {60.0, 0.0}, {42.0, 0.0}}, color = {95, 0, 191}, visible = true));
      connect(y2, Integrator1.y) annotation(
        Line(points = {{75.0, -65.0}, {75.0, -50.0}, {60.0, -50.0}, {60.0, 0.0}, {42.0, 0.0}}, color = {95, 0, 191}, visible = true));
      connect(y3, Integrator1.y) annotation(
        Line(points = {{0.0, -65.0}, {0.0, -50.0}, {60.0, -50.0}, {60.0, 0.0}, {42.0, 0.0}}, color = {95, 0, 191}, visible = true));
      connect(y4, Integrator1.y) annotation(
        Line(points = {{-75.0, -65.0}, {-75.0, -50.0}, {60.0, -50.0}, {60.0, 0.0}, {42.0, 0.0}}, color = {95, 0, 191}, visible = true));
      connect(y, y1) annotation(
        Line(points = {{-85.0, 55.0}, {-2.5, 55.0}, {-2.5, 55.0}, {85.0, 55.0}}, color = {95, 0, 191}, visible = true));
      connect(u1, Gain1.u) annotation(
        Line(points = {{110.0, 0.0}, {90.0, 0.0}, {90.0, -80.0}, {-90.0, -80.0}, {-90.0, 0.0}, {-64.0, 0.0}}, color = {95, 0, 191}, visible = true));
      connect(Gain1.y, Integrator1.u) annotation(
        Line(points = {{-18.0, 0.0}, {-4.0, 0.0}}, color = {0, 0, 191}, visible = true));
      annotation(
        Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics),
        Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-80.0, -60.0}, {80.0, 20.0}}), Rectangle(visible = true, lineColor = {127, 0, 255}, lineThickness = 0.5, extent = {{-80.0, -60.0}, {80.0, 60.0}}), Line(visible = true, points = {{80.0, 0.0}, {100.0, 0.0}}, color = {127, 0, 255}, thickness = 0.5), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-100.0, 70.0}, {100.0, 100.0}}, textString = "%name", fontName = "Arial"), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-80.0, -6.0}, {80.0, 20.0}}, textString = "x0 = %x0", fontName = "Arial")}),
        Documentation(info = "<html>
This is the general continuous <b>Level</b> model of the System Dynamics methodology with a single outflow and no inflow.  It computes the level by integrating over the negative outflow rate.
</html>"));
    end Level1b;