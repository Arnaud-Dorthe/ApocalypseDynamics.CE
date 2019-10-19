    partial block Nonlin_0 "Non-linear function with zero inputs"
      Modelica.Blocks.Interfaces.RealOutput y "Output variable" annotation(
        Placement(visible = true, transformation(origin = {90.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {90.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      annotation(
        Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Line(visible = true, points = {{-80.0, 80.0}, {-80.0, -80.0}, {20.0, -80.0}, {80.0, 0.0}, {20.0, 80.0}, {-80.0, 80.0}}, color = {0, 0, 255}, thickness = 0.5), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-60.0, -40.0}, {60.0, 40.0}}, textString = "y = const", fontName = "Arial")}),
        Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Line(visible = true, points = {{-80.0, 80.0}, {-80.0, -80.0}, {20.0, -80.0}, {80.0, 0.0}, {20.0, 80.0}, {-80.0, 80.0}}, color = {0, 0, 255}, thickness = 0.5), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-60.0, -40.0}, {60.0, 40.0}}, textString = "y = const", fontName = "Arial"), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-100.0, 80.0}, {100.0, 118.0}}, textString = "%name", fontName = "Arial")}),
        Documentation(info = "<html>
General non-linear function without explicit inputs.  It does not have to be a constant function.  It could be a function of <i>time</i>.
</html>"));
    end Nonlin_0;