    block COutflow "Controlled outflow element"
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
        Placement(visible = true, transformation(origin = {0.0, -30.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -270)));
      Modelica.Blocks.Interfaces.BooleanInput s "Control signal" annotation(
        Placement(visible = true, transformation(origin = {-65.0, -70.0}, extent = {{-5.0, -5.0}, {5.0, 5.0}}, rotation = 0), iconTransformation(origin = {-65.0, -70.0}, extent = {{-5.0, -5.0}, {5.0, 5.0}}, rotation = 0)));
      Modelica.Blocks.Logical.Switch Switch1 annotation(
        Placement(visible = true, transformation(origin = {0.0, -60.0}, extent = {{10.0, -10.0}, {-10.0, 10.0}}, rotation = -90)));
      Modelica.Blocks.Sources.Constant Const1(k = 0) annotation(
        Placement(visible = true, transformation(origin = {-40.0, -50.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
    equation
      rate = y;
      connect(y, y1) annotation(
        Line(points = {{-50.0, 0.0}, {50.0, 0.0}}, color = {95, 0, 191}, visible = true));
      connect(y1, Limiter1.y) annotation(
        Line(points = {{50.0, 0.0}, {0.0, 0.0}, {0.0, -19.0}}, color = {95, 0, 191}, visible = true));
      connect(Switch1.y, Limiter1.u) annotation(
        Line(points = {{0.0, -49.0}, {0.0, -50.5}, {0.0, -50.5}, {0.0, -42.0}}, color = {0, 0, 191}, visible = true));
      connect(u, Switch1.u1) annotation(
        Line(points = {{0.0, -105.0}, {0.0, -94.0}, {8.0, -94.0}, {8.0, -72.0}}, color = {0, 0, 191}, visible = true));
      connect(s, Switch1.u2) annotation(
        Line(points = {{-65.0, -70.0}, {-50.0, -70.0}, {-50.0, -86.0}, {0.0, -86.0}, {0.0, -72.0}}, color = {255, 0, 255}, visible = true));
      connect(Const1.y, Switch1.u3) annotation(
        Line(points = {{-29.0, -50.0}, {-20.0, -50.0}, {-20.0, -80.0}, {-8.0, -80.0}, {-8.0, -72.0}}, color = {0, 0, 191}, visible = true));
      annotation(
        Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Polygon(visible = true, lineColor = {127, 0, 255}, fillColor = {0, 255, 255}, fillPattern = FillPattern.Solid, lineThickness = 0.5, points = {{-60.0, -100.0}, {-60.0, -40.0}, {40.0, 26.0}, {-40.0, 26.0}, {60.0, -40.0}, {60.0, -100.0}, {-60.0, -100.0}}), Line(visible = true, points = {{-40.0, 0.0}, {40.0, 0.0}}, color = {127, 0, 255}, thickness = 0.5), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-100.0, 50.0}, {100.0, 88.0}}, textString = "%name", fontName = "Arial"), Line(visible = true, points = {{-40.0, -74.0}, {-12.0, -74.0}}, color = {0, 0, 255}, thickness = 0.5), Line(visible = true, points = {{8.0, -46.0}, {36.0, -46.0}}, color = {0, 0, 255}, thickness = 0.5), Line(visible = true, points = {{-12.0, -74.0}, {8.0, -46.0}}, color = {0, 0, 255}, thickness = 0.5)}),
        Documentation(info = "<html>
This is the System Dynamics controlled restricted <b>Outflow</b> element, whereby the rate itself is determined by a single variable in its laundry list.  This element is a restricted rate element with the additional feature that the upstream level can control the flow by telling it that it is empty.  This is accomplished by a Boolean control signal from the upstream level to the rate element. <p>
 
The controlled outflow element should e.g. be used to model the drainage of a kitchen sink.  Water can flow out of the kitchen sink only as long as there is any water left.
</html>"),
        Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics));
    end COutflow;