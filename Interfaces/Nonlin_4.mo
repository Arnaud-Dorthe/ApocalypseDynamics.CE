    partial block Nonlin_4 "Non-linear function with four inputs"
      Modelica.Blocks.Interfaces.RealInput u1 "First input variable" annotation(
        Placement(visible = true, transformation(origin = {-90.0, 60.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-90.0, 60.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealInput u2 "Second input variable" annotation(
        Placement(visible = true, transformation(origin = {-90.0, 20.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-90.0, 20.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealInput u3 "Third input variable" annotation(
        Placement(visible = true, transformation(origin = {-90.0, -20.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-90.0, -20.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealInput u4 "Fourth input variable" annotation(
        Placement(visible = true, transformation(origin = {-90.0, -60.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-90.0, -60.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealOutput y "Output variable" annotation(
        Placement(visible = true, transformation(origin = {90.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {90.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      annotation(
        Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Line(visible = true, points = {{-80.0, 80.0}, {-80.0, -80.0}, {20.0, -80.0}, {80.0, 0.0}, {20.0, 80.0}, {-80.0, 80.0}}, color = {0, 0, 255}, thickness = 0.5), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-80.0, -40.0}, {80.0, 40.0}}, textString = "y = f(u1,u2,u3,u4)", fontName = "Arial"), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-76.0, 50.0}, {-54.0, 70.0}}, textString = "u1", fontName = "Arial"), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-76.0, -70.0}, {-54.0, -50.0}}, textString = "u4", fontName = "Arial")}),
        Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Line(visible = true, points = {{-80.0, 80.0}, {-80.0, -80.0}, {20.0, -80.0}, {80.0, 0.0}, {20.0, 80.0}, {-80.0, 80.0}}, color = {0, 0, 255}, thickness = 0.5), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-80.0, -40.0}, {80.0, 40.0}}, textString = "y = f(u1,u2,u3,u4)", fontName = "Arial"), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-76.0, 50.0}, {-54.0, 70.0}}, textString = "u1", fontName = "Arial"), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-76.0, -70.0}, {-54.0, -50.0}}, textString = "u4", fontName = "Arial"), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-100.0, 80.0}, {100.0, 118.0}}, textString = "%name", fontName = "Arial")}),
        Documentation(info = "<html>
General non-linear function with four explicit inputs.
</html>"));
    end Nonlin_4;