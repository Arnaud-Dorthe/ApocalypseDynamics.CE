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