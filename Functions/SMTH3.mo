    block SMTH3 "Third-order exponential smoothing"
      parameter Real averaging_time = 1 "Averaging time";
      parameter Real smooth_init = 0 "Initial value of smoothed variable";
      SystemDynamics.Levels.Level1a Smooth1(x0 = smooth_init) annotation(
        Placement(visible = true, transformation(origin = {10.0, 80.0}, extent = {{-16.0, -14.0}, {16.0, 14.0}}, rotation = 0)));
      SystemDynamics.Rates.Rate_1 Change_in_Smooth1 annotation(
        Placement(visible = true, transformation(origin = {-40.0, 80.0}, extent = {{-16.0, -14.0}, {16.0, 14.0}}, rotation = 0)));
      SystemDynamics.Sources.Source source annotation(
        Placement(visible = true, transformation(origin = {-90.0, 80.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      SystemDynamics.Functions.Utilities.Change_In_Smooth ch_in_smooth1(averaging_time = averaging_time / 3) annotation(
        Placement(visible = true, transformation(origin = {-40.0, 50.0}, extent = {{-10.0, -12.0}, {10.0, 12.0}}, rotation = -270)));
      Modelica.Blocks.Interfaces.RealInput u "Input variable" annotation(
        Placement(visible = true, transformation(origin = {-110.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-110.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealOutput y "Output variable" annotation(
        Placement(visible = true, transformation(origin = {110.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {110.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      SystemDynamics.Levels.Level1a Smooth2(x0 = smooth_init) annotation(
        Placement(visible = true, transformation(origin = {40.0, 10.0}, extent = {{-16.0, -14.0}, {16.0, 14.0}}, rotation = 0)));
      SystemDynamics.Rates.Rate_1 Change_in_Smooth2 annotation(
        Placement(visible = true, transformation(origin = {-10.0, 10.0}, extent = {{-16.0, -14.0}, {16.0, 14.0}}, rotation = 0)));
      SystemDynamics.Sources.Source source1 annotation(
        Placement(visible = true, transformation(origin = {-60.0, 10.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      SystemDynamics.Functions.Utilities.Change_In_Smooth ch_in_smooth2(averaging_time = averaging_time / 3) annotation(
        Placement(visible = true, transformation(origin = {-10.0, -20.0}, extent = {{-10.0, -12.0}, {10.0, 12.0}}, rotation = -270)));
      SystemDynamics.Levels.Level1a Smooth3(x0 = smooth_init) annotation(
        Placement(visible = true, transformation(origin = {70.0, -54.0}, extent = {{-16.0, -14.0}, {16.0, 14.0}}, rotation = 0)));
      SystemDynamics.Rates.Rate_1 Change_in_Smooth3 annotation(
        Placement(visible = true, transformation(origin = {20.0, -54.0}, extent = {{-16.0, -14.0}, {16.0, 14.0}}, rotation = 0)));
      SystemDynamics.Sources.Source source2 annotation(
        Placement(visible = true, transformation(origin = {-30.0, -54.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      SystemDynamics.Functions.Utilities.Change_In_Smooth ch_in_smooth3(averaging_time = averaging_time / 3) annotation(
        Placement(visible = true, transformation(origin = {20.0, -84.0}, extent = {{-10.0, -12.0}, {10.0, 12.0}}, rotation = -270)));
    equation
      connect(Change_in_Smooth1.y1, Smooth1.u1) annotation(
        Line(points = {{-32.0, 80.0}, {-7.6, 80.0}}, color = {95, 0, 191}, visible = true));
      connect(source.MassInPort1, Change_in_Smooth1.y) annotation(
        Line(points = {{-79.0, 80.0}, {-48.0, 80.0}}, color = {95, 0, 191}, visible = true));
      connect(ch_in_smooth1.y, Change_in_Smooth1.u) annotation(
        Line(points = {{-40.0, 59.0}, {-40.0, 65.3}}, color = {0, 0, 191}, visible = true));
      connect(ch_in_smooth1.u2, Smooth1.y4) annotation(
        Line(points = {{-35.2, 41.0}, {-35.2, 34.0}, {-2.0, 34.0}, {-2.0, 70.9}}, color = {0, 0, 191}, visible = true));
      connect(Change_in_Smooth2.y1, Smooth2.u1) annotation(
        Line(points = {{-2.0, 10.0}, {4.1, 10.0}, {4.1, 10.0}, {10.2, 10.0}, {10.2, 10.0}, {22.4, 10.0}}, color = {95, 0, 191}, visible = true));
      connect(source1.MassInPort1, Change_in_Smooth2.y) annotation(
        Line(points = {{-49.0, 10.0}, {-33.5, 10.0}, {-33.5, 10.0}, {-18.0, 10.0}}, color = {95, 0, 191}, visible = true));
      connect(ch_in_smooth2.y, Change_in_Smooth2.u) annotation(
        Line(points = {{-10.0, -11.0}, {-10.0, -4.7}}, color = {0, 0, 191}, visible = true));
      connect(ch_in_smooth2.u2, Smooth2.y4) annotation(
        Line(points = {{-5.2, -29.0}, {-5.2, -36.0}, {28.0, -36.0}, {28.0, 0.9}}, color = {0, 0, 191}, visible = true));
      connect(Change_in_Smooth3.y1, Smooth3.u1) annotation(
        Line(points = {{28.0, -54.0}, {52.4, -54.0}}, color = {95, 0, 191}, visible = true));
      connect(source2.MassInPort1, Change_in_Smooth3.y) annotation(
        Line(points = {{-19.0, -54.0}, {12.0, -54.0}}, color = {95, 0, 191}, visible = true));
      connect(ch_in_smooth3.y, Change_in_Smooth3.u) annotation(
        Line(points = {{20.0, -75.0}, {20.0, -68.7}}, color = {0, 0, 191}, visible = true));
      connect(ch_in_smooth3.u2, Smooth3.y4) annotation(
        Line(points = {{24.8, -93.0}, {24.8, -100.0}, {58.0, -100.0}, {58.0, -63.1}}, color = {0, 0, 191}, visible = true));
      connect(u, ch_in_smooth1.u1) annotation(
        Line(points = {{-110.0, 0.0}, {-90.0, 0.0}, {-90.0, 34.0}, {-44.8, 34.0}, {-44.8, 41.0}}, color = {0, 0, 191}, visible = true));
      connect(ch_in_smooth2.u1, Smooth1.y3) annotation(
        Line(points = {{-14.8, -29.0}, {-14.8, -36.0}, {-40.0, -36.0}, {-40.0, 28.0}, {10.0, 28.0}, {10.0, 70.9}}, color = {0, 0, 191}, visible = true));
      connect(ch_in_smooth3.u1, Smooth2.y3) annotation(
        Line(points = {{15.2, -93.0}, {15.2, -100.0}, {-10.0, -100.0}, {-10.0, -40.0}, {40.0, -40.0}, {40.0, 0.9}}, color = {0, 0, 191}, visible = true));
      connect(y, Smooth3.y1) annotation(
        Line(points = {{110.0, 0.0}, {90.0, 0.0}, {90.0, -46.3}, {83.6, -46.3}}, color = {0, 0, 191}, visible = true));
      annotation(
        Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics),
        Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, lineColor = {0, 0, 191}, fillColor = {255, 255, 0}, fillPattern = FillPattern.Solid, extent = {{-100.0, -100.0}, {100.0, 100.0}}), Text(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 191}, extent = {{-64.0, -44.0}, {68.0, 42.0}}, textString = "SMTH3", fontName = "Arial")}),
        Documentation(info = "<html>
This is a third-order exponential smoothing function. <p>
 
In engineering terms, this would be called a third-order low-pass filter consisting of three first-order low-pass filters placed in series.  The third-order filter is characterized by the transfer function: <p>
<font color=red><b>G(s) = (1/(tau*s + 1))^3</b></font>. <p>
Each first-order filter has a time constants of: <p>
<font color=red><b>tau = averaging_time/3</b></font>. <p>
 
The initial values of the outputs of each of the three first-order filters can be set.  However, they can only be set together, i.e., only one parameter is provided for all three of them.  By default, they assume values of zero.
</html>"));
    end SMTH3;