    block Rate_3 "Unrestricted additive rate element with three influencing variables"
      output Real rate;
      Modelica.Blocks.Math.Add3 Add3_1 annotation(
        Placement(visible = true, transformation(origin = {0.0, -40.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = -270)));
      Modelica.Blocks.Interfaces.RealInput u "First signal inflow variable" annotation(
        Placement(visible = true, transformation(origin = {-40.0, -105.0}, extent = {{-5.0, -5.0}, {5.0, 5.0}}, rotation = -270), iconTransformation(origin = {-40.0, -105.0}, extent = {{-5.0, -5.0}, {5.0, 5.0}}, rotation = -270)));
      Modelica.Blocks.Interfaces.RealInput u1 "Second signal inflow variable" annotation(
        Placement(visible = true, transformation(origin = {0.0, -105.0}, extent = {{-5.0, -5.0}, {5.0, 5.0}}, rotation = -270), iconTransformation(origin = {0.0, -105.0}, extent = {{-5.0, -5.0}, {5.0, 5.0}}, rotation = -270)));
      Modelica.Blocks.Interfaces.RealInput u2 "Third signal inflow variable" annotation(
        Placement(visible = true, transformation(origin = {40.0, -105.0}, extent = {{-5.0, -5.0}, {5.0, 5.0}}, rotation = -270), iconTransformation(origin = {40.0, -105.0}, extent = {{-5.0, -5.0}, {5.0, 5.0}}, rotation = -270)));
      SystemDynamics.Interfaces.MassOutPort y "Mass inflow variable" annotation(
        Placement(visible = true, transformation(origin = {-50.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-50.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      SystemDynamics.Interfaces.MassOutPort y1 "Mass outflow variable" annotation(
        Placement(visible = true, transformation(origin = {50.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {50.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
    equation
      rate = y;
      connect(u, Add3_1.u1) annotation(
        Line(points = {{-40.0, -105.0}, {-40.0, -80.0}, {-16.0, -80.0}, {-16.0, -64.0}}, color = {0, 0, 191}, visible = true));
      connect(u1, Add3_1.u2) annotation(
        Line(points = {{0.0, -105.0}, {0.0, -64.0}, {0.0, -64.0}}, color = {0, 0, 191}, visible = true));
      connect(u2, Add3_1.u3) annotation(
        Line(points = {{40.0, -105.0}, {40.0, -80.0}, {16.0, -80.0}, {16.0, -64.0}}, color = {0, 0, 191}, visible = true));
      connect(Add3_1.y, y1) annotation(
        Line(points = {{0.0, -18.0}, {0.0, 0.0}, {50.0, 0.0}}, color = {0, 0, 191}, visible = true));
      connect(y, y1) annotation(
        Line(points = {{-50.0, 0.0}, {50.0, 0.0}}, color = {95, 0, 191}, visible = true));
      annotation(
        Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Polygon(visible = true, lineColor = {127, 0, 255}, fillColor = {0, 255, 255}, fillPattern = FillPattern.Solid, lineThickness = 0.5, points = {{-60.0, -100.0}, {-60.0, -40.0}, {40.0, 26.0}, {-40.0, 26.0}, {60.0, -40.0}, {60.0, -100.0}, {-60.0, -100.0}}), Line(visible = true, points = {{-40.0, 0.0}, {40.0, 0.0}}, color = {127, 0, 255}, thickness = 0.5), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-100.0, 50.0}, {100.0, 88.0}}, textString = "%name", fontName = "Arial"), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-26.0, -80.0}, {26.0, -42.0}}, textString = "+", fontName = "Arial")}),
        Documentation(info = "<html>
This is the general System Dynamics unrestricted additive <b>Rate</b> element, whereby the rate itself is determined by three variables in its laundry list.  The indicated direction of mass flow simply denotes the direction of positive mass flow.  However if the control signal of the rate assumes a negative value, mass will flow in the opposite direction.
</html>"),
        Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics));
    end Rate_3;