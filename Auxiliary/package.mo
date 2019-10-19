  package Auxiliary "Auxiliary elements of the System Dynamics methodology"
    extends Modelica.Icons.Library;

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

    block Prod_2 "Product of two influencing factors"
      Modelica.Blocks.Interfaces.RealInput u1 "First input variable" annotation(
        Placement(visible = true, transformation(origin = {-70.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-70.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealInput u2 "Second input variable" annotation(
        Placement(visible = true, transformation(origin = {70.0, 0.0}, extent = {{10.0, -10.0}, {-10.0, 10.0}}, rotation = 0), iconTransformation(origin = {70.0, 0.0}, extent = {{10.0, -10.0}, {-10.0, 10.0}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealOutput y "Output variable" annotation(
        Placement(visible = true, transformation(origin = {0.0, 70.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -270), iconTransformation(origin = {0.0, 70.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -270)));
    equation
      y = u1 * u2;
      annotation(
        Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Ellipse(visible = true, lineColor = {0, 0, 255}, lineThickness = 0.5, extent = {{-60.0, -60.0}, {60.0, 60.0}}), Line(visible = true, points = {{-30.0, 0.0}, {30.0, 0.0}}, color = {0, 0, 255}, thickness = 0.5), Line(visible = true, points = {{-15.0, -25.99}, {15.0, 25.99}}, color = {0, 0, 255}, thickness = 0.5), Line(visible = true, points = {{-15.0, 25.99}, {15.0, -25.99}}, color = {0, 0, 255}, thickness = 0.5)}),
        Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Ellipse(visible = true, lineColor = {0, 0, 255}, lineThickness = 0.5, extent = {{-60.0, -60.0}, {60.0, 60.0}}), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-38.0, -44.0}, {40.0, 44.0}}, textString = "", fontName = "Arial"), Line(visible = true, points = {{-30.0, 0.0}, {30.0, 0.0}}, color = {0, 0, 255}, thickness = 0.5), Line(visible = true, points = {{-15.0, -25.99}, {15.0, 25.99}}, color = {0, 0, 255}, thickness = 0.5), Line(visible = true, points = {{-15.0, 25.99}, {15.0, -25.99}}, color = {0, 0, 255}, thickness = 0.5)}),
        Documentation(info = "<html>
Product of two influencing factors.
</html>"));
    end Prod_2;

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

    block Prod_4 "Product of four influencing factors"
      Modelica.Blocks.Interfaces.RealInput u1 "First input variable" annotation(
        Placement(visible = true, transformation(origin = {-70.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-70.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealInput u2 "Second input variable" annotation(
        Placement(visible = true, transformation(origin = {-40.0, -56.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -270), iconTransformation(origin = {-40.0, -56.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -270)));
      Modelica.Blocks.Interfaces.RealInput u3 "Third input variable" annotation(
        Placement(visible = true, transformation(origin = {40.0, -56.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -270), iconTransformation(origin = {40.0, -56.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -270)));
      Modelica.Blocks.Interfaces.RealInput u4 "Fourth input variable" annotation(
        Placement(visible = true, transformation(origin = {70.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -180), iconTransformation(origin = {70.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -180)));
      Modelica.Blocks.Interfaces.RealOutput y "Output variable" annotation(
        Placement(visible = true, transformation(origin = {0.0, 70.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -270), iconTransformation(origin = {0.0, 70.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -270)));
    equation
      y = u1 * u2 * u3 * u4;
      annotation(
        Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Line(visible = true, points = {{-15.0, 25.99}, {15.0, -25.99}}, color = {0, 0, 255}, thickness = 0.5), Line(visible = true, points = {{-15.0, -25.99}, {15.0, 25.99}}, color = {0, 0, 255}, thickness = 0.5), Line(visible = true, points = {{-30.0, 0.0}, {30.0, 0.0}}, color = {0, 0, 255}, thickness = 0.5), Ellipse(visible = true, lineColor = {0, 0, 255}, lineThickness = 0.5, extent = {{-60.0, -60.0}, {60.0, 60.0}})}),
        Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Ellipse(visible = true, lineColor = {0, 0, 255}, lineThickness = 0.5, extent = {{-60.0, -60.0}, {60.0, 60.0}}), Line(visible = true, points = {{-30.0, 0.0}, {30.0, 0.0}}, color = {0, 0, 255}, thickness = 0.5), Line(visible = true, points = {{-15.0, -25.99}, {15.0, 25.99}}, color = {0, 0, 255}, thickness = 0.5), Line(visible = true, points = {{-15.0, 25.99}, {15.0, -25.99}}, color = {0, 0, 255}, thickness = 0.5)}),
        Documentation(info = "<html>
Product of four influencing factors.
</html>"));
    end Prod_4;

    block Prod_5 "Product of five influencing factors"
      Modelica.Blocks.Interfaces.RealInput u1 "First input variable" annotation(
        Placement(visible = true, transformation(origin = {-70.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-70.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealInput u2 "Second input variable" annotation(
        Placement(visible = true, transformation(origin = {-46.0, -50.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -270), iconTransformation(origin = {-46.0, -50.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -270)));
      Modelica.Blocks.Interfaces.RealInput u3 "Third input variable" annotation(
        Placement(visible = true, transformation(origin = {0.0, -70.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -270), iconTransformation(origin = {0.0, -70.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -270)));
      Modelica.Blocks.Interfaces.RealInput u4 "Fourth input variable" annotation(
        Placement(visible = true, transformation(origin = {46.0, -50.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -270), iconTransformation(origin = {46.0, -50.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -270)));
      Modelica.Blocks.Interfaces.RealInput u5 "Fifth input variable" annotation(
        Placement(visible = true, transformation(origin = {70.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -180), iconTransformation(origin = {70.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -180)));
      Modelica.Blocks.Interfaces.RealOutput y "Output variable" annotation(
        Placement(visible = true, transformation(origin = {0.0, 70.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -270), iconTransformation(origin = {0.0, 70.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -270)));
    equation
      y = u1 * u2 * u3 * u4 * u5;
      annotation(
        Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Line(visible = true, points = {{-15.0, 25.99}, {15.0, -25.99}}, color = {0, 0, 255}, thickness = 0.5), Line(visible = true, points = {{-15.0, -25.99}, {15.0, 25.99}}, color = {0, 0, 255}, thickness = 0.5), Line(visible = true, points = {{-30.0, 0.0}, {30.0, 0.0}}, color = {0, 0, 255}, thickness = 0.5), Ellipse(visible = true, lineColor = {0, 0, 255}, lineThickness = 0.5, extent = {{-60.0, -60.0}, {60.0, 60.0}})}),
        Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Ellipse(visible = true, lineColor = {0, 0, 255}, lineThickness = 0.5, extent = {{-60.0, -60.0}, {60.0, 60.0}}), Line(visible = true, points = {{-30.0, 0.0}, {30.0, 0.0}}, color = {0, 0, 255}, thickness = 0.5), Line(visible = true, points = {{-15.0, -25.99}, {15.0, 25.99}}, color = {0, 0, 255}, thickness = 0.5), Line(visible = true, points = {{-15.0, 25.99}, {15.0, -25.99}}, color = {0, 0, 255}, thickness = 0.5)}),
        Documentation(info = "<html>
Product of five influencing factors.
</html>"));
    end Prod_5;
    annotation(
      preferedView = "info",
      Documentation(info = "<html>
This package contains a set of simple static relationships that are frequently used in the System Dynamics approach to modeling.
</html>"));
  end Auxiliary;