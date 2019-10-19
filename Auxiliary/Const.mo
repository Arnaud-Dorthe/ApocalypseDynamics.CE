    block Const "A constant factor"
      parameter Real k = 0 "Constant additive term";
      Modelica.Blocks.Interfaces.RealOutput y "Output variable" annotation(
        Placement(visible = true, transformation(origin = {0.0, 70.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -270), iconTransformation(origin = {0.0, 70.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -270)));
    equation
      y = k;
      annotation(
        Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Ellipse(visible = true, lineColor = {0, 0, 255}, lineThickness = 0.5, extent = {{-60.0, -60.0}, {60.0, 60.0}})}),
        Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Ellipse(visible = true, lineColor = {0, 0, 255}, lineThickness = 0.5, extent = {{-60.0, -60.0}, {60.0, 60.0}}), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-60.0, -30.0}, {60.0, 34.0}}, textString = "k=%k", fontName = "Arial"), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-100.0, -112.0}, {100.0, -70.0}}, textString = "%name", fontName = "Arial")}),
        Documentation(info = "<html>
System Dynamics constant factor model.
</html>"));
    end Const;