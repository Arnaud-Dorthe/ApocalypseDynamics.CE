    block CLevel "General System Dynamics controlling level"
      constant Real inf = Modelica.Constants.inf;
      parameter Real x0 = 0 "Initial condition";
      parameter Real minLevel = 0 "Smallest allowed value of stock";
      parameter Real maxLevel = inf "Largest allowed value of stock";
      output Real level "Continuous state variable";
      Modelica.Blocks.Continuous.Integrator Integrator1(y_start = x0) annotation(
        Placement(visible = true, transformation(origin = {-30.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      SystemDynamics.Interfaces.MassInPort u1 "Inflow variable" annotation(
        Placement(visible = true, transformation(origin = {-110.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-110.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      SystemDynamics.Interfaces.MassInPort u2 "Outflow variable" annotation(
        Placement(visible = true, transformation(origin = {110.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {110.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      SystemDynamics.Interfaces.MassOutPort y "State variable" annotation(
        Placement(visible = true, transformation(origin = {-85.0, 55.0}, extent = {{5.0, -5.0}, {-5.0, 5.0}}, rotation = 0), iconTransformation(origin = {-85.0, 55.0}, extent = {{5.0, -5.0}, {-5.0, 5.0}}, rotation = 0)));
      SystemDynamics.Interfaces.MassOutPort y1 "State variable" annotation(
        Placement(visible = true, transformation(origin = {85.0, 55.0}, extent = {{-5.0, -5.0}, {5.0, 5.0}}, rotation = 0), iconTransformation(origin = {85.0, 55.0}, extent = {{-5.0, -5.0}, {5.0, 5.0}}, rotation = 0)));
      SystemDynamics.Interfaces.MassOutPort y2 "State variable" annotation(
        Placement(visible = true, transformation(origin = {0.0, -65.0}, extent = {{-5.0, -5.0}, {5.0, 5.0}}, rotation = -90), iconTransformation(origin = {0.0, -65.0}, extent = {{-5.0, -5.0}, {5.0, 5.0}}, rotation = -90)));
      Modelica.Blocks.Logical.LessThreshold LessThreshold1(threshold = maxLevel) annotation(
        Placement(visible = true, transformation(origin = {-50.0, -55.0}, extent = {{10.0, -10.0}, {-10.0, 10.0}}, rotation = 0)));
      Modelica.Blocks.Interfaces.BooleanOutput s1 "Inflow control signal" annotation(
        Placement(visible = true, transformation(origin = {-85.0, -55.0}, extent = {{5.0, -5.0}, {-5.0, 5.0}}, rotation = 0), iconTransformation(origin = {-85.0, -55.0}, extent = {{5.0, -5.0}, {-5.0, 5.0}}, rotation = 0)));
      Modelica.Blocks.Interfaces.BooleanOutput s2 "Outflow control signal" annotation(
        Placement(visible = true, transformation(origin = {85.0, -55.0}, extent = {{-5.0, -5.0}, {5.0, 5.0}}, rotation = 0), iconTransformation(origin = {85.0, -55.0}, extent = {{-5.0, -5.0}, {5.0, 5.0}}, rotation = 0)));
      Modelica.Blocks.Math.Add Add1(k1 = -1) annotation(
        Placement(visible = true, transformation(origin = {-70.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      Modelica.Blocks.Logical.GreaterThreshold GreaterThreshold1(threshold = minLevel) annotation(
        Placement(visible = true, transformation(origin = {50.0, -55.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
    equation
      level = y;
      connect(y1, Integrator1.y) annotation(
        Line(points = {{85.0, 55.0}, {0.0, 55.0}, {0.0, 0.0}, {-19.0, 0.0}}, color = {95, 0, 191}, visible = true));
      connect(y1, y) annotation(
        Line(points = {{85.0, 55.0}, {12.5, 55.0}, {12.5, 55.0}, {-85.0, 55.0}}, color = {95, 0, 191}, visible = true));
      connect(LessThreshold1.y, s1) annotation(
        Line(points = {{-61.0, -55.0}, {-85.0, -55.0}}, color = {255, 0, 255}, visible = true));
      connect(Add1.y, Integrator1.u) annotation(
        Line(points = {{-59.0, 0.0}, {-42.0, 0.0}}, color = {0, 0, 191}, visible = true));
      connect(u1, Add1.u2) annotation(
        Line(points = {{-110.0, 0.0}, {-90.0, 0.0}, {-90.0, -6.0}, {-82.0, -6.0}}, color = {95, 0, 191}, visible = true));
      connect(u2, Add1.u1) annotation(
        Line(points = {{110.0, 0.0}, {90.0, 0.0}, {90.0, 70.0}, {-90.0, 70.0}, {-90.0, 6.0}, {-82.0, 6.0}}, color = {95, 0, 191}, visible = true));
      connect(GreaterThreshold1.y, s2) annotation(
        Line(points = {{61.0, -55.0}, {69.5, -55.0}, {69.5, -55.0}, {85.0, -55.0}}, color = {255, 0, 255}, visible = true));
      connect(LessThreshold1.u, Integrator1.y) annotation(
        Line(points = {{-38.0, -55.0}, {-10.0, -55.0}, {-10.0, 0.0}, {-19.0, 0.0}}, color = {0, 0, 191}, visible = true));
      connect(GreaterThreshold1.u, Integrator1.y) annotation(
        Line(points = {{38.0, -55.0}, {10.0, -55.0}, {10.0, 0.0}, {-19.0, 0.0}}, color = {0, 0, 191}, visible = true));
      connect(y2, Integrator1.y) annotation(
        Line(points = {{6.3333, -43.3333}, {6.3333, 21.6667}, {-12.6667, 21.6667}}, color = {95, 0, 191}, visible = true, origin = {-6.3333, -21.6667}));
      annotation(
        Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics),
        Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-80.0, -60.0}, {80.0, 20.0}}), Rectangle(visible = true, lineColor = {127, 0, 255}, lineThickness = 0.5, extent = {{-80.0, -60.0}, {80.0, 60.0}}), Line(visible = true, points = {{-100.0, 0.0}, {-80.0, 0.0}}, color = {127, 0, 255}, thickness = 0.5), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-100.0, 70.0}, {100.0, 100.0}}, textString = "%name", fontName = "Arial"), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-80.0, -6.0}, {80.0, 20.0}}, textString = "x0 = %x0", fontName = "Arial"), Line(visible = true, points = {{80.0, 0.0}, {100.0, 0.0}}, color = {127, 0, 255}, thickness = 0.5)}),
        Documentation(info = "<html>
This is the continuous controlling <b>Level</b> model of the System Dynamics methodology with a single inflow and a single outflow.  It computes the level by integrating over the difference between inflow and outflow rates. <p>
 
Once the level reaches its maximum allowed value, it sends a Boolean signal to its inflow rate element to tell it to stop sending more stuff.  Once it reaches its minimum allowed value, it sends a Boolean signal to its outflow rate element to tell it to stop demanding more stuff.
</html>"));
    end CLevel;