    block SMTH1 "First-order exponential smoothing"
      parameter Real averaging_time = 1 "Averaging time";
      parameter Real smooth_init = 0 "Initial value of smoothed variable";
      SystemDynamics.Levels.Level1a Smooth_of_Input(x0 = smooth_init) annotation(
        Placement(visible = true, transformation(origin = {50.0, 0.0}, extent = {{-16.0, -14.0}, {16.0, 14.0}}, rotation = 0)));
      SystemDynamics.Rates.Rate_1 Change_in_Smooth annotation(
        Placement(visible = true, transformation(origin = {0.0, 0.0}, extent = {{-16.0, -14.0}, {16.0, 14.0}}, rotation = 0)));
      SystemDynamics.Sources.Source source annotation(
        Placement(visible = true, transformation(origin = {-50.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      SystemDynamics.Functions.Utilities.Change_In_Smooth change_in_smooth(averaging_time = averaging_time) annotation(
        Placement(visible = true, transformation(origin = {-0.0, -40.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = -270)),
        Dialog(group = "Variables"));
      Modelica.Blocks.Interfaces.RealInput u "Input variable" annotation(
        Placement(visible = true, transformation(origin = {-110.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-110.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealOutput y "Output variable" annotation(
        Placement(visible = true, transformation(origin = {110.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {110.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
    equation
      connect(Change_in_Smooth.y1, Smooth_of_Input.u1) annotation(
        Line(points = {{8.0, 0.0}, {20.0, -0.0}, {20.0, 0.0}, {32.4, 0.0}}, color = {95, 0, 191}, visible = true));
      connect(source.MassInPort1, Change_in_Smooth.y) annotation(
        Line(points = {{-39.0, 0.0}, {-23.5, 0.0}, {-23.5, 0.0}, {-8.0, 0.0}}, color = {95, 0, 191}, visible = true));
      connect(change_in_smooth.y, Change_in_Smooth.u) annotation(
        Line(points = {{-0.0, -26.5}, {0.0, -18.8}, {0.0, -18.8}, {0.0, -14.7}}, color = {0, 0, 191}, visible = true));
      connect(change_in_smooth.u2, Smooth_of_Input.y4) annotation(
        Line(points = {{6.0, -53.5}, {6.0, -60.0}, {38.0, -60.0}, {38.0, -9.1}}, color = {0, 0, 191}, visible = true));
      connect(change_in_smooth.u1, u) annotation(
        Line(points = {{-6.0, -53.5}, {-6.0, -60.0}, {-80.0, -60.0}, {-80.0, 0.0}, {-110.0, 0.0}}, color = {0, 0, 191}, visible = true));
      connect(y, Smooth_of_Input.y1) annotation(
        Line(points = {{110.0, 0.0}, {80.0, 0.0}, {80.0, 7.7}, {63.6, 7.7}}, color = {0, 0, 191}, visible = true));
      annotation(
        Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics),
        Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, lineColor = {0, 0, 191}, fillColor = {255, 255, 0}, fillPattern = FillPattern.Solid, extent = {{-100.0, -100.0}, {100.0, 100.0}}), Text(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 191}, extent = {{-64.0, -44.0}, {68.0, 42.0}}, textString = "SMTH1", fontName = "Arial")}),
        Documentation(info = "<html>
This is a first-order exponential smoothing function.  It describes the smoothing of information flows. <p>
 
In engineering terms, this would be called a first-order low-pass filter with the transfer function: <p>
<font color=red><b>G(s) = 1/(tau*s + 1)</b></font> <p>
and the time constant <p>
<font color=red><b>tau = averaging_time</b></font>. <p>
 
The initial value of the output can be set.  By default, it assumes a value of zero.
</html>"));
    end SMTH1;