    block Gain "Gain factor"
      parameter Real k = 1 "Constant multiplicative factor";
      Modelica.Blocks.Interfaces.RealInput u "Input variable" annotation(
        Placement(visible = true, transformation(origin = {-70.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-70.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealOutput y "Output variable" annotation(
        Placement(visible = true, transformation(origin = {70.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {70.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
    equation
      y = k * u;
      annotation(
        Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, lineColor = {0, 0, 255}, extent = {{-60.0, -60.0}, {60.0, 60.0}})}),
        Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, lineColor = {0, 0, 255}, extent = {{-60.0, -60.0}, {60.0, 60.0}}), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-60.0, -20.0}, {60.0, 20.0}}, textString = "k = %k", fontName = "Arial"), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-98.0, -118.0}, {100.0, -80.0}}, textString = "%name", fontName = "Arial")}),
        Documentation(info = "<html>
Amplification gain factor.
</html>"));
    end Gain;