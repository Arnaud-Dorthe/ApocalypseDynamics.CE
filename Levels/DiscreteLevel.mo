    block DiscreteLevel "Discrete level of the System Dynamics methodology"
      parameter Real x0 = 0 "Initial condition";
      parameter Real h = 1.0 "Sampling rate";
      output Real level(start = x0) "Discrete state variable";
      output Real rate_in "Inflow";
      output Real rate_out "Outflow";
      SystemDynamics.Interfaces.MassInPort u1 "Inflow variable" annotation(
        Placement(visible = true, transformation(origin = {-110.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-110.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      SystemDynamics.Interfaces.MassInPort u2 "Outflow variable" annotation(
        Placement(visible = true, transformation(origin = {110.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {110.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      SystemDynamics.Interfaces.MassOutPort y1 "Discrete state variable" annotation(
        Placement(visible = true, transformation(origin = {-85.0, 55.0}, extent = {{5.0, -5.0}, {-5.0, 5.0}}, rotation = 0), iconTransformation(origin = {-85.0, 55.0}, extent = {{5.0, -5.0}, {-5.0, 5.0}}, rotation = 0)));
      SystemDynamics.Interfaces.MassOutPort y2 "Discrete state variable" annotation(
        Placement(visible = true, transformation(origin = {-75.0, -65.0}, extent = {{5.0, 5.0}, {-5.0, -5.0}}, rotation = -270), iconTransformation(origin = {-75.0, -65.0}, extent = {{5.0, 5.0}, {-5.0, -5.0}}, rotation = -270)));
      SystemDynamics.Interfaces.MassOutPort y3 "Discrete state variable" annotation(
        Placement(visible = true, transformation(origin = {0.0, -65.0}, extent = {{5.0, 5.0}, {-5.0, -5.0}}, rotation = -270), iconTransformation(origin = {0.0, -65.0}, extent = {{5.0, 5.0}, {-5.0, -5.0}}, rotation = -270)));
      SystemDynamics.Interfaces.MassOutPort y4 "Discrete state variable" annotation(
        Placement(visible = true, transformation(origin = {75.0, -65.0}, extent = {{5.0, 5.0}, {-5.0, -5.0}}, rotation = -270), iconTransformation(origin = {75.0, -65.0}, extent = {{5.0, 5.0}, {-5.0, -5.0}}, rotation = -270)));
      SystemDynamics.Interfaces.MassOutPort y5 "Discrete state variable" annotation(
        Placement(visible = true, transformation(origin = {85.0, 55.0}, extent = {{5.0, 5.0}, {-5.0, -5.0}}, rotation = -180), iconTransformation(origin = {85.0, 55.0}, extent = {{5.0, 5.0}, {-5.0, -5.0}}, rotation = -180)));
    equation
      rate_in = u1;
      rate_out = u2;
      y1 = pre(level);
      y2 = pre(level);
      y3 = pre(level);
      y4 = pre(level);
      y5 = pre(level);
      when sample(1, 1) then
        level = pre(level) + h * (rate_in - rate_out);
      end when;
      annotation(
        Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 255, 127}, fillPattern = FillPattern.Solid, extent = {{-80.0, -60.0}, {80.0, 20.0}}), Rectangle(visible = true, lineColor = {127, 0, 255}, lineThickness = 0.5, extent = {{-80.0, -60.0}, {80.0, 60.0}}), Line(visible = true, points = {{-100.0, 0.0}, {-80.0, 0.0}}, color = {95, 0, 191}, thickness = 0.5), Line(visible = true, points = {{80.0, 0.0}, {110.0, 0.0}}, color = {95, 0, 191}, thickness = 0.5)}),
        Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 255, 127}, fillPattern = FillPattern.Solid, extent = {{-80.0, -60.0}, {80.0, 20.0}}), Rectangle(visible = true, lineColor = {127, 0, 255}, lineThickness = 0.5, extent = {{-80.0, -60.0}, {80.0, 60.0}}), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-80.0, -6.0}, {80.0, 20.0}}, textString = "x0 = %x0", fontName = "Arial"), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-100.0, 70.0}, {100.0, 100.0}}, textString = "%name", fontName = "Arial"), Line(visible = true, points = {{-100.0, 0.0}, {-80.0, 0.0}}, color = {127, 0, 255}, thickness = 0.5), Line(visible = true, points = {{80.0, 0.0}, {100.0, 0.0}}, color = {127, 0, 255}, thickness = 0.5)}),
        Documentation(info = "<html>
This is the general discrete <b>Level</b> model of the System Dynamics methodology.  It computes the level by a Forward Euler algorithm, i.e., by solving a difference equation with a fixed step size of 1 time unit.  The classical System Dynamics methodology operates on discrete levels only.
</html>"));
    end DiscreteLevel;