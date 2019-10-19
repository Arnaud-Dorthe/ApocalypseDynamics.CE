    block DELAY1 "First-order exponential delaying"
      parameter Real averaging_time = 1 "Averaging time";
      parameter Real delay_init = 0 "Initial value of delayed variable";
      SystemDynamics.Interfaces.MassInPort massInPort "Mass input signal" annotation(
        Placement(visible = true, transformation(origin = {-110.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-110.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      SystemDynamics.Interfaces.MassOutPort massOutPort "Mass output signal" annotation(
        Placement(visible = true, transformation(origin = {110.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {110.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      SystemDynamics.Levels.Level Level1(x0 = delay_init) annotation(
        Placement(visible = true, transformation(origin = {-40.0, 0.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
      SystemDynamics.Rates.Rate_1 Rate1 annotation(
        Placement(visible = true, transformation(origin = {40.0, 0.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
      SystemDynamics.Auxiliary.Gain Delaying1(k = 1 / averaging_time) annotation(
        Placement(visible = true, transformation(origin = {9.0, -40.0}, extent = {{-29.0, 20.0}, {29.0, -20.0}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealOutput state "State signal" annotation(
        Placement(visible = true, transformation(origin = {0.0, 110.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -270), iconTransformation(origin = {0.0, 110.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -270)));
    equation
      connect(Level1.u1, massInPort) annotation(
        Line(points = {{-62.0, 0.0}, {-110.0, 0.0}}, color = {95, 0, 191}, visible = true));
      connect(Level1.u2, Rate1.y) annotation(
        Line(points = {{-18.0, 0.0}, {30.0, 0.0}}, color = {95, 0, 191}, visible = true));
      connect(Rate1.y1, massOutPort) annotation(
        Line(points = {{50.0, 0.0}, {110.0, 0.0}}, color = {95, 0, 191}, visible = true));
      connect(Delaying1.y, Rate1.u) annotation(
        Line(points = {{29.3, -40.0}, {40.0, -40.0}, {40.0, -21.0}}, color = {0, 0, 191}, visible = true));
      connect(Delaying1.u, Level1.y2) annotation(
        Line(points = {{-11.3, -40.0}, {-25.0, -40.0}, {-25.0, -13.0}}, color = {0, 0, 191}, visible = true));
      connect(state, Level1.y1) annotation(
        Line(points = {{7.6667, 66.0}, {7.6667, -33.0}, {-15.3333, -33.0}}, color = {0, 0, 191}, visible = true, origin = {-7.6667, 44.0}));
      annotation(
        Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100.0, -100.0}, {100.0, 100.0}}), Text(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 191}, extent = {{-64.0, -44.0}, {68.0, 42.0}}, textString = "DELAY1", fontName = "Arial")}),
        Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics),
        Documentation(info = "<html>
This is a first-order exponential delaying function.  It describes the delaying of mass flows. <p>
 
Incoming goods are delayed temporarily in an internal state.  The <b>state</b> output represents the amount of goods currently stored in the DELAY block. <p>
 
The initial number of items in the DELAY block can be set.  By default, it assumes a value of zero.
</html>"));
    end DELAY1;