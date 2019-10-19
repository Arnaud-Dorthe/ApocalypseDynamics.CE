    block RRate "Restricted rate element"
      constant Real inf = Modelica.Constants.inf;
      parameter Real minFlow = 0 "Smallest allowed flow";
      parameter Real maxFlow = inf "Largest allowed flow";
      output Real rate;
      Modelica.Blocks.Interfaces.RealInput u "Signal inflow variable" annotation(
        Placement(visible = true, transformation(origin = {0.0, -105.0}, extent = {{-5.0, -5.0}, {5.0, 5.0}}, rotation = -270), iconTransformation(origin = {0.0, -105.0}, extent = {{-5.0, -5.0}, {5.0, 5.0}}, rotation = -270)));
      SystemDynamics.Interfaces.MassOutPort y "Mass inflow variable" annotation(
        Placement(visible = true, transformation(origin = {-50.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-50.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      SystemDynamics.Interfaces.MassOutPort y1 "Mass outflow variable" annotation(
        Placement(visible = true, transformation(origin = {50.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {50.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      Modelica.Blocks.Nonlinear.Limiter Limiter1(uMax = maxFlow, uMin = minFlow) annotation(
        Placement(visible = true, transformation(origin = {0.0, -50.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -270)));
    equation
      rate = y;
      connect(y, y1) annotation(
        Line(points = {{-50.0, 0.0}, {50.0, 0.0}}, color = {95, 0, 191}, visible = true));
      connect(u, Limiter1.u) annotation(
        Line(points = {{0.0, -105.0}, {0.0, -62.0}, {0.0, -62.0}}, color = {0, 0, 191}, visible = true));
      connect(y1, Limiter1.y) annotation(
        Line(points = {{50.0, 0.0}, {0.0, 0.0}, {0.0, -39.0}}, color = {95, 0, 191}, visible = true));
      annotation(
        Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Polygon(visible = true, lineColor = {127, 0, 255}, fillColor = {0, 255, 255}, fillPattern = FillPattern.Solid, lineThickness = 0.5, points = {{-60.0, -100.0}, {-60.0, -40.0}, {40.0, 26.0}, {-40.0, 26.0}, {60.0, -40.0}, {60.0, -100.0}, {-60.0, -100.0}}), Line(visible = true, points = {{-40.0, 0.0}, {40.0, 0.0}}, color = {127, 0, 255}, thickness = 0.5), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-100.0, 50.0}, {100.0, 88.0}}, textString = "%name", fontName = "Arial"), Line(visible = true, points = {{-40.0, -74.0}, {-12.0, -74.0}}, color = {0, 0, 255}, thickness = 0.5), Line(visible = true, points = {{8.0, -46.0}, {36.0, -46.0}}, color = {0, 0, 255}, thickness = 0.5), Line(visible = true, points = {{-12.0, -74.0}, {8.0, -46.0}}, color = {0, 0, 255}, thickness = 0.5)}),
        Documentation(info = "<html>
This is the System Dynamics restricted <b>Rate</b> element, whereby the rate itself is determined by a single variable in its laundry list.  The indicated direction of mass flow denotes the direction of true mass flow.  If the control signal of the rate assumes a negative value, no mass will flow.  If the control signal of the rate assumes a too large positive value, the mass flow will be limited to its allowed maximum value. <p>
 
The restricted rate element should e.g. be used to model a kitchen faucet.  The valve can be opened or closed, but there is a limit to how much water per time unit you can get out of the faucet, and no manipulation of the faucet will ever make water flow from the sink back into the faucet.
</html>"),
        Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics));
    end RRate;