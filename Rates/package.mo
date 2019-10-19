  package Rates "Rates of the System Dynamics methodology"
    extends Modelica.Icons.Library annotation(
      preferedView = "info",
      Documentation(info = "<html>
This package contains a set of different <b>Rates</b> (state derivative variables) frequently used in the System Dynamics methodology.
</html>"));

    block Rate_1 "Unrestricted rate element with one influencing variable"
      output Real rate;
      Modelica.Blocks.Interfaces.RealInput u "Signal inflow variable" annotation(
        Placement(visible = true, transformation(origin = {0.0, -105.0}, extent = {{-5.0, -5.0}, {5.0, 5.0}}, rotation = -270), iconTransformation(origin = {0.0, -105.0}, extent = {{-5.0, -5.0}, {5.0, 5.0}}, rotation = -270)));
      SystemDynamics.Interfaces.MassOutPort y "Mass inflow variable" annotation(
        Placement(visible = true, transformation(origin = {-50.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-50.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      SystemDynamics.Interfaces.MassOutPort y1 "Mass outflow variable" annotation(
        Placement(visible = true, transformation(origin = {50.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {50.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
    equation
      rate = y;
      connect(y, y1) annotation(
        Line(points = {{-50.0, 0.0}, {50.0, 0.0}}, color = {95, 0, 191}, visible = true));
      connect(y1, u) annotation(
        Line(points = {{50.0, 0.0}, {0.0, 0.0}, {0.0, -105.0}}, color = {95, 0, 191}, visible = true));
      annotation(
        Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Polygon(visible = true, lineColor = {127, 0, 255}, fillColor = {0, 255, 255}, fillPattern = FillPattern.Solid, lineThickness = 0.5, points = {{-60.0, -100.0}, {-60.0, -40.0}, {40.0, 26.0}, {-40.0, 26.0}, {60.0, -40.0}, {60.0, -100.0}, {-60.0, -100.0}}), Line(visible = true, points = {{-40.0, 0.0}, {40.0, 0.0}}, color = {127, 0, 255}, thickness = 0.5), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-100.0, 50.0}, {100.0, 88.0}}, textString = "%name", fontName = "Arial")}),
        Documentation(info = "<html>
This is the general System Dynamics unrestricted <b>Rate</b> element, whereby the rate itself is determined by a single variable in its laundry list.  The indicated direction of mass flow simply denotes the direction of positive mass flow.  However if the control signal of the rate assumes a negative value, mass will flow in the opposite direction.
</html>"),
        Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics));
    end Rate_1;

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

    block CInflow "Controlled inflow element"
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
        Placement(visible = true, transformation(origin = {65.0, -70.0}, extent = {{5.0, -5.0}, {-5.0, 5.0}}, rotation = 0), iconTransformation(origin = {65.0, -70.0}, extent = {{5.0, -5.0}, {-5.0, 5.0}}, rotation = 0)));
      Modelica.Blocks.Logical.Switch Switch1 annotation(
        Placement(visible = true, transformation(origin = {0.0, -60.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -270)));
      Modelica.Blocks.Sources.Constant Const1(k = 0) annotation(
        Placement(visible = true, transformation(origin = {40.0, -50.0}, extent = {{10.0, -10.0}, {-10.0, 10.0}}, rotation = 0)));
    equation
      rate = y;
      connect(y, y1) annotation(
        Line(points = {{-50.0, 0.0}, {50.0, 0.0}}, color = {95, 0, 191}, visible = true));
      connect(y1, Limiter1.y) annotation(
        Line(points = {{33.3333, 6.3333}, {-16.6667, 6.3333}, {-16.6667, -12.6667}}, color = {95, 0, 191}, visible = true, origin = {16.6667, -6.3333}));
      connect(u, Switch1.u1) annotation(
        Line(points = {{0.0, -105.0}, {0.0, -94.0}, {-8.0, -94.0}, {-8.0, -72.0}}, color = {0, 0, 191}, visible = true));
      connect(Switch1.y, Limiter1.u) annotation(
        Line(points = {{0.0, -49.0}, {0.0, -50.5}, {0.0, -50.5}, {-0.0, -42.0}}, color = {0, 0, 191}, visible = true));
      connect(s, Switch1.u2) annotation(
        Line(points = {{65.0, -70.0}, {50.0, -70.0}, {50.0, -88.0}, {0.0, -88.0}, {0.0, -72.0}, {0.0, -72.0}}, color = {255, 0, 255}, visible = true));
      connect(Switch1.u3, Const1.y) annotation(
        Line(points = {{8.0, -72.0}, {8.0, -80.0}, {20.0, -80.0}, {20.0, -50.0}, {29.0, -50.0}}, color = {0, 0, 191}, visible = true));
      annotation(
        Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Polygon(visible = true, lineColor = {127, 0, 255}, fillColor = {0, 255, 255}, fillPattern = FillPattern.Solid, lineThickness = 0.5, points = {{-60.0, -100.0}, {-60.0, -40.0}, {40.0, 26.0}, {-40.0, 26.0}, {60.0, -40.0}, {60.0, -100.0}, {-60.0, -100.0}}), Line(visible = true, points = {{-40.0, 0.0}, {40.0, 0.0}}, color = {127, 0, 255}, thickness = 0.5), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-100.0, 50.0}, {100.0, 88.0}}, textString = "%name", fontName = "Arial"), Line(visible = true, points = {{-40.0, -74.0}, {-12.0, -74.0}}, color = {0, 0, 255}, thickness = 0.5), Line(visible = true, points = {{8.0, -46.0}, {36.0, -46.0}}, color = {0, 0, 255}, thickness = 0.5), Line(visible = true, points = {{-12.0, -74.0}, {8.0, -46.0}}, color = {0, 0, 255}, thickness = 0.5)}),
        Documentation(info = "<html>
This is the System Dynamics controlled restricted <b>Inflow</b> element, whereby the rate itself is determined by a single variable in its laundry list.  This element is a restricted rate element with the additional feature that the downstream level can control the flow by telling it that it is full.  This is accomplished by a Boolean control signal from the downstream level to the rate element. <p>
 
The controlled inflow element should e.g. be used to model the access to a parking garage.  Additional cars are only admitted as long as the garage is not full.
</html>"),
        Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics));
    end CInflow;

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

    block CRate "Controlled rate element"
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
      Modelica.Blocks.Interfaces.BooleanInput s1 "Control signal" annotation(
        Placement(visible = true, transformation(origin = {-65.0, -70.0}, extent = {{-5.0, -5.0}, {5.0, 5.0}}, rotation = 0), iconTransformation(origin = {-65.0, -70.0}, extent = {{-5.0, -5.0}, {5.0, 5.0}}, rotation = 0)));
      Modelica.Blocks.Logical.Switch Switch1 annotation(
        Placement(visible = true, transformation(origin = {0.0, -60.0}, extent = {{10.0, -10.0}, {-10.0, 10.0}}, rotation = -90)));
      Modelica.Blocks.Sources.Constant Const1(k = 0) annotation(
        Placement(visible = true, transformation(origin = {-40.0, -40.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      Modelica.Blocks.Interfaces.BooleanInput s2 "Control signal" annotation(
        Placement(visible = true, transformation(origin = {65.0, -70.0}, extent = {{5.0, -5.0}, {-5.0, 5.0}}, rotation = 0), iconTransformation(origin = {65.0, -70.0}, extent = {{5.0, -5.0}, {-5.0, 5.0}}, rotation = 0)));
      Modelica.Blocks.Logical.And and1 annotation(
        Placement(visible = true, transformation(origin = {-40.0, -70.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
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
      connect(Const1.y, Switch1.u3) annotation(
        Line(points = {{-29.0, -40.0}, {-18.0, -40.0}, {-18.0, -80.0}, {-8.0, -80.0}, {-8.0, -72.0}}, color = {0, 0, 191}, visible = true));
      connect(and1.u1, s1) annotation(
        Line(points = {{-52.0, -70.0}, {-65.0, -70.0}}, color = {255, 0, 255}, visible = true));
      connect(and1.y, Switch1.u2) annotation(
        Line(points = {{-29.0, -70.0}, {-24.0, -70.0}, {-24.0, -86.0}, {0.0, -86.0}, {0.0, -72.0}}, color = {255, 0, 255}, visible = true));
      connect(s2, and1.u2) annotation(
        Line(points = {{65.0, -70.0}, {50.0, -70.0}, {50.0, -20.0}, {70.0, -20.0}, {70.0, 20.0}, {-80.0, 20.0}, {-80.0, -78.0}, {-52.0, -78.0}}, color = {255, 0, 255}, visible = true));
      annotation(
        Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Polygon(visible = true, lineColor = {127, 0, 255}, fillColor = {0, 255, 255}, fillPattern = FillPattern.Solid, lineThickness = 0.5, points = {{-60.0, -100.0}, {-60.0, -40.0}, {40.0, 26.0}, {-40.0, 26.0}, {60.0, -40.0}, {60.0, -100.0}, {-60.0, -100.0}}), Line(visible = true, points = {{-40.0, 0.0}, {40.0, 0.0}}, color = {127, 0, 255}, thickness = 0.5), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-100.0, 50.0}, {100.0, 88.0}}, textString = "%name", fontName = "Arial"), Line(visible = true, points = {{-40.0, -74.0}, {-12.0, -74.0}}, color = {0, 0, 255}, thickness = 0.5), Line(visible = true, points = {{8.0, -46.0}, {36.0, -46.0}}, color = {0, 0, 255}, thickness = 0.5), Line(visible = true, points = {{-12.0, -74.0}, {8.0, -46.0}}, color = {0, 0, 255}, thickness = 0.5)}),
        Documentation(info = "<html>
This is the System Dynamics controlled restricted <b>Rate</b> element, whereby the rate itself is determined by a single variable in its laundry list.  This element is a restricted rate element with the additional feature that the upstream level can control the flow by telling it that it is empty, and that the downstream level can control the flow by telling it that it is full.  This is accomplished by two Boolean control signals from the upstream and downstream levels to the rate element. <p>
 
The controlled rate element must be placed between two controlling levels.
</html>"),
        Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics));
    end CRate;

    block Rate_2 "Unrestricted additive rate element with two influencing variables"
      output Real rate;
      Modelica.Blocks.Math.Add Add1 annotation(
        Placement(visible = true, transformation(origin = {0.0, -40.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = -270)));
      Modelica.Blocks.Interfaces.RealInput u "First signal inflow variable" annotation(
        Placement(visible = true, transformation(origin = {-40.0, -105.0}, extent = {{-5.0, -5.0}, {5.0, 5.0}}, rotation = -270), iconTransformation(origin = {-40.0, -105.0}, extent = {{-5.0, -5.0}, {5.0, 5.0}}, rotation = -270)));
      Modelica.Blocks.Interfaces.RealInput u1 "Second signal inflow variable" annotation(
        Placement(visible = true, transformation(origin = {40.0, -105.0}, extent = {{-5.0, -5.0}, {5.0, 5.0}}, rotation = -270), iconTransformation(origin = {40.0, -105.0}, extent = {{-5.0, -5.0}, {5.0, 5.0}}, rotation = -270)));
      SystemDynamics.Interfaces.MassOutPort y "Mass inflow variable" annotation(
        Placement(visible = true, transformation(origin = {-50.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-50.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      SystemDynamics.Interfaces.MassOutPort y1 "Mass outflow variable" annotation(
        Placement(visible = true, transformation(origin = {50.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {50.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
    equation
      rate = y;
      connect(u, Add1.u1) annotation(
        Line(points = {{-40.0, -105.0}, {-40.0, -80.0}, {-12.0, -80.0}, {-12.0, -64.0}}, color = {0, 0, 191}, visible = true));
      connect(u1, Add1.u2) annotation(
        Line(points = {{40.0, -105.0}, {40.0, -80.0}, {12.0, -80.0}, {12.0, -64.0}}, color = {0, 0, 191}, visible = true));
      connect(Add1.y, y1) annotation(
        Line(points = {{0.0, -18.0}, {0.0, 0.0}, {50.0, 0.0}}, color = {0, 0, 191}, visible = true));
      connect(y, y1) annotation(
        Line(points = {{-50.0, 0.0}, {50.0, 0.0}}, color = {95, 0, 191}, visible = true));
      annotation(
        Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Polygon(visible = true, lineColor = {127, 0, 255}, fillColor = {0, 255, 255}, fillPattern = FillPattern.Solid, lineThickness = 0.5, points = {{-60.0, -100.0}, {-60.0, -40.0}, {40.0, 26.0}, {-40.0, 26.0}, {60.0, -40.0}, {60.0, -100.0}, {-60.0, -100.0}}), Line(visible = true, points = {{-40.0, 0.0}, {40.0, 0.0}}, color = {127, 0, 255}, thickness = 0.5), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-100.0, 50.0}, {100.0, 88.0}}, textString = "%name", fontName = "Arial"), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-26.0, -80.0}, {26.0, -42.0}}, textString = "+", fontName = "Arial")}),
        Documentation(info = "<html>
This is the general System Dynamics unrestricted additive <b>Rate</b> element, whereby the rate itself is determined by two variables in its laundry list.  The indicated direction of mass flow simply denotes the direction of positive mass flow.  However if the control signal of the rate assumes a negative value, mass will flow in the opposite direction.
</html>"),
        Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics));
    end Rate_2;

    block MRate_2 "Unrestricted multiplicative rate element with two influencing variables"
      output Real rate;
      Modelica.Blocks.Interfaces.RealInput u "First signal inflow variable" annotation(
        Placement(visible = true, transformation(origin = {-40.0, -105.0}, extent = {{-5.0, -5.0}, {5.0, 5.0}}, rotation = -270), iconTransformation(origin = {-40.0, -105.0}, extent = {{-5.0, -5.0}, {5.0, 5.0}}, rotation = -270)));
      Modelica.Blocks.Interfaces.RealInput u1 "Second signal inflow variable" annotation(
        Placement(visible = true, transformation(origin = {40.0, -105.0}, extent = {{-5.0, -5.0}, {5.0, 5.0}}, rotation = -270), iconTransformation(origin = {40.0, -105.0}, extent = {{-5.0, -5.0}, {5.0, 5.0}}, rotation = -270)));
      SystemDynamics.Interfaces.MassOutPort y "Mass inflow variable" annotation(
        Placement(visible = true, transformation(origin = {-50.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-50.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      SystemDynamics.Interfaces.MassOutPort y1 "Mass outflow variable" annotation(
        Placement(visible = true, transformation(origin = {50.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {50.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      SystemDynamics.Auxiliary.Prod_2 prod_2_1 annotation(
        Placement(visible = true, transformation(origin = {0.0, -50.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
    equation
      rate = y;
      connect(y, y1) annotation(
        Line(points = {{-50.0, 0.0}, {50.0, 0.0}}, color = {95, 0, 191}, visible = true));
      connect(prod_2_1.u1, u) annotation(
        Line(points = {{17.3333, 18.3333}, {-8.6667, 18.3333}, {-8.6667, -36.6667}}, color = {0, 0, 191}, visible = true, origin = {-31.3333, -68.3333}));
      connect(prod_2_1.u2, u1) annotation(
        Line(points = {{-17.3333, 18.3333}, {8.6667, 18.3333}, {8.6667, -36.6667}}, color = {0, 0, 191}, visible = true, origin = {31.3333, -68.3333}));
      connect(y1, prod_2_1.y) annotation(
        Line(points = {{50.0, 0.0}, {0.0, 0.0}, {0.0, -36.0}}, color = {95, 0, 191}, visible = true));
      annotation(
        Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Polygon(visible = true, lineColor = {127, 0, 255}, fillColor = {0, 255, 255}, fillPattern = FillPattern.Solid, lineThickness = 0.5, points = {{-60.0, -100.0}, {-60.0, -40.0}, {40.0, 26.0}, {-40.0, 26.0}, {60.0, -40.0}, {60.0, -100.0}, {-60.0, -100.0}}), Line(visible = true, points = {{-40.0, 0.0}, {40.0, 0.0}}, color = {127, 0, 255}, thickness = 0.5), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-100.0, 50.0}, {100.0, 88.0}}, textString = "%name", fontName = "Arial"), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-29.0, -98.0}, {31.0, -42.0}}, textString = "*", fontName = "Arial")}),
        Documentation(info = "<html>
This is the general System Dynamics unrestricted multiplicative <b>Rate</b> element, whereby the rate itself is determined by two variables in its laundry list.  The indicated direction of mass flow simply denotes the direction of positive mass flow.  However if the control signal of the rate assumes a negative value, mass will flow in the opposite direction.
</html>"),
        Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics));
    end MRate_2;

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

    block MRate_3 "Unrestricted multiplicative rate element with three influencing variables"
      output Real rate;
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
      SystemDynamics.Auxiliary.Prod_3 prod_3_1 annotation(
        Placement(visible = true, transformation(origin = {0.0, -50.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
    equation
      rate = y;
      connect(y, y1) annotation(
        Line(points = {{-50.0, 0.0}, {50.0, 0.0}}, color = {95, 0, 191}, visible = true));
      connect(prod_3_1.u1, u) annotation(
        Line(points = {{17.3333, 18.3333}, {-8.6667, 18.3333}, {-8.6667, -36.6667}}, color = {0, 0, 191}, visible = true, origin = {-31.3333, -68.3333}));
      connect(prod_3_1.u2, u1) annotation(
        Line(points = {{0.0, 20.5}, {0.0, -20.5}}, color = {0, 0, 191}, visible = true, origin = {0.0, -84.5}));
      connect(prod_3_1.u3, u2) annotation(
        Line(points = {{-17.3333, 18.3333}, {8.6667, 18.3333}, {8.6667, -36.6667}}, color = {0, 0, 191}, visible = true, origin = {31.3333, -68.3333}));
      connect(y1, prod_3_1.y) annotation(
        Line(points = {{50.0, 0.0}, {0.0, 0.0}, {0.0, -36.0}}, color = {95, 0, 191}, visible = true));
      annotation(
        Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Polygon(visible = true, lineColor = {127, 0, 255}, fillColor = {0, 255, 255}, fillPattern = FillPattern.Solid, lineThickness = 0.5, points = {{-60.0, -100.0}, {-60.0, -40.0}, {40.0, 26.0}, {-40.0, 26.0}, {60.0, -40.0}, {60.0, -100.0}, {-60.0, -100.0}}), Line(visible = true, points = {{-40.0, 0.0}, {40.0, 0.0}}, color = {127, 0, 255}, thickness = 0.5), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-100.0, 50.0}, {100.0, 88.0}}, textString = "%name", fontName = "Arial"), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-30.0, -98.0}, {30.0, -42.0}}, textString = "*", fontName = "Arial")}),
        Documentation(info = "<html>
This is the general System Dynamics unrestricted multiplicative <b>Rate</b> element, whereby the rate itself is determined by three variables in its laundry list.  The indicated direction of mass flow simply denotes the direction of positive mass flow.  However if the control signal of the rate assumes a negative value, mass will flow in the opposite direction.
</html>"),
        Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics));
    end MRate_3;

    block Rate_4 "Unrestricted additive rate element with four influencing variables"
      output Real rate;
      Modelica.Blocks.Math.Add Add1 annotation(
        Placement(visible = true, transformation(origin = {-30.0, -70.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      Modelica.Blocks.Math.Add3 Add3_1 annotation(
        Placement(visible = true, transformation(origin = {0.0, -30.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -270)));
      Modelica.Blocks.Interfaces.RealInput u "First signal inflow variable" annotation(
        Placement(visible = true, transformation(origin = {-65.0, -69.0}, extent = {{-5.0, -5.0}, {5.0, 5.0}}, rotation = 0), iconTransformation(origin = {-65.0, -69.0}, extent = {{-5.0, -5.0}, {5.0, 5.0}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealInput u1 "Second signal inflow variable" annotation(
        Placement(visible = true, transformation(origin = {-40.0, -105.0}, extent = {{-5.0, -5.0}, {5.0, 5.0}}, rotation = -270), iconTransformation(origin = {-40.0, -105.0}, extent = {{-5.0, -5.0}, {5.0, 5.0}}, rotation = -270)));
      Modelica.Blocks.Interfaces.RealInput u2 "Third signal inflow variable" annotation(
        Placement(visible = true, transformation(origin = {40.0, -105.0}, extent = {{-5.0, -5.0}, {5.0, 5.0}}, rotation = -270), iconTransformation(origin = {40.0, -105.0}, extent = {{-5.0, -5.0}, {5.0, 5.0}}, rotation = -270)));
      Modelica.Blocks.Interfaces.RealInput u3 "Fourth signal inflow variable" annotation(
        Placement(visible = true, transformation(origin = {65.0, -69.0}, extent = {{-5.0, -5.0}, {5.0, 5.0}}, rotation = -180), iconTransformation(origin = {65.0, -69.0}, extent = {{-5.0, -5.0}, {5.0, 5.0}}, rotation = -180)));
      SystemDynamics.Interfaces.MassOutPort y "Mass inflow variable" annotation(
        Placement(visible = true, transformation(origin = {-50.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-50.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      SystemDynamics.Interfaces.MassOutPort y1 "Mass outflow variable" annotation(
        Placement(visible = true, transformation(origin = {50.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {50.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
    equation
      rate = y;
      connect(u, Add1.u1) annotation(
        Line(points = {{-65.0, -69.0}, {-52.0, -69.0}, {-52.0, -64.0}, {-42.0, -64.0}}, color = {0, 0, 191}, visible = true));
      connect(u1, Add1.u2) annotation(
        Line(points = {{-40.0, -105.0}, {-40.0, -90.0}, {-52.0, -90.0}, {-52.0, -76.0}, {-42.0, -76.0}}, color = {0, 0, 191}, visible = true));
      connect(u2, Add3_1.u2) annotation(
        Line(points = {{40.0, -105.0}, {40.0, -80.0}, {0.0, -80.0}, {0.0, -42.0}}, color = {0, 0, 191}, visible = true));
      connect(Add3_1.u3, u3) annotation(
        Line(points = {{8.0, -42.0}, {8.0, -69.0}, {65.0, -69.0}}, color = {0, 0, 191}, visible = true));
      connect(Add1.y, Add3_1.u1) annotation(
        Line(points = {{-19.0, -70.0}, {-8.0, -70.0}, {-8.0, -42.0}}, color = {0, 0, 191}, visible = true));
      connect(Add3_1.y, y1) annotation(
        Line(points = {{0.0, -19.0}, {0.0, 0.0}, {50.0, 0.0}}, color = {0, 0, 191}, visible = true));
      connect(y, y1) annotation(
        Line(points = {{-50.0, 0.0}, {50.0, 0.0}}, color = {95, 0, 191}, visible = true));
      annotation(
        Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Polygon(visible = true, lineColor = {127, 0, 255}, fillColor = {0, 255, 255}, fillPattern = FillPattern.Solid, lineThickness = 0.5, points = {{-60.0, -100.0}, {-60.0, -40.0}, {40.0, 26.0}, {-40.0, 26.0}, {60.0, -40.0}, {60.0, -100.0}, {-60.0, -100.0}}), Line(visible = true, points = {{-40.0, 0.0}, {40.0, 0.0}}, color = {127, 0, 255}, thickness = 0.5), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-100.0, 50.0}, {100.0, 88.0}}, textString = "%name", fontName = "Arial"), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-26.0, -80.0}, {26.0, -42.0}}, textString = "+", fontName = "Arial")}),
        Documentation(info = "<html>
This is the general System Dynamics unrestricted additive <b>Rate</b> element, whereby the rate itself is determined by four variables in its laundry list.  The indicated direction of mass flow simply denotes the direction of positive mass flow.  However if the control signal of the rate assumes a negative value, mass will flow in the opposite direction.
</html>"),
        Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics));
    end Rate_4;

    block MRate_4 "Unrestricted multiplicative rate element with four influencing variables"
      output Real rate;
      Modelica.Blocks.Interfaces.RealInput u "First signal inflow variable" annotation(
        Placement(visible = true, transformation(origin = {-65.0, -70.0}, extent = {{-5.0, -5.0}, {5.0, 5.0}}, rotation = 0), iconTransformation(origin = {-65.0, -70.0}, extent = {{-5.0, -5.0}, {5.0, 5.0}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealInput u1 "Second signal inflow variable" annotation(
        Placement(visible = true, transformation(origin = {-40.0, -105.0}, extent = {{-5.0, -5.0}, {5.0, 5.0}}, rotation = -270), iconTransformation(origin = {-40.0, -105.0}, extent = {{-5.0, -5.0}, {5.0, 5.0}}, rotation = -270)));
      Modelica.Blocks.Interfaces.RealInput u2 "Third signal inflow variable" annotation(
        Placement(visible = true, transformation(origin = {40.0, -105.0}, extent = {{-5.0, -5.0}, {5.0, 5.0}}, rotation = -270), iconTransformation(origin = {40.0, -105.0}, extent = {{-5.0, -5.0}, {5.0, 5.0}}, rotation = -270)));
      Modelica.Blocks.Interfaces.RealInput u3 "Fourth signal inflow variable" annotation(
        Placement(visible = true, transformation(origin = {65.0, -70.0}, extent = {{-5.0, -5.0}, {5.0, 5.0}}, rotation = -180), iconTransformation(origin = {65.0, -70.0}, extent = {{-5.0, -5.0}, {5.0, 5.0}}, rotation = -180)));
      SystemDynamics.Interfaces.MassOutPort y "Mass inflow variable" annotation(
        Placement(visible = true, transformation(origin = {-50.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-50.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      SystemDynamics.Interfaces.MassOutPort y1 "Mass outflow variable" annotation(
        Placement(visible = true, transformation(origin = {50.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {50.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      SystemDynamics.Auxiliary.Prod_4 prod_4_1 annotation(
        Placement(visible = true, transformation(origin = {0.0, -50.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
    equation
      rate = y;
      connect(y, y1) annotation(
        Line(points = {{-50.0, 0.0}, {50.0, 0.0}}, color = {95, 0, 191}, visible = true));
      connect(u, prod_4_1.u1) annotation(
        Line(points = {{-65.0, -70.0}, {-50.0, -70.0}, {-50.0, -50.0}, {-14.0, -50.0}}, color = {0, 0, 191}, visible = true));
      connect(u1, prod_4_1.u2) annotation(
        Line(points = {{-40.0, -105.0}, {-40.0, -80.0}, {-8.0, -80.0}, {-8.0, -61.2}}, color = {0, 0, 191}, visible = true));
      connect(u2, prod_4_1.u3) annotation(
        Line(points = {{40.0, -105.0}, {40.0, -80.0}, {8.0, -80.0}, {8.0, -61.2}}, color = {0, 0, 191}, visible = true));
      connect(u3, prod_4_1.u4) annotation(
        Line(points = {{65.0, -70.0}, {50.0, -70.0}, {50.0, -50.0}, {14.0, -50.0}}, color = {0, 0, 191}, visible = true));
      connect(y1, prod_4_1.y) annotation(
        Line(points = {{50.0, 0.0}, {0.0, 0.0}, {0.0, -36.0}}, color = {95, 0, 191}, visible = true));
      annotation(
        Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Polygon(visible = true, lineColor = {127, 0, 255}, fillColor = {0, 255, 255}, fillPattern = FillPattern.Solid, lineThickness = 0.5, points = {{-60.0, -100.0}, {-60.0, -40.0}, {40.0, 26.0}, {-40.0, 26.0}, {60.0, -40.0}, {60.0, -100.0}, {-60.0, -100.0}}), Line(visible = true, points = {{-40.0, 0.0}, {40.0, 0.0}}, color = {127, 0, 255}, thickness = 0.5), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-100.0, 50.0}, {100.0, 88.0}}, textString = "%name", fontName = "Arial"), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-30.0, -98.0}, {30.0, -42.0}}, textString = "*", fontName = "Arial")}),
        Documentation(info = "<html>
This is the general System Dynamics unrestricted multiplicative <b>Rate</b> element, whereby the rate itself is determined by four variables in its laundry list.  The indicated direction of mass flow simply denotes the direction of positive mass flow.  However if the control signal of the rate assumes a negative value, mass will flow in the opposite direction.
</html>"),
        Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics));
    end MRate_4;

    block Rate_5 "Unrestricted additive rate element with five influencing variables"
      output Real rate;
      Modelica.Blocks.Math.Add3 Add3_1 annotation(
        Placement(visible = true, transformation(origin = {-30.0, -60.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -270)));
      Modelica.Blocks.Math.Add3 Add3_2 annotation(
        Placement(visible = true, transformation(origin = {0.0, -20.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -270)));
      Modelica.Blocks.Interfaces.RealInput u "First signal inflow variable" annotation(
        Placement(visible = true, transformation(origin = {-65.0, -69.0}, extent = {{-5.0, -5.0}, {5.0, 5.0}}, rotation = 0), iconTransformation(origin = {-65.0, -69.0}, extent = {{-5.0, -5.0}, {5.0, 5.0}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealInput u1 "Second signal inflow variable" annotation(
        Placement(visible = true, transformation(origin = {-40.0, -105.0}, extent = {{-5.0, -5.0}, {5.0, 5.0}}, rotation = -270), iconTransformation(origin = {-40.0, -105.0}, extent = {{-5.0, -5.0}, {5.0, 5.0}}, rotation = -270)));
      Modelica.Blocks.Interfaces.RealInput u2 "Third signal inflow variable" annotation(
        Placement(visible = true, transformation(origin = {0.0, -105.0}, extent = {{-5.0, -5.0}, {5.0, 5.0}}, rotation = -270), iconTransformation(origin = {0.0, -105.0}, extent = {{-5.0, -5.0}, {5.0, 5.0}}, rotation = -270)));
      Modelica.Blocks.Interfaces.RealInput u3 "Fourth signal inflow variable" annotation(
        Placement(visible = true, transformation(origin = {40.0, -105.0}, extent = {{-5.0, -5.0}, {5.0, 5.0}}, rotation = -270), iconTransformation(origin = {40.0, -105.0}, extent = {{-5.0, -5.0}, {5.0, 5.0}}, rotation = -270)));
      Modelica.Blocks.Interfaces.RealInput u4 "Fifth signal inflow variable" annotation(
        Placement(visible = true, transformation(origin = {65.0, -69.0}, extent = {{-5.0, -5.0}, {5.0, 5.0}}, rotation = -180), iconTransformation(origin = {65.0, -69.0}, extent = {{-5.0, -5.0}, {5.0, 5.0}}, rotation = -180)));
      SystemDynamics.Interfaces.MassOutPort y "Mass inflow variable" annotation(
        Placement(visible = true, transformation(origin = {-50.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-50.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      SystemDynamics.Interfaces.MassOutPort y1 "Mass outflow variable" annotation(
        Placement(visible = true, transformation(origin = {50.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {50.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
    equation
      rate = y;
      connect(u, Add3_1.u1) annotation(
        Line(points = {{-65.0, -69.0}, {-50.0, -69.0}, {-50.0, -80.0}, {-38.0, -80.0}, {-38.0, -72.0}}, color = {0, 0, 191}, visible = true));
      connect(u1, Add3_1.u2) annotation(
        Line(points = {{-40.0, -105.0}, {-40.0, -86.0}, {-30.0, -86.0}, {-30.0, -72.0}}, color = {0, 0, 191}, visible = true));
      connect(u2, Add3_1.u3) annotation(
        Line(points = {{0.0, -105.0}, {0.0, -86.0}, {-22.0, -86.0}, {-22.0, -72.0}}, color = {0, 0, 191}, visible = true));
      connect(u3, Add3_2.u2) annotation(
        Line(points = {{40.0, -105.0}, {40.0, -80.0}, {0.0, -80.0}, {0.0, -32.0}}, color = {0, 0, 191}, visible = true));
      connect(Add3_1.y, Add3_2.u1) annotation(
        Line(points = {{-30.0, -49.0}, {-30.0, -40.0}, {-8.0, -40.0}, {-8.0, -32.0}}, color = {0, 0, 191}, visible = true));
      connect(u4, Add3_2.u3) annotation(
        Line(points = {{65.0, -69.0}, {8.0, -69.0}, {8.0, -32.0}}, color = {0, 0, 191}, visible = true));
      connect(Add3_2.y, y1) annotation(
        Line(points = {{0.0, -9.0}, {0.0, 0.0}, {50.0, 0.0}}, color = {0, 0, 191}, visible = true));
      connect(y, y1) annotation(
        Line(points = {{-50.0, 0.0}, {50.0, 0.0}}, color = {95, 0, 191}, visible = true));
      annotation(
        Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Polygon(visible = true, lineColor = {127, 0, 255}, fillColor = {0, 255, 255}, fillPattern = FillPattern.Solid, lineThickness = 0.5, points = {{-60.0, -100.0}, {-60.0, -40.0}, {40.0, 26.0}, {-40.0, 26.0}, {60.0, -40.0}, {60.0, -100.0}, {-60.0, -100.0}}), Line(visible = true, points = {{-40.0, 0.0}, {40.0, 0.0}}, color = {127, 0, 255}, thickness = 0.5), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-100.0, 50.0}, {100.0, 88.0}}, textString = "%name", fontName = "Arial"), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-26.0, -80.0}, {26.0, -42.0}}, textString = "+", fontName = "Arial")}),
        Documentation(info = "<html>
This is the general System Dynamics unrestricted additive <b>Rate</b> element, whereby the rate itself is determined by five variables in its laundry list.  The indicated direction of mass flow simply denotes the direction of positive mass flow.  However if the control signal of the rate assumes a negative value, mass will flow in the opposite direction.
</html>"),
        Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics));
    end Rate_5;

    block MRate_5 "Unrestricted multiplicative rate element with five influencing variables"
      output Real rate;
      Modelica.Blocks.Interfaces.RealInput u "First signal inflow variable" annotation(
        Placement(visible = true, transformation(origin = {-65.0, -70.0}, extent = {{-5.0, -5.0}, {5.0, 5.0}}, rotation = 0), iconTransformation(origin = {-65.0, -70.0}, extent = {{-5.0, -5.0}, {5.0, 5.0}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealInput u1 "Second signal inflow variable" annotation(
        Placement(visible = true, transformation(origin = {-40.0, -105.0}, extent = {{-5.0, -5.0}, {5.0, 5.0}}, rotation = -270), iconTransformation(origin = {-40.0, -105.0}, extent = {{-5.0, -5.0}, {5.0, 5.0}}, rotation = -270)));
      Modelica.Blocks.Interfaces.RealInput u2 "Third signal inflow variable" annotation(
        Placement(visible = true, transformation(origin = {0.0, -105.0}, extent = {{-5.0, -5.0}, {5.0, 5.0}}, rotation = -270), iconTransformation(origin = {0.0, -105.0}, extent = {{-5.0, -5.0}, {5.0, 5.0}}, rotation = -270)));
      Modelica.Blocks.Interfaces.RealInput u3 "Fourth signal inflow variable" annotation(
        Placement(visible = true, transformation(origin = {40.0, -105.0}, extent = {{-5.0, -5.0}, {5.0, 5.0}}, rotation = -270), iconTransformation(origin = {40.0, -105.0}, extent = {{-5.0, -5.0}, {5.0, 5.0}}, rotation = -270)));
      Modelica.Blocks.Interfaces.RealInput u4 "Fifth signal inflow variable" annotation(
        Placement(visible = true, transformation(origin = {65.0, -70.0}, extent = {{-5.0, -5.0}, {5.0, 5.0}}, rotation = -180), iconTransformation(origin = {65.0, -70.0}, extent = {{-5.0, -5.0}, {5.0, 5.0}}, rotation = -180)));
      SystemDynamics.Interfaces.MassOutPort y "Mass inflow variable" annotation(
        Placement(visible = true, transformation(origin = {-50.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-50.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      SystemDynamics.Interfaces.MassOutPort y1 "Mass outflow variable" annotation(
        Placement(visible = true, transformation(origin = {50.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {50.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      SystemDynamics.Auxiliary.Prod_5 prod_5_1 annotation(
        Placement(visible = true, transformation(origin = {0.0, -50.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
    equation
      rate = y;
      connect(y, y1) annotation(
        Line(points = {{-50.0, 0.0}, {50.0, 0.0}}, color = {95, 0, 191}, visible = true));
      connect(y1, prod_5_1.y) annotation(
        Line(points = {{50.0, 0.0}, {0.0, 0.0}, {0.0, -36.0}}, color = {95, 0, 191}, visible = true));
      connect(u, prod_5_1.u1) annotation(
        Line(points = {{-65.0, -70.0}, {-50.0, -70.0}, {-50.0, -50.0}, {-14.0, -50.0}}, color = {0, 0, 191}, visible = true));
      connect(u1, prod_5_1.u2) annotation(
        Line(points = {{-40.0, -105.0}, {-40.0, -80.0}, {-9.2, -80.0}, {-9.2, -60.0}}, color = {0, 0, 191}, visible = true));
      connect(u2, prod_5_1.u3) annotation(
        Line(points = {{0.0, -20.5}, {0.0, 20.5}}, color = {0, 0, 191}, visible = true, origin = {0.0, -84.5}));
      connect(u3, prod_5_1.u4) annotation(
        Line(points = {{40.0, -105.0}, {40.0, -80.0}, {9.2, -80.0}, {9.2, -60.0}}, color = {0, 0, 191}, visible = true));
      connect(u4, prod_5_1.u5) annotation(
        Line(points = {{65.0, -70.0}, {50.0, -70.0}, {50.0, -50.0}, {14.0, -50.0}}, color = {0, 0, 191}, visible = true));
      annotation(
        Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Polygon(visible = true, lineColor = {127, 0, 255}, fillColor = {0, 255, 255}, fillPattern = FillPattern.Solid, lineThickness = 0.5, points = {{-60.0, -100.0}, {-60.0, -40.0}, {40.0, 26.0}, {-40.0, 26.0}, {60.0, -40.0}, {60.0, -100.0}, {-60.0, -100.0}}), Line(visible = true, points = {{-40.0, 0.0}, {40.0, 0.0}}, color = {127, 0, 255}, thickness = 0.5), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-100.0, 50.0}, {100.0, 88.0}}, textString = "%name", fontName = "Arial"), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-30.0, -98.0}, {30.0, -42.0}}, textString = "*", fontName = "Arial")}),
        Documentation(info = "<html>
This is the general System Dynamics unrestricted multiplicative <b>Rate</b> element, whereby the rate itself is determined by five variables in its laundry list.  The indicated direction of mass flow simply denotes the direction of positive mass flow.  However if the control signal of the rate assumes a negative value, mass will flow in the opposite direction.
</html>"),
        Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics));
    end MRate_5;
  end Rates;