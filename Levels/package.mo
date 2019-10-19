  package Levels "Levels of the System Dynamics methodology"
    extends Modelica.Icons.Library annotation(
      preferedView = "info",
      Documentation(info = "<html>
This package contains a set of different <b>Levels</b> (integrators of state variables) frequently used in the System Dynamics methodology.
</html>"));

    block Level "General System Dynamics level"
      parameter Real x0 = 0 "Initial condition";
      output Real level "Continuous state variable";
      Modelica.Blocks.Math.Add Add1(k2 = -1) annotation(
        Placement(visible = true, transformation(origin = {-40.0, 0.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
      Modelica.Blocks.Continuous.Integrator Integrator1(y_start = x0) annotation(
        Placement(visible = true, transformation(origin = {20.0, 0.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
      SystemDynamics.Interfaces.MassInPort u1 "Inflow variable" annotation(
        Placement(visible = true, transformation(origin = {-110.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-110.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      SystemDynamics.Interfaces.MassInPort u2 "Outflow variable" annotation(
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
    equation
      level = y;
      connect(Add1.y, Integrator1.u) annotation(
        Line(points = {{-18.0, 0.0}, {-4.0, 0.0}}, color = {0, 0, 255}, visible = true));
      connect(y, Integrator1.y) annotation(
        Line(points = {{-85.0, 55.0}, {60.0, 55.0}, {60.0, 0.0}, {42.0, 0.0}}, color = {95, 0, 191}, visible = true));
      connect(u1, Add1.u1) annotation(
        Line(points = {{-110.0, 0.0}, {-80.0, 0.0}, {-80.0, 12.0}, {-64.0, 12.0}}, color = {95, 0, 191}, visible = true));
      connect(u2, Add1.u2) annotation(
        Line(points = {{110.0, 0.0}, {80.0, 0.0}, {80.0, -40.0}, {-80.0, -40.0}, {-80.0, -12.0}, {-64.0, -12.0}}, color = {95, 0, 191}, visible = true));
      connect(y1, Integrator1.y) annotation(
        Line(points = {{85.0, 55.0}, {60.0, 55.0}, {60.0, 0.0}, {42.0, 0.0}}, color = {95, 0, 191}, visible = true));
      connect(y2, Integrator1.y) annotation(
        Line(points = {{75.0, -65.0}, {75.0, -50.0}, {60.0, -50.0}, {60.0, 0.0}, {42.0, 0.0}}, color = {95, 0, 191}, visible = true));
      connect(y3, Integrator1.y) annotation(
        Line(points = {{0.0, -65.0}, {0.0, -50.0}, {60.0, -50.0}, {60.0, 0.0}, {42.0, 0.0}}, color = {95, 0, 191}, visible = true));
      connect(y4, Integrator1.y) annotation(
        Line(points = {{-75.0, -65.0}, {-75.0, -50.0}, {60.0, -50.0}, {60.0, 0.0}, {42.0, 0.0}}, color = {95, 0, 191}, visible = true));
      annotation(
        Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-80.0, -60.0}, {80.0, 20.0}}), Rectangle(visible = true, lineColor = {127, 0, 255}, lineThickness = 0.5, extent = {{-80.0, -60.0}, {80.0, 60.0}}), Line(visible = true, points = {{-100.0, 0.0}, {-80.0, 0.0}}, color = {127, 0, 255}, thickness = 0.5), Line(visible = true, points = {{80.0, 0.0}, {100.0, 0.0}}, color = {127, 0, 255}, thickness = 0.5), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-100.0, 70.0}, {100.0, 100.0}}, textString = "%name", fontName = "Arial"), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-80.0, -6.0}, {80.0, 20.0}}, textString = "x0 = %x0", fontName = "Arial")}),
        Documentation(info = "<html>
This is the general continuous <b>Level</b> model of the System Dynamics methodology with a single inflow and a single outflow.  It computes the level by integrating over the difference between inflow and outflow rates.
</html>"),
        Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics));
    end Level;

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

    block Reverse_Level "Level of the System Dynamics methodology with time reversal"
      parameter Real x0 = 0 "Initial condition";
      parameter Real xm = 0.0 "Minimum level";
      output Real level(start = x0) "Reversible state variable";
      output Real rate_in "Inflow";
      output Real rate_out "Outflow";
      input Real dir "Direction of time flow";
      SystemDynamics.Interfaces.MassInPort u1 "Inflow variable" annotation(
        Placement(visible = true, transformation(origin = {-110.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-110.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      SystemDynamics.Interfaces.MassInPort u2 "Outflow variable" annotation(
        Placement(visible = true, transformation(origin = {110.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {110.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      SystemDynamics.Interfaces.MassOutPort y "Reversible state variable" annotation(
        Placement(visible = true, transformation(origin = {-85.0, 55.0}, extent = {{5.0, -5.0}, {-5.0, 5.0}}, rotation = 0), iconTransformation(origin = {-85.0, 55.0}, extent = {{5.0, -5.0}, {-5.0, 5.0}}, rotation = 0)));
      SystemDynamics.Interfaces.MassOutPort y1 "Reversible state variable" annotation(
        Placement(visible = true, transformation(origin = {85.0, 55.0}, extent = {{-5.0, -5.0}, {5.0, 5.0}}, rotation = 0), iconTransformation(origin = {85.0, 55.0}, extent = {{-5.0, -5.0}, {5.0, 5.0}}, rotation = 0)));
      SystemDynamics.Interfaces.MassOutPort y2 "Reversible state variable" annotation(
        Placement(visible = true, transformation(origin = {75.0, -65.0}, extent = {{-5.0, -5.0}, {5.0, 5.0}}, rotation = -90), iconTransformation(origin = {75.0, -65.0}, extent = {{-5.0, -5.0}, {5.0, 5.0}}, rotation = -90)));
      SystemDynamics.Interfaces.MassOutPort y3 "Reversible state variable" annotation(
        Placement(visible = true, transformation(origin = {0.0, -65.0}, extent = {{-5.0, -5.0}, {5.0, 5.0}}, rotation = -90), iconTransformation(origin = {0.0, -65.0}, extent = {{-5.0, -5.0}, {5.0, 5.0}}, rotation = -90)));
      SystemDynamics.Interfaces.MassOutPort y4 "Reversible state variable" annotation(
        Placement(visible = true, transformation(origin = {-75.0, -65.0}, extent = {{-5.0, -5.0}, {5.0, 5.0}}, rotation = -90), iconTransformation(origin = {-75.0, -65.0}, extent = {{-5.0, -5.0}, {5.0, 5.0}}, rotation = -90)));
    equation
      rate_in = u1;
      rate_out = u2;
      y = level;
      y1 = level;
      y2 = level;
      y3 = level;
      y4 = level;
      der(level) = if level > xm then dir * (rate_in - rate_out) else 0;
      annotation(
        Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, lineColor = {0, 0, 255}, fillColor = {255, 127, 0}, fillPattern = FillPattern.Solid, extent = {{-80.0, -60.0}, {80.0, 20.0}}), Rectangle(visible = true, lineColor = {127, 0, 255}, lineThickness = 0.5, extent = {{-80.0, -60.0}, {80.0, 60.0}}), Line(visible = true, points = {{-100.0, 0.0}, {-80.0, 0.0}}, color = {127, 0, 255}, thickness = 0.5), Line(visible = true, points = {{80.0, 0.0}, {110.0, 0.0}}, color = {127, 0, 255}, thickness = 0.5)}),
        Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, lineColor = {0, 0, 255}, fillColor = {255, 127, 0}, fillPattern = FillPattern.Solid, extent = {{-80.0, -60.0}, {80.0, 20.0}}), Rectangle(visible = true, lineColor = {127, 0, 255}, lineThickness = 0.5, extent = {{-80.0, -60.0}, {80.0, 60.0}}), Line(visible = true, points = {{-100.0, 0.0}, {-80.0, 0.0}}, color = {127, 0, 255}, thickness = 0.5), Line(visible = true, points = {{80.0, 0.0}, {100.0, 0.0}}, color = {127, 0, 255}, thickness = 0.5), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-100.0, 70.0}, {100.0, 100.0}}, textString = "%name", fontName = "Arial"), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-80.0, -6.0}, {80.0, 20.0}}, textString = "x0 = %x0", fontName = "Arial")}),
        Documentation(info = "<html>
This is a time-reversible continuous <b>Level</b> model of the System Dynamics methodology. <p>
 
Given the following state-space model: <p>
 
<font color=red>der</font>(<b>x</b>) = <b>f</b>(<b>x</b>,t); <p>
 
Time reversal can be achieved by placing a minus sign in front of each state equation: <p>
 
<font color=red>der</font>(<b>x</b>) = -<b>f</b>(<b>x</b>,t); <p>
 
The <i>Reverse_Level</i> model contains a modulating variable <b>dir</b> that determines the direction of time flow: <p>
 
<font color=red>der</font>(<b>x</b>) = dir*<b>f</b>(<b>x</b>,t);
</html>"));
    end Reverse_Level;

    block Level1a "General System Dynamics level with no outflow"
      parameter Real x0 = 0 "Initial condition";
      output Real level "Continuous state variable";
      Modelica.Blocks.Continuous.Integrator Integrator1(y_start = x0) annotation(
        Placement(visible = true, transformation(origin = {-10.0, 0.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
      SystemDynamics.Interfaces.MassInPort u1 "Inflow variable" annotation(
        Placement(visible = true, transformation(origin = {-110.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-110.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
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
    equation
      level = y;
      connect(y1, Integrator1.y) annotation(
        Line(points = {{85.0, 55.0}, {60.0, 55.0}, {60.0, 0.0}, {12.0, 0.0}}, color = {95, 0, 191}, visible = true));
      connect(y2, Integrator1.y) annotation(
        Line(points = {{75.0, -65.0}, {75.0, -50.0}, {60.0, -50.0}, {60.0, 0.0}, {12.0, 0.0}}, color = {95, 0, 191}, visible = true));
      connect(y3, Integrator1.y) annotation(
        Line(points = {{0.0, -65.0}, {0.0, -50.0}, {60.0, -50.0}, {60.0, 0.0}, {12.0, 0.0}}, color = {95, 0, 191}, visible = true));
      connect(y4, Integrator1.y) annotation(
        Line(points = {{-75.0, -65.0}, {-75.0, -50.0}, {60.0, -50.0}, {60.0, 0.0}, {12.0, 0.0}}, color = {95, 0, 191}, visible = true));
      connect(u1, Integrator1.u) annotation(
        Line(points = {{-110.0, 0.0}, {-34.0, 0.0}}, color = {95, 0, 191}, visible = true));
      connect(y1, y) annotation(
        Line(points = {{85.0, 55.0}, {12.5, 55.0}, {12.5, 55.0}, {-85.0, 55.0}}, color = {95, 0, 191}, visible = true));
      annotation(
        Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics),
        Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-80.0, -60.0}, {80.0, 20.0}}), Rectangle(visible = true, lineColor = {127, 0, 255}, lineThickness = 0.5, extent = {{-80.0, -60.0}, {80.0, 60.0}}), Line(visible = true, points = {{-100.0, 0.0}, {-80.0, 0.0}}, color = {127, 0, 255}, thickness = 0.5), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-100.0, 70.0}, {100.0, 100.0}}, textString = "%name", fontName = "Arial"), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-80.0, -6.0}, {80.0, 20.0}}, textString = "x0 = %x0", fontName = "Arial")}),
        Documentation(info = "<html>
This is the general continuous <b>Level</b> model of the System Dynamics methodology with a single inflow and no outflow.  It computes the level by integrating over the inflow rate.
</html>"));
    end Level1a;

    block CLevel1a "General System Dynamics controlling level with no outflow"
      constant Real inf = Modelica.Constants.inf;
      parameter Real x0 = 0 "Initial condition";
      parameter Real maxLevel = inf "Largest allowed value of stock";
      output Real level "Continuous state variable";
      Modelica.Blocks.Continuous.Integrator Integrator1(y_start = x0) annotation(
        Placement(visible = true, transformation(origin = {-50.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      SystemDynamics.Interfaces.MassInPort u1 "Inflow variable" annotation(
        Placement(visible = true, transformation(origin = {-110.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-110.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      SystemDynamics.Interfaces.MassOutPort y "State variable" annotation(
        Placement(visible = true, transformation(origin = {-85.0, 55.0}, extent = {{5.0, -5.0}, {-5.0, 5.0}}, rotation = 0), iconTransformation(origin = {-85.0, 55.0}, extent = {{5.0, -5.0}, {-5.0, 5.0}}, rotation = 0)));
      SystemDynamics.Interfaces.MassOutPort y1 "State variable" annotation(
        Placement(visible = true, transformation(origin = {85.0, 55.0}, extent = {{-5.0, -5.0}, {5.0, 5.0}}, rotation = 0), iconTransformation(origin = {85.0, 55.0}, extent = {{-5.0, -5.0}, {5.0, 5.0}}, rotation = 0)));
      SystemDynamics.Interfaces.MassOutPort y2 "State variable" annotation(
        Placement(visible = true, transformation(origin = {75.0, -65.0}, extent = {{-5.0, -5.0}, {5.0, 5.0}}, rotation = -90), iconTransformation(origin = {75.0, -65.0}, extent = {{-5.0, -5.0}, {5.0, 5.0}}, rotation = -90)));
      SystemDynamics.Interfaces.MassOutPort y3 "State variable" annotation(
        Placement(visible = true, transformation(origin = {0.0, -65.0}, extent = {{-5.0, -5.0}, {5.0, 5.0}}, rotation = -90), iconTransformation(origin = {0.0, -65.0}, extent = {{-5.0, -5.0}, {5.0, 5.0}}, rotation = -90)));
      Modelica.Blocks.Logical.LessThreshold LessThreshold1(threshold = maxLevel) annotation(
        Placement(visible = true, transformation(origin = {-50.0, -55.0}, extent = {{10.0, -10.0}, {-10.0, 10.0}}, rotation = 0)));
      Modelica.Blocks.Interfaces.BooleanOutput s "Control signal" annotation(
        Placement(visible = true, transformation(origin = {-85.0, -55.0}, extent = {{5.0, -5.0}, {-5.0, 5.0}}, rotation = 0), iconTransformation(origin = {-85.0, -55.0}, extent = {{5.0, -5.0}, {-5.0, 5.0}}, rotation = 0)));
    equation
      level = y;
      connect(y1, Integrator1.y) annotation(
        Line(points = {{85.0, 55.0}, {60.0, 55.0}, {60.0, 0.0}, {-39.0, 0.0}}, color = {95, 0, 191}, visible = true));
      connect(y2, Integrator1.y) annotation(
        Line(points = {{75.0, -65.0}, {75.0, -50.0}, {60.0, -50.0}, {60.0, 0.0}, {-39.0, 0.0}}, color = {95, 0, 191}, visible = true));
      connect(u1, Integrator1.u) annotation(
        Line(points = {{-110.0, 0.0}, {-62.0, 0.0}}, color = {95, 0, 191}, visible = true));
      connect(y1, y) annotation(
        Line(points = {{85.0, 55.0}, {12.5, 55.0}, {12.5, 55.0}, {-85.0, 55.0}}, color = {95, 0, 191}, visible = true));
      connect(LessThreshold1.y, s) annotation(
        Line(points = {{-61.0, -55.0}, {-85.0, -55.0}}, color = {255, 0, 255}, visible = true));
      connect(LessThreshold1.u, Integrator1.y) annotation(
        Line(points = {{-38.0, -55.0}, {-20.0, -55.0}, {-20.0, 0.0}, {-39.0, 0.0}}, color = {0, 0, 191}, visible = true));
      connect(y3, Integrator1.y) annotation(
        Line(points = {{0.0, -65.0}, {0.0, -50.0}, {60.0, -50.0}, {60.0, 0.0}, {-39.0, 0.0}}, color = {95, 0, 191}, visible = true));
      annotation(
        Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics),
        Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-80.0, -60.0}, {80.0, 20.0}}), Rectangle(visible = true, lineColor = {127, 0, 255}, lineThickness = 0.5, extent = {{-80.0, -60.0}, {80.0, 60.0}}), Line(visible = true, points = {{-100.0, 0.0}, {-80.0, 0.0}}, color = {127, 0, 255}, thickness = 0.5), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-100.0, 70.0}, {100.0, 100.0}}, textString = "%name", fontName = "Arial"), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-80.0, -6.0}, {80.0, 20.0}}, textString = "x0 = %x0", fontName = "Arial")}),
        Documentation(info = "<html>
This is the continuous controlling <b>Level</b> model of the System Dynamics methodology with a single inflow and no outflow.  It computes the level by integrating over the inflow rate. <p>
 
Once the level reaches its maximum allowed value, it sends a Boolean signal to its inflow rate element to tell it to stop sending more stuff.
</html>"));
    end CLevel1a;

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

    block CLevel1b "General System Dynamics controlling level with no inflow"
      parameter Real x0 = 0 "Initial condition";
      parameter Real minLevel = 0 "Smallest allowed value of stock";
      output Real level "Continuous state variable";
      Modelica.Blocks.Continuous.Integrator Integrator1(y_start = x0) annotation(
        Placement(visible = true, transformation(origin = {-30.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      SystemDynamics.Interfaces.MassInPort u1 "Outflow variable" annotation(
        Placement(visible = true, transformation(origin = {110.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {110.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      SystemDynamics.Interfaces.MassOutPort y "State variable" annotation(
        Placement(visible = true, transformation(origin = {-85.0, 55.0}, extent = {{5.0, -5.0}, {-5.0, 5.0}}, rotation = 0), iconTransformation(origin = {-85.0, 55.0}, extent = {{5.0, -5.0}, {-5.0, 5.0}}, rotation = 0)));
      SystemDynamics.Interfaces.MassOutPort y1 "State variable" annotation(
        Placement(visible = true, transformation(origin = {85.0, 55.0}, extent = {{-5.0, -5.0}, {5.0, 5.0}}, rotation = 0), iconTransformation(origin = {85.0, 55.0}, extent = {{-5.0, -5.0}, {5.0, 5.0}}, rotation = 0)));
      SystemDynamics.Interfaces.MassOutPort y2 "State variable" annotation(
        Placement(visible = true, transformation(origin = {0.0, -65.0}, extent = {{-5.0, -5.0}, {5.0, 5.0}}, rotation = -90), iconTransformation(origin = {0.0, -65.0}, extent = {{-5.0, -5.0}, {5.0, 5.0}}, rotation = -90)));
      SystemDynamics.Interfaces.MassOutPort y3 "State variable" annotation(
        Placement(visible = true, transformation(origin = {-75.0, -65.0}, extent = {{-5.0, -5.0}, {5.0, 5.0}}, rotation = -90), iconTransformation(origin = {-75.0, -65.0}, extent = {{-5.0, -5.0}, {5.0, 5.0}}, rotation = -90)));
      Modelica.Blocks.Math.Gain Gain1(k = -1) annotation(
        Placement(visible = true, transformation(origin = {-70.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      Modelica.Blocks.Interfaces.BooleanOutput s "Control signal" annotation(
        Placement(visible = true, transformation(origin = {85.0, -55.0}, extent = {{-5.0, -5.0}, {5.0, 5.0}}, rotation = 0), iconTransformation(origin = {85.0, -55.0}, extent = {{-5.0, -5.0}, {5.0, 5.0}}, rotation = 0)));
      Modelica.Blocks.Logical.GreaterThreshold GreaterThreshold1(threshold = minLevel) annotation(
        Placement(visible = true, transformation(origin = {50.0, -55.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
    equation
      level = y;
      connect(y, Integrator1.y) annotation(
        Line(points = {{-85.0, 55.0}, {0.0, 55.0}, {0.0, 0.0}, {-19.0, 0.0}}, color = {95, 0, 191}, visible = true));
      connect(y2, Integrator1.y) annotation(
        Line(points = {{6.3333, -43.3333}, {6.3333, 21.6667}, {-12.6667, 21.6667}}, color = {95, 0, 191}, visible = true, origin = {-6.3333, -21.6667}));
      connect(y, y1) annotation(
        Line(points = {{-85.0, 55.0}, {-2.5, 55.0}, {-2.5, 55.0}, {85.0, 55.0}}, color = {95, 0, 191}, visible = true));
      connect(u1, Gain1.u) annotation(
        Line(points = {{110.0, 0.0}, {90.0, 0.0}, {90.0, 70.0}, {-90.0, 70.0}, {-90.0, 0.0}, {-82.0, 0.0}}, color = {95, 0, 191}, visible = true));
      connect(Gain1.y, Integrator1.u) annotation(
        Line(points = {{-59.0, 0.0}, {-42.0, 0.0}}, color = {0, 0, 191}, visible = true));
      connect(GreaterThreshold1.y, s) annotation(
        Line(points = {{61.0, -55.0}, {85.0, -55.0}}, color = {255, 0, 255}, visible = true));
      connect(GreaterThreshold1.u, Integrator1.y) annotation(
        Line(points = {{38.0, -55.0}, {20.0, -55.0}, {20.0, 0.0}, {-19.0, 0.0}}, color = {0, 0, 191}, visible = true));
      connect(y3, Integrator1.y) annotation(
        Line(points = {{-75.0, -65.0}, {-75.0, -50.0}, {0.0, -50.0}, {0.0, 0.0}, {-19.0, 0.0}}, color = {95, 0, 191}, visible = true));
      annotation(
        Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics),
        Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-80.0, -60.0}, {80.0, 20.0}}), Rectangle(visible = true, lineColor = {127, 0, 255}, lineThickness = 0.5, extent = {{-80.0, -60.0}, {80.0, 60.0}}), Line(visible = true, points = {{80.0, 0.0}, {100.0, 0.0}}, color = {127, 0, 255}, thickness = 0.5), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-100.0, 70.0}, {100.0, 100.0}}, textString = "%name", fontName = "Arial"), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-80.0, -6.0}, {80.0, 20.0}}, textString = "x0 = %x0", fontName = "Arial")}),
        Documentation(info = "<html>
This is the continuous controlling <b>Level</b> model of the System Dynamics methodology with a single outflow and no inflow.  It computes the level by integrating over the negative outflow rate. <p>
 
Once the level reaches its minimum allowed value, it sends a Boolean signal to its outflow rate element to tell it to stop demanding more stuff.
</html>"));
    end CLevel1b;

    block Level2a "General System Dynamics level with two inflows"
      parameter Real x0 = 0 "Initial condition";
      output Real level "Continuous state variable";
      Modelica.Blocks.Continuous.Integrator Integrator1(y_start = x0) annotation(
        Placement(visible = true, transformation(origin = {20.0, 0.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
      SystemDynamics.Interfaces.MassInPort u1 "First inflow variable" annotation(
        Placement(visible = true, transformation(origin = {-110.0, 40.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-110.0, 40.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      SystemDynamics.Interfaces.MassInPort u2 "Second inflow variable" annotation(
        Placement(visible = true, transformation(origin = {-110.0, -40.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-110.0, -40.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      SystemDynamics.Interfaces.MassInPort u3 "Outflow variable" annotation(
        Placement(visible = true, transformation(origin = {110.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {110.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      SystemDynamics.Interfaces.MassOutPort y "State variable" annotation(
        Placement(visible = true, transformation(origin = {85.0, 55.0}, extent = {{-5.0, -5.0}, {5.0, 5.0}}, rotation = 0), iconTransformation(origin = {85.0, 55.0}, extent = {{-5.0, -5.0}, {5.0, 5.0}}, rotation = 0)));
      SystemDynamics.Interfaces.MassOutPort y1 "State variable" annotation(
        Placement(visible = true, transformation(origin = {75.0, -65.0}, extent = {{-5.0, -5.0}, {5.0, 5.0}}, rotation = -90), iconTransformation(origin = {75.0, -65.0}, extent = {{-5.0, -5.0}, {5.0, 5.0}}, rotation = -90)));
      SystemDynamics.Interfaces.MassOutPort y2 "State variable" annotation(
        Placement(visible = true, transformation(origin = {0.0, -65.0}, extent = {{-5.0, -5.0}, {5.0, 5.0}}, rotation = -90), iconTransformation(origin = {0.0, -65.0}, extent = {{-5.0, -5.0}, {5.0, 5.0}}, rotation = -90)));
      SystemDynamics.Interfaces.MassOutPort y3 "State variable" annotation(
        Placement(visible = true, transformation(origin = {-75.0, -65.0}, extent = {{-5.0, -5.0}, {5.0, 5.0}}, rotation = -90), iconTransformation(origin = {-75.0, -65.0}, extent = {{-5.0, -5.0}, {5.0, 5.0}}, rotation = -90)));
      Modelica.Blocks.Math.Add3 Add1(k3 = -1) annotation(
        Placement(visible = true, transformation(origin = {-40.0, 0.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
    equation
      level = y;
      connect(y, Integrator1.y) annotation(
        Line(points = {{85.0, 55.0}, {60.0, 55.0}, {60.0, 0.0}, {42.0, 0.0}}, color = {95, 0, 191}, visible = true));
      connect(y1, Integrator1.y) annotation(
        Line(points = {{75.0, -65.0}, {75.0, -50.0}, {60.0, -50.0}, {60.0, 0.0}, {42.0, 0.0}}, color = {95, 0, 191}, visible = true));
      connect(y2, Integrator1.y) annotation(
        Line(points = {{0.0, -65.0}, {0.0, -50.0}, {60.0, -50.0}, {60.0, 0.0}, {42.0, 0.0}}, color = {95, 0, 191}, visible = true));
      connect(y3, Integrator1.y) annotation(
        Line(points = {{-75.0, -65.0}, {-75.0, -50.0}, {60.0, -50.0}, {60.0, 0.0}, {42.0, 0.0}}, color = {95, 0, 191}, visible = true));
      connect(Add1.y, Integrator1.u) annotation(
        Line(points = {{-18.0, 0.0}, {-4.0, 0.0}}, color = {0, 0, 191}, visible = true));
      connect(u1, Add1.u1) annotation(
        Line(points = {{-110.0, 40.0}, {-90.0, 40.0}, {-90.0, 16.0}, {-64.0, 16.0}}, color = {191, 0, 191}, visible = true));
      connect(u2, Add1.u2) annotation(
        Line(points = {{-110.0, -40.0}, {-90.0, -40.0}, {-90.0, 0.0}, {-64.0, 0.0}}, color = {191, 0, 191}, visible = true));
      connect(u3, Add1.u3) annotation(
        Line(points = {{110.0, 0.0}, {80.0, 0.0}, {80.0, -34.0}, {-80.0, -34.0}, {-80.0, -16.0}, {-64.0, -16.0}}, color = {191, 0, 191}, visible = true));
      annotation(
        Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics),
        Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-80.0, -60.0}, {80.0, 20.0}}), Rectangle(visible = true, lineColor = {127, 0, 255}, lineThickness = 0.5, extent = {{-80.0, -60.0}, {80.0, 60.0}}), Line(visible = true, points = {{-100.0, 40.0}, {-80.0, 40.0}}, color = {127, 0, 255}, thickness = 0.5), Line(visible = true, points = {{-100.0, -40.0}, {-80.0, -40.0}}, color = {127, 0, 255}, thickness = 0.5), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-100.0, 70.0}, {100.0, 100.0}}, textString = "%name", fontName = "Arial"), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-80.0, -6.0}, {80.0, 20.0}}, textString = "x0 = %x0", fontName = "Arial"), Line(visible = true, points = {{80.0, 0.0}, {100.0, 0.0}}, color = {127, 0, 255}, thickness = 0.5)}),
        Documentation(info = "<html>
This is the general continuous <b>Level</b> model of the System Dynamics methodology with two inflows and a single outflow.  It computes the level by integrating over the difference between inflow and outflow rates.
</html>"));
    end Level2a;

    block Level2b "General System Dynamics level with two outflows"
      parameter Real x0 = 0 "Initial condition";
      output Real level "Continuous state variable";
      Modelica.Blocks.Continuous.Integrator Integrator1(y_start = x0) annotation(
        Placement(visible = true, transformation(origin = {20.0, 0.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
      SystemDynamics.Interfaces.MassInPort u1 "Inflow variable" annotation(
        Placement(visible = true, transformation(origin = {-110.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-110.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      SystemDynamics.Interfaces.MassInPort u2 "First outflow variable" annotation(
        Placement(visible = true, transformation(origin = {110.0, 40.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {110.0, 40.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      SystemDynamics.Interfaces.MassInPort u3 "Second outflow variable" annotation(
        Placement(visible = true, transformation(origin = {110.0, -40.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {110.0, -40.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      SystemDynamics.Interfaces.MassOutPort y "State variable" annotation(
        Placement(visible = true, transformation(origin = {-85.0, 55.0}, extent = {{5.0, -5.0}, {-5.0, 5.0}}, rotation = 0), iconTransformation(origin = {-85.0, 55.0}, extent = {{5.0, -5.0}, {-5.0, 5.0}}, rotation = 0)));
      SystemDynamics.Interfaces.MassOutPort y1 "State variable" annotation(
        Placement(visible = true, transformation(origin = {75.0, -65.0}, extent = {{-5.0, -5.0}, {5.0, 5.0}}, rotation = -90), iconTransformation(origin = {75.0, -65.0}, extent = {{-5.0, -5.0}, {5.0, 5.0}}, rotation = -90)));
      SystemDynamics.Interfaces.MassOutPort y2 "State variable" annotation(
        Placement(visible = true, transformation(origin = {0.0, -65.0}, extent = {{-5.0, -5.0}, {5.0, 5.0}}, rotation = -90), iconTransformation(origin = {0.0, -65.0}, extent = {{-5.0, -5.0}, {5.0, 5.0}}, rotation = -90)));
      SystemDynamics.Interfaces.MassOutPort y3 "State variable" annotation(
        Placement(visible = true, transformation(origin = {-75.0, -65.0}, extent = {{-5.0, -5.0}, {5.0, 5.0}}, rotation = -90), iconTransformation(origin = {-75.0, -65.0}, extent = {{-5.0, -5.0}, {5.0, 5.0}}, rotation = -90)));
      Modelica.Blocks.Math.Add3 Add1(k3 = -1, k1 = -1) annotation(
        Placement(visible = true, transformation(origin = {-40.0, 0.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
    equation
      level = y;
      connect(y, Integrator1.y) annotation(
        Line(points = {{-85.0, 55.0}, {60.0, 55.0}, {60.0, 0.0}, {42.0, 0.0}}, color = {95, 0, 191}, visible = true));
      connect(y1, Integrator1.y) annotation(
        Line(points = {{75.0, -65.0}, {75.0, -50.0}, {60.0, -50.0}, {60.0, 0.0}, {42.0, 0.0}}, color = {95, 0, 191}, visible = true));
      connect(y2, Integrator1.y) annotation(
        Line(points = {{0.0, -65.0}, {0.0, -50.0}, {60.0, -50.0}, {60.0, 0.0}, {42.0, 0.0}}, color = {95, 0, 191}, visible = true));
      connect(y3, Integrator1.y) annotation(
        Line(points = {{-75.0, -65.0}, {-75.0, -50.0}, {60.0, -50.0}, {60.0, 0.0}, {42.0, 0.0}}, color = {95, 0, 191}, visible = true));
      connect(Add1.y, Integrator1.u) annotation(
        Line(points = {{-18.0, 0.0}, {-4.0, 0.0}}, color = {0, 0, 191}, visible = true));
      connect(u1, Add1.u2) annotation(
        Line(points = {{-110.0, 0.0}, {-64.0, 0.0}}, color = {191, 0, 191}, visible = true));
      connect(u2, Add1.u1) annotation(
        Line(points = {{110.0, 40.0}, {90.0, 40.0}, {90.0, 80.0}, {-96.0, 80.0}, {-96.0, 16.0}, {-64.0, 16.0}}, color = {191, 0, 191}, visible = true));
      connect(u3, Add1.u3) annotation(
        Line(points = {{110.0, -40.0}, {90.0, -40.0}, {90.0, -80.0}, {-96.0, -80.0}, {-96.0, -16.0}, {-64.0, -16.0}}, color = {191, 0, 191}, visible = true));
      annotation(
        Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics),
        Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-80.0, -60.0}, {80.0, 20.0}}), Rectangle(visible = true, lineColor = {127, 0, 255}, lineThickness = 0.5, extent = {{-80.0, -60.0}, {80.0, 60.0}}), Line(visible = true, points = {{-100.0, 0.0}, {-80.0, 0.0}}, color = {127, 0, 255}, thickness = 0.5), Line(visible = true, points = {{80.0, 40.0}, {100.0, 40.0}}, color = {127, 0, 255}, thickness = 0.5), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-100.0, 70.0}, {100.0, 100.0}}, textString = "%name", fontName = "Arial"), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-80.0, -6.0}, {80.0, 20.0}}, textString = "x0 = %x0", fontName = "Arial"), Line(visible = true, points = {{80.0, -40.0}, {100.0, -40.0}}, color = {127, 0, 255}, thickness = 0.5)}),
        Documentation(info = "<html>
This is the general continuous <b>Level</b> model of the System Dynamics methodology with a single inflow and two outflows.  It computes the level by integrating over the difference between inflow and outflow rates.
</html>"));
    end Level2b;

    block Level3 "General System Dynamics level with two inflows and two outflows"
      parameter Real x0 = 0 "Initial condition";
      output Real level "Continuous state variable";
      Modelica.Blocks.Continuous.Integrator Integrator1(y_start = x0) annotation(
        Placement(visible = true, transformation(origin = {20.0, 0.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
      SystemDynamics.Interfaces.MassInPort u1 "First inflow variable" annotation(
        Placement(visible = true, transformation(origin = {-110.0, 40.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-110.0, 40.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      SystemDynamics.Interfaces.MassInPort u2 "Second inflow variable" annotation(
        Placement(visible = true, transformation(origin = {-110.0, -40.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-110.0, -40.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      SystemDynamics.Interfaces.MassInPort u3 "First outflow variable" annotation(
        Placement(visible = true, transformation(origin = {110.0, 40.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {110.0, 40.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      SystemDynamics.Interfaces.MassInPort u4 "Second outflow variable" annotation(
        Placement(visible = true, transformation(origin = {110.0, -40.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {110.0, -40.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      SystemDynamics.Interfaces.MassOutPort y "State variable" annotation(
        Placement(visible = true, transformation(origin = {75.0, -65.0}, extent = {{-5.0, -5.0}, {5.0, 5.0}}, rotation = -90), iconTransformation(origin = {75.0, -65.0}, extent = {{-5.0, -5.0}, {5.0, 5.0}}, rotation = -90)));
      SystemDynamics.Interfaces.MassOutPort y1 "State variable" annotation(
        Placement(visible = true, transformation(origin = {0.0, -65.0}, extent = {{-5.0, -5.0}, {5.0, 5.0}}, rotation = -90), iconTransformation(origin = {0.0, -65.0}, extent = {{-5.0, -5.0}, {5.0, 5.0}}, rotation = -90)));
      SystemDynamics.Interfaces.MassOutPort y2 "State variable" annotation(
        Placement(visible = true, transformation(origin = {-75.0, -65.0}, extent = {{-5.0, -5.0}, {5.0, 5.0}}, rotation = -90), iconTransformation(origin = {-75.0, -65.0}, extent = {{-5.0, -5.0}, {5.0, 5.0}}, rotation = -90)));
      Modelica.Blocks.Math.Add3 Add1(k1 = -1) annotation(
        Placement(visible = true, transformation(origin = {-40.0, 0.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
      Modelica.Blocks.Math.Add Add2 annotation(
        Placement(visible = true, transformation(origin = {-40.0, 60.0}, extent = {{20.0, -20.0}, {-20.0, 20.0}}, rotation = 0)));
    equation
      level = y;
      connect(y, Integrator1.y) annotation(
        Line(points = {{75.0, -65.0}, {75.0, -50.0}, {60.0, -50.0}, {60.0, 0.0}, {42.0, 0.0}}, color = {95, 0, 191}, visible = true));
      connect(y1, Integrator1.y) annotation(
        Line(points = {{0.0, -65.0}, {0.0, -50.0}, {60.0, -50.0}, {60.0, 0.0}, {42.0, 0.0}}, color = {95, 0, 191}, visible = true));
      connect(y2, Integrator1.y) annotation(
        Line(points = {{-75.0, -65.0}, {-75.0, -50.0}, {60.0, -50.0}, {60.0, 0.0}, {42.0, 0.0}}, color = {95, 0, 191}, visible = true));
      connect(Add1.y, Integrator1.u) annotation(
        Line(points = {{-18.0, 0.0}, {-4.0, 0.0}}, color = {0, 0, 191}, visible = true));
      connect(u2, Add1.u3) annotation(
        Line(points = {{-110.0, -40.0}, {-90.0, -40.0}, {-90.0, -16.0}, {-64.0, -16.0}}, color = {191, 0, 191}, visible = true));
      connect(u1, Add1.u2) annotation(
        Line(points = {{-110.0, 40.0}, {-90.0, 40.0}, {-90.0, 0.0}, {-64.0, 0.0}}, color = {191, 0, 191}, visible = true));
      connect(u3, Add2.u1) annotation(
        Line(points = {{110.0, 40.0}, {90.0, 40.0}, {90.0, 72.0}, {-16.0, 72.0}}, color = {191, 0, 191}, visible = true));
      connect(u4, Add2.u2) annotation(
        Line(points = {{110.0, -40.0}, {80.0, -40.0}, {80.0, 48.0}, {-16.0, 48.0}}, color = {191, 0, 191}, visible = true));
      connect(Add2.y, Add1.u1) annotation(
        Line(points = {{-62.0, 60.0}, {-80.0, 60.0}, {-80.0, 16.0}, {-64.0, 16.0}}, color = {0, 0, 191}, visible = true));
      annotation(
        Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics),
        Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-80.0, -60.0}, {80.0, 20.0}}), Rectangle(visible = true, lineColor = {127, 0, 255}, lineThickness = 0.5, extent = {{-80.0, -60.0}, {80.0, 60.0}}), Line(visible = true, points = {{-100.0, 40.0}, {-80.0, 40.0}}, color = {127, 0, 255}, thickness = 0.5), Line(visible = true, points = {{-100.0, -40.0}, {-80.0, -40.0}}, color = {127, 0, 255}, thickness = 0.5), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-100.0, 70.0}, {100.0, 100.0}}, textString = "%name", fontName = "Arial"), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-80.0, -6.0}, {80.0, 20.0}}, textString = "x0 = %x0", fontName = "Arial"), Line(visible = true, points = {{80.0, 40.0}, {100.0, 40.0}}, color = {127, 0, 255}, thickness = 0.5), Line(visible = true, points = {{80.0, -40.0}, {100.0, -40.0}}, color = {127, 0, 255}, thickness = 0.5)}),
        Documentation(info = "<html>
This is the general continuous <b>Level</b> model of the System Dynamics methodology with two inflows and two outflows.  It computes the level by integrating over the difference between inflow and outflow rates.
</html>"));
    end Level3;
  end Levels;