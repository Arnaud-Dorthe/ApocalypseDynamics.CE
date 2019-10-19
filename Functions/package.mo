  package Functions "Functions of the System Dynamics methodology"
    extends Modelica.Icons.Library annotation(
      preferedView = "info",
      Documentation(info = "<html>
This package contains a number of standard functional relationships used in the System Dynamics methodology.
</html>"));

    block Dead_Time "Delay function"
      parameter Modelica.SIunits.Time delayTime = 1 "Delay time of output with respect to input signal";
      Modelica.Blocks.Interfaces.RealInput u "Input variable" annotation(
        Placement(visible = true, transformation(origin = {-110.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-110.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealOutput y "Output variable" annotation(
        Placement(visible = true, transformation(origin = {110.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {110.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      Modelica.Blocks.Nonlinear.FixedDelay FixedDelay(delayTime = delayTime) annotation(
        Placement(visible = true, transformation(origin = {0.0, 0.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
    equation
      connect(u, FixedDelay.u) annotation(
        Line(points = {{-110.0, 0.0}, {-24.0, 0.0}}, color = {0, 0, 191}, visible = true));
      connect(FixedDelay.y, y) annotation(
        Line(points = {{22.0, 0.0}, {110.0, 0.0}}, color = {0, 0, 191}, visible = true));
      annotation(
        Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, lineColor = {0, 0, 191}, fillColor = {255, 255, 0}, fillPattern = FillPattern.Solid, extent = {{-100.0, -100.0}, {100.0, 100.0}}), Text(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 191}, extent = {{-64.0, -44.0}, {68.0, 42.0}}, textString = "Delay", fontName = "Arial")}),
        Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics));
    end Dead_Time;

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

    block DELAY3 "Third-order exponential delaying"
      parameter Real averaging_time = 1 "Averaging time";
      parameter Real delay_init = 0 "Initial value of delayed variable";
      SystemDynamics.Interfaces.MassInPort massInPort "Mass input signal" annotation(
        Placement(visible = true, transformation(origin = {-110.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-110.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      SystemDynamics.Interfaces.MassOutPort massOutPort "Mass output signal" annotation(
        Placement(visible = true, transformation(origin = {110.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {110.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealOutput state "State signal" annotation(
        Placement(visible = true, transformation(origin = {0.0, 110.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -270), iconTransformation(origin = {0.0, 110.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -270)));
      SystemDynamics.Levels.Level Level1(x0 = delay_init / 3) annotation(
        Placement(visible = true, transformation(origin = {-60.0, 70.0}, extent = {{-20.0, -15.0}, {20.0, 15.0}}, rotation = 0)));
      SystemDynamics.Rates.Rate_1 Rate1 annotation(
        Placement(visible = true, transformation(origin = {10.0, 70.0}, extent = {{-16.0, -15.0}, {16.0, 15.0}}, rotation = 0)));
      SystemDynamics.Auxiliary.Gain Delaying1(k = 3 / averaging_time) annotation(
        Placement(visible = true, transformation(origin = {-17.0, 41.0}, extent = {{-29.0, 14.0}, {29.0, -14.0}}, rotation = 0)));
      SystemDynamics.Levels.Level Level2(x0 = delay_init / 3) annotation(
        Placement(visible = true, transformation(origin = {-40.0, 10.0}, extent = {{-20.0, -15.0}, {20.0, 15.0}}, rotation = 0)));
      SystemDynamics.Rates.Rate_1 Rate2 annotation(
        Placement(visible = true, transformation(origin = {30.0, 10.0}, extent = {{-16.0, -15.0}, {16.0, 15.0}}, rotation = 0)));
      SystemDynamics.Auxiliary.Gain Delaying2(k = 3 / averaging_time) annotation(
        Placement(visible = true, transformation(origin = {3.0, -19.0}, extent = {{-29.0, 14.0}, {29.0, -14.0}}, rotation = 0)));
      SystemDynamics.Levels.Level Level3(x0 = delay_init / 3) annotation(
        Placement(visible = true, transformation(origin = {-20.0, -50.0}, extent = {{-20.0, -15.0}, {20.0, 15.0}}, rotation = 0)));
      SystemDynamics.Rates.Rate_1 Rate3 annotation(
        Placement(visible = true, transformation(origin = {50.0, -50.0}, extent = {{-16.0, -15.0}, {16.0, 15.0}}, rotation = 0)));
      SystemDynamics.Auxiliary.Gain Delaying3(k = 3 / averaging_time) annotation(
        Placement(visible = true, transformation(origin = {23.0, -79.0}, extent = {{-29.0, 14.0}, {29.0, -14.0}}, rotation = 0)));
      Modelica.Blocks.Math.Add3 Add3 annotation(
        Placement(visible = true, transformation(origin = {70.0, 70.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -270)));
    equation
      connect(Rate1.y, Level1.u2) annotation(
        Line(points = {{2.0, 70.0}, {-38.0, 70.0}}, color = {95, 0, 191}, visible = true));
      connect(Delaying1.u, Level1.y2) annotation(
        Line(points = {{-37.3, 41.0}, {-45.0, 41.0}, {-45.0, 60.25}}, color = {0, 0, 191}, visible = true));
      connect(Delaying1.y, Rate1.u) annotation(
        Line(points = {{3.3, 41.0}, {10.0, 41.0}, {10.0, 54.25}}, color = {0, 0, 191}, visible = true));
      connect(Rate2.y, Level2.u2) annotation(
        Line(points = {{22.0, 10.0}, {-18.0, 10.0}}, color = {95, 0, 191}, visible = true));
      connect(Delaying2.u, Level2.y2) annotation(
        Line(points = {{-17.3, -19.0}, {-25.0, -19.0}, {-25.0, 0.25}}, color = {0, 0, 191}, visible = true));
      connect(Delaying2.y, Rate2.u) annotation(
        Line(points = {{23.3, -19.0}, {30.0, -19.0}, {30.0, -5.75}}, color = {0, 0, 191}, visible = true));
      connect(Rate3.y, Level3.u2) annotation(
        Line(points = {{42.0, -50.0}, {2.0, -50.0}}, color = {95, 0, 191}, visible = true));
      connect(Delaying3.u, Level3.y2) annotation(
        Line(points = {{2.7, -79.0}, {-5.0, -79.0}, {-5.0, -59.75}}, color = {0, 0, 191}, visible = true));
      connect(Delaying3.y, Rate3.u) annotation(
        Line(points = {{43.3, -79.0}, {50.0, -79.0}, {50.0, -65.75}}, color = {0, 0, 191}, visible = true));
      connect(Level1.u1, massInPort) annotation(
        Line(points = {{-82.0, 70.0}, {-90.0, 70.0}, {-90.0, 0.0}, {-110.0, 0.0}}, color = {95, 0, 191}, visible = true));
      connect(Rate1.y1, Level2.u1) annotation(
        Line(points = {{18.0, 70.0}, {30.0, 70.0}, {30.0, 28.0}, {-70.0, 28.0}, {-70.0, 10.0}, {-62.0, 10.0}}, color = {95, 0, 191}, visible = true));
      connect(Rate2.y1, Level3.u1) annotation(
        Line(points = {{38.0, 10.0}, {50.0, 10.0}, {50.0, -32.0}, {-50.0, -32.0}, {-50.0, -50.0}, {-42.0, -50.0}}, color = {95, 0, 191}, visible = true));
      connect(Rate3.y1, massOutPort) annotation(
        Line(points = {{58.0, -50.0}, {90.0, -50.0}, {90.0, 0.0}, {110.0, 0.0}}, color = {95, 0, 191}, visible = true));
      connect(Add3.u1, Level1.y1) annotation(
        Line(points = {{62.0, 58.0}, {62.0, 50.0}, {50.0, 50.0}, {50.0, 84.0}, {-30.0, 84.0}, {-30.0, 78.25}, {-43.0, 78.25}}, color = {0, 0, 191}, visible = true));
      connect(Add3.u2, Level2.y1) annotation(
        Line(points = {{70.0, 58.0}, {70.0, 24.0}, {-10.0, 24.0}, {-10.0, 18.25}, {-23.0, 18.25}}, color = {0, 0, 191}, visible = true));
      connect(Add3.u3, Level3.y1) annotation(
        Line(points = {{78.0, 58.0}, {78.0, -36.0}, {10.0, -36.0}, {10.0, -41.75}, {-3.0, -41.75}}, color = {0, 0, 191}, visible = true));
      connect(Add3.y, state) annotation(
        Line(points = {{70.0, 81.0}, {70.0, 90.0}, {0.0, 90.0}, {0.0, 110.0}}, color = {0, 0, 191}, visible = true));
      annotation(
        Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100.0, -100.0}, {100.0, 100.0}}), Text(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 191}, extent = {{-64.0, -44.0}, {68.0, 42.0}}, textString = "DELAY3", fontName = "Arial")}),
        Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics),
        Documentation(info = "<html>
This is a third-order exponential delaying function.  It describes the delaying of mass flows. <p>
 
Incoming goods are delayed temporarily in three consecutive internal states.  The <b>state</b> output represents the amount of goods currently stored in the DELAY block. <p>
 
The initial number of items in the DELAY block can be set.  By default, it assumes a value of zero.
</html>"));
    end DELAY3;

    block Linear "Linear function"
      parameter Real m = 1 "Gradient";
      parameter Real b = 0 "Offset";
      Modelica.Blocks.Interfaces.RealInput u "Input variable" annotation(
        Placement(visible = true, transformation(origin = {-90.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-90.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealOutput y "Output variable" annotation(
        Placement(visible = true, transformation(origin = {90.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {90.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
    equation
      y = m * u + b;
      annotation(
        Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, lineColor = {0, 0, 255}, lineThickness = 0.5, extent = {{-80.0, -80.0}, {80.0, 80.0}}), Line(visible = true, points = {{-40.0, -40.0}, {-40.0, 60.0}, {-44.0, 48.0}, {-36.0, 48.0}, {-40.0, 58.0}}, color = {0, 0, 255}), Line(visible = true, points = {{-40.0, -40.0}, {60.0, -40.0}, {48.0, -34.0}, {48.0, -44.0}, {60.0, -40.0}}, color = {0, 0, 255}), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-64.0, 38.0}, {-46.0, 62.0}}, textString = "y", fontName = "Arial"), Text(visible = true, lineColor = {0, 0, 255}, extent = {{40.0, -70.0}, {62.0, -50.0}}, textString = "u", fontName = "Arial"), Line(visible = true, points = {{-40.0, -10.0}, {48.0, 30.0}}, color = {0, 0, 255})}),
        Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, lineColor = {0, 0, 255}, lineThickness = 0.5, extent = {{-80.0, -80.0}, {80.0, 80.0}}), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-98.0, -118.0}, {100.0, -80.0}}, textString = "%name", fontName = "Arial"), Line(visible = true, points = {{-40.0, -40.0}, {-40.0, 60.0}, {-44.0, 48.0}, {-36.0, 48.0}, {-40.0, 58.0}}, color = {0, 0, 255}), Line(visible = true, points = {{-40.0, -40.0}, {60.0, -40.0}, {48.0, -34.0}, {48.0, -44.0}, {60.0, -40.0}}, color = {0, 0, 255}), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-64.0, 38.0}, {-46.0, 62.0}}, textString = "y", fontName = "Arial"), Text(visible = true, lineColor = {0, 0, 255}, extent = {{40.0, -70.0}, {62.0, -50.0}}, textString = "u", fontName = "Arial"), Line(visible = true, points = {{-40.0, -10.0}, {48.0, 30.0}}, color = {0, 0, 255})}),
        Documentation(info = "<html>
This is a linear function, as it is frequently used in System Dynamics to represent linear regression models.
</html>"));
    end Linear;

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

    block Tabular "Tabular function"
      parameter Real x_vals[:] = {0} "Independent variable data points";
      parameter Real y_vals[:] = {0} "Dependent variable data points";
      Modelica.Blocks.Interfaces.RealInput u "Input variable" annotation(
        Placement(visible = true, transformation(origin = {-80.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-80.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealOutput y "Output variable" annotation(
        Placement(visible = true, transformation(origin = {110.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {110.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
    equation
      y = Functions.Utilities.Piecewise(x = u, x_grid = x_vals, y_grid = y_vals);
      annotation(
        Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Line(visible = true, points = {{-70.0, 0.0}, {-44.0, 0.0}}, color = {160, 160, 160}), Line(visible = true, points = {{28.0, 0.0}, {100.0, 0.0}}, color = {160, 160, 160}), Text(visible = true, lineColor = {0, 0, 255}, fillColor = {160, 160, 160}, extent = {{-72.0, 2.0}, {-46.0, 20.0}}, textString = "u", fontName = "Arial"), Text(visible = true, lineColor = {0, 0, 255}, fillColor = {160, 160, 160}, extent = {{52.0, 2.0}, {78.0, 20.0}}, textString = "y", fontName = "Arial"), Rectangle(visible = true, fillColor = {255, 255, 0}, fillPattern = FillPattern.Solid, extent = {{-44.0, 40.0}, {-8.0, 60.0}}), Rectangle(visible = true, fillColor = {255, 255, 0}, fillPattern = FillPattern.Solid, extent = {{-44.0, 20.0}, {-8.0, 40.0}}), Rectangle(visible = true, fillColor = {255, 255, 0}, fillPattern = FillPattern.Solid, extent = {{-44.0, -2.0}, {-8.0, 20.0}}), Rectangle(visible = true, fillColor = {255, 255, 0}, fillPattern = FillPattern.Solid, extent = {{-44.0, -22.0}, {-8.0, 0.0}}), Rectangle(visible = true, fillColor = {255, 255, 0}, fillPattern = FillPattern.Solid, extent = {{-44.0, -42.0}, {-8.0, -20.0}}), Rectangle(visible = true, fillColor = {255, 255, 0}, fillPattern = FillPattern.Solid, extent = {{-44.0, -60.0}, {-8.0, -40.0}}), Rectangle(visible = true, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-8.0, 40.0}, {28.0, 60.0}}), Rectangle(visible = true, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-8.0, 20.0}, {28.0, 40.0}}), Rectangle(visible = true, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-8.0, -2.0}, {28.0, 20.0}}), Rectangle(visible = true, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-8.0, -20.0}, {28.0, 0.0}}), Rectangle(visible = true, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-8.0, -40.0}, {28.0, -20.0}}), Rectangle(visible = true, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-8.0, -60.0}, {28.0, -40.0}})}),
        Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, fillColor = {255, 255, 0}, fillPattern = FillPattern.Solid, extent = {{-44.0, 40.0}, {-8.0, 60.0}}), Rectangle(visible = true, fillColor = {255, 255, 0}, fillPattern = FillPattern.Solid, extent = {{-44.0, 20.0}, {-8.0, 40.0}}), Rectangle(visible = true, fillColor = {255, 255, 0}, fillPattern = FillPattern.Solid, extent = {{-44.0, -2.0}, {-8.0, 20.0}}), Rectangle(visible = true, fillColor = {255, 255, 0}, fillPattern = FillPattern.Solid, extent = {{-44.0, -22.0}, {-8.0, 0.0}}), Rectangle(visible = true, fillColor = {255, 255, 0}, fillPattern = FillPattern.Solid, extent = {{-44.0, -42.0}, {-8.0, -20.0}}), Rectangle(visible = true, fillColor = {255, 255, 0}, fillPattern = FillPattern.Solid, extent = {{-44.0, -60.0}, {-8.0, -40.0}}), Rectangle(visible = true, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-8.0, 40.0}, {28.0, 60.0}}), Rectangle(visible = true, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-8.0, 20.0}, {28.0, 40.0}}), Rectangle(visible = true, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-8.0, -2.0}, {28.0, 20.0}}), Rectangle(visible = true, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-8.0, -20.0}, {28.0, 0.0}}), Rectangle(visible = true, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-8.0, -40.0}, {28.0, -20.0}}), Rectangle(visible = true, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-8.0, -60.0}, {28.0, -40.0}}), Line(visible = true, points = {{-70.0, 80.0}, {-70.0, -80.0}, {40.0, -80.0}, {100.0, 0.0}, {40.0, 80.0}, {-70.0, 80.0}}, color = {0, 0, 255}, thickness = 0.5), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-100.0, 80.0}, {100.0, 122.0}}, textString = "%name", fontName = "Arial")}),
        Documentation(info = "<html>
This is a tabular function, as it is frequently used in System Dynamics to represent measured or estimated non-linear relationships.
</html>"));
    end Tabular;

    package Utilities "Utility modules of the set of functions"
      extends Modelica.Icons.Library annotation(
        preferedView = "info",
        Documentation(info = "<html>
Utility models of the set of functions.
</html>"));

      block Change_In_Smooth "Smoothing rate"
        extends Interfaces.Nonlin_2;
        parameter Real averaging_time = 1 "Averaging time";
        output Real input_variable "Variable to be smoothed";
        output Real smooth_of_input "Smoothed variable";
        output Real smoothing_rate "Smoothing rate";
      equation
        input_variable = u1;
        smooth_of_input = u2;
        smoothing_rate = (input_variable - smooth_of_input) / averaging_time;
        y = smoothing_rate;
        annotation(
          Diagram);
      end Change_In_Smooth;

      function InitRandomNormal
        extends Modelica.Icons.Function;
      
        external "C" ext_initRandomNormal() annotation(
          Include = "#include <ext_initRandomNormal.c>");
        annotation(
          Diagram(coordinateSystem(extent = {{-148.5, -105.0}, {148.5, 105.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
      end InitRandomNormal;

      function RandomNormal
        extends Modelica.Icons.Function;
        output Real y;
        input Real u;
      
        external "C" y = ext_RandomNormal(u) annotation(
          Include = "#include <ext_RandomNormal.c>");
        annotation(
          Diagram(coordinateSystem(extent = {{-148.5, -105.0}, {148.5, 105.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
      end RandomNormal;

      function Piecewise "Piecewise linear function"
        input Real x "Independent variable";
        input Real x_grid[:] "Independent variable data points";
        input Real y_grid[:] "Dependent variable data points";
        output Real y "Interpolated result";
      protected
        Integer n;
      algorithm
        n := size(x_grid, 1);
        assert(size(x_grid, 1) == size(y_grid, 1), "Size mismatch");
        assert(x >= x_grid[1] and x <= x_grid[n], "Out of range");
        for i in 1:n - 1 loop
          if x >= x_grid[i] and x <= x_grid[i + 1] then
            y := y_grid[i] + (y_grid[i + 1] - y_grid[i]) * (x - x_grid[i]) / (x_grid[i + 1] - x_grid[i]);
          end if;
        end for;
        annotation(
          Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-44, 60}, {-8, 40}}, fillPattern = FillPattern.Solid, lineColor = {0, 0, 0}, fillColor = {255, 255, 0}), Rectangle(extent = {{-44, 40}, {-8, 20}}, fillPattern = FillPattern.Solid, lineColor = {0, 0, 0}, fillColor = {255, 255, 0}), Rectangle(extent = {{-44, 20}, {-8, -2}}, fillPattern = FillPattern.Solid, lineColor = {0, 0, 0}, fillColor = {255, 255, 0}), Rectangle(extent = {{-44, 0}, {-8, -22}}, fillPattern = FillPattern.Solid, lineColor = {0, 0, 0}, fillColor = {255, 255, 0}), Rectangle(extent = {{-44, -20}, {-8, -42}}, fillPattern = FillPattern.Solid, lineColor = {0, 0, 0}, fillColor = {255, 255, 0}), Rectangle(extent = {{-44, -40}, {-8, -60}}, fillPattern = FillPattern.Solid, lineColor = {0, 0, 0}, fillColor = {255, 255, 0}), Rectangle(extent = {{-8, 60}, {28, 40}}, fillPattern = FillPattern.Solid, lineColor = {0, 0, 0}, fillColor = {255, 255, 255}), Rectangle(extent = {{-8, 40}, {28, 20}}, fillPattern = FillPattern.Solid, lineColor = {0, 0, 0}, fillColor = {255, 255, 255}), Rectangle(extent = {{-8, 20}, {28, -2}}, fillPattern = FillPattern.Solid, lineColor = {0, 0, 0}, fillColor = {255, 255, 255}), Rectangle(extent = {{-8, 0}, {28, -20}}, fillPattern = FillPattern.Solid, lineColor = {0, 0, 0}, fillColor = {255, 255, 255}), Rectangle(extent = {{-8, -20}, {28, -40}}, fillPattern = FillPattern.Solid, lineColor = {0, 0, 0}, fillColor = {255, 255, 255}), Rectangle(extent = {{-8, -40}, {28, -60}}, fillPattern = FillPattern.Solid, lineColor = {0, 0, 0}, fillColor = {255, 255, 255}), Text(lineColor = {0, 0, 255}, extent = {{-96, 94}, {98, 70}}, textString = "Linear interpolation")}),
          Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-44, 60}, {-8, 40}}, fillPattern = FillPattern.Solid, lineColor = {0, 0, 0}, fillColor = {255, 255, 0}), Rectangle(extent = {{-44, 40}, {-8, 20}}, fillPattern = FillPattern.Solid, lineColor = {0, 0, 0}, fillColor = {255, 255, 0}), Rectangle(extent = {{-44, 20}, {-8, -2}}, fillPattern = FillPattern.Solid, lineColor = {0, 0, 0}, fillColor = {255, 255, 0}), Rectangle(extent = {{-44, 0}, {-8, -22}}, fillPattern = FillPattern.Solid, lineColor = {0, 0, 0}, fillColor = {255, 255, 0}), Rectangle(extent = {{-44, -20}, {-8, -42}}, fillPattern = FillPattern.Solid, lineColor = {0, 0, 0}, fillColor = {255, 255, 0}), Rectangle(extent = {{-44, -40}, {-8, -60}}, fillPattern = FillPattern.Solid, lineColor = {0, 0, 0}, fillColor = {255, 255, 0}), Rectangle(extent = {{-8, 60}, {28, 40}}, fillPattern = FillPattern.Solid, lineColor = {0, 0, 0}, fillColor = {255, 255, 255}), Rectangle(extent = {{-8, 40}, {28, 20}}, fillPattern = FillPattern.Solid, lineColor = {0, 0, 0}, fillColor = {255, 255, 255}), Rectangle(extent = {{-8, 20}, {28, -2}}, fillPattern = FillPattern.Solid, lineColor = {0, 0, 0}, fillColor = {255, 255, 255}), Rectangle(extent = {{-8, 0}, {28, -20}}, fillPattern = FillPattern.Solid, lineColor = {0, 0, 0}, fillColor = {255, 255, 255}), Rectangle(extent = {{-8, -20}, {28, -40}}, fillPattern = FillPattern.Solid, lineColor = {0, 0, 0}, fillColor = {255, 255, 255}), Rectangle(extent = {{-8, -40}, {28, -60}}, fillPattern = FillPattern.Solid, lineColor = {0, 0, 0}, fillColor = {255, 255, 255})}));
      end Piecewise;
    end Utilities;

    block NoiseNormal "Normally distributed random noise"
      parameter Real mean = 0 "Mean value of random noise";
      parameter Real stdev = 100 "Standard deviation of random noise";
      parameter Real tSample = 1 "Noise sample time";
      Modelica.Blocks.Interfaces.RealOutput y annotation(
        Placement(visible = true, transformation(origin = {90.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {90.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
    equation
      when initial() then
        SystemDynamics.Functions.Utilities.InitRandomNormal();
      end when;
      when sample(0, tSample) then
        y = mean + stdev * SystemDynamics.Functions.Utilities.RandomNormal(time);
      end when;
      annotation(
        Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10})),
        Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, lineColor = {0, 0, 255}, extent = {{-80.0, -80.0}, {80.0, 80.0}}), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-0.0, -124.0}, {0.0, -80.0}}, textString = "%name", fontName = "Arial"), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-6.0, 36.0}, {-6.0, 68.0}}, textString = "mean=%mean", fontName = "Arial"), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-4.0, -6.0}, {-4.0, 24.0}}, textString = "stdev=%stdev", fontName = "Arial"), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-2.0, -54.0}, {-2.0, -24.0}}, textString = "tSample=%tSample", fontName = "Arial")}));
    end NoiseNormal;
  end Functions;