    block Prod_3 "Product of three influencing factors"
      Modelica.Blocks.Interfaces.RealInput u1 "First input variable" annotation(
        Placement(visible = true, transformation(origin = {-70.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-70.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealInput u2 "Second input variable" annotation(
        Placement(visible = true, transformation(origin = {0.0, -70.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -270), iconTransformation(origin = {0.0, -70.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -270)));
      Modelica.Blocks.Interfaces.RealInput u3 "Third input variable" annotation(
        Placement(visible = true, transformation(origin = {70.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -180), iconTransformation(origin = {70.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -180)));
      Modelica.Blocks.Interfaces.RealOutput y "Output variable" annotation(
        Placement(visible = true, transformation(origin = {0.0, 70.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -270), iconTransformation(origin = {0.0, 70.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -270)));
    equation
      y = u1 * u2 * u3;
      annotation(
        Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Line(visible = true, points = {{-30.0, 0.0}, {30.0, 0.0}}, color = {0, 0, 255}, thickness = 0.5), Line(visible = true, points = {{-15.0, -25.99}, {15.0, 25.99}}, color = {0, 0, 255}, thickness = 0.5), Line(visible = true, points = {{-15.0, 25.99}, {15.0, -25.99}}, color = {0, 0, 255}, thickness = 0.5), Ellipse(visible = true, lineColor = {0, 0, 255}, lineThickness = 0.5, extent = {{-60.0, -60.0}, {60.0, 60.0}})}),
        Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Ellipse(visible = true, lineColor = {0, 0, 255}, lineThickness = 0.5, extent = {{-60.0, -60.0}, {60.0, 60.0}}), Line(visible = true, points = {{-30.0, 0.0}, {30.0, 0.0}}, color = {0, 0, 255}, thickness = 0.5), Line(visible = true, points = {{-15.0, -25.99}, {15.0, 25.99}}, color = {0, 0, 255}, thickness = 0.5), Line(visible = true, points = {{-15.0, 25.99}, {15.0, -25.99}}, color = {0, 0, 255}, thickness = 0.5)}),
        Documentation(info = "<html>
Product of three influencing factors.
</html>"));
    end Prod_3;