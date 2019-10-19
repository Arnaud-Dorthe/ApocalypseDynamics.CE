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