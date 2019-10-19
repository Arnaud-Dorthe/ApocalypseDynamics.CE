  package Interfaces "Connectors and partial models of the System Dynamics methodology"
    extends Modelica.Icons.Library;
    connector MassInPort = Modelica.Blocks.Interfaces.RealInput "Mass flow input signal" annotation(
      Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Polygon(visible = true, lineColor = {95, 0, 191}, fillColor = {95, 0, 191}, fillPattern = FillPattern.Solid, points = {{0.0, 50.0}, {100.0, 0.0}, {0.0, -50.0}, {0.0, 50.0}})}),
      Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}), graphics = {Polygon(points = {{-100, 100}, {100, 0}, {-100, -100}, {-100, 100}}, fillPattern = FillPattern.Solid, lineColor = {95, 0, 191}, fillColor = {95, 0, 191})}));
    connector MassOutPort = Modelica.Blocks.Interfaces.RealOutput "Mass flow output signal" annotation(
      Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Polygon(visible = true, lineColor = {95, 0, 191}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, points = {{-100.0, 50.0}, {0.0, 0.0}, {-100.0, -50.0}, {-100.0, 50.0}})}),
      Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}), graphics = {Polygon(points = {{-100, 100}, {100, 0}, {-100, -100}, {-100, 100}}, fillPattern = FillPattern.Solid, lineColor = {95, 0, 191}, fillColor = {255, 255, 255})}));

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

    partial block Nonlin_1 "Non-linear function with one input"
      Modelica.Blocks.Interfaces.RealInput u "Input variable" annotation(
        Placement(visible = true, transformation(origin = {-90.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-90.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealOutput y "Output variable" annotation(
        Placement(visible = true, transformation(origin = {90.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {90.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      annotation(
        Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Line(visible = true, points = {{-80.0, 80.0}, {-80.0, -80.0}, {20.0, -80.0}, {80.0, 0.0}, {20.0, 80.0}, {-80.0, 80.0}}, color = {0, 0, 255}, thickness = 0.5), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-60.0, -40.0}, {60.0, 40.0}}, textString = "y = f(u)", fontName = "Arial"), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-100.0, 80.0}, {100.0, 118.0}}, textString = "%name", fontName = "Arial")}),
        Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Line(visible = true, points = {{-80.0, 80.0}, {-80.0, -80.0}, {20.0, -80.0}, {80.0, 0.0}, {20.0, 80.0}, {-80.0, 80.0}}, color = {0, 0, 255}, thickness = 0.5), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-60.0, -40.0}, {60.0, 40.0}}, textString = "y = f(u)", fontName = "Arial")}),
        Documentation(info = "<html>
General non-linear function with one explicit input.
</html>"));
    end Nonlin_1;

    partial block Nonlin_2 "Non-linear function with two inputs"
      Modelica.Blocks.Interfaces.RealInput u1 "First input variable" annotation(
        Placement(visible = true, transformation(origin = {-90.0, 40.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-90.0, 40.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealInput u2 "Second input variable" annotation(
        Placement(visible = true, transformation(origin = {-90.0, -40.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-90.0, -40.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealOutput y "Output variable" annotation(
        Placement(visible = true, transformation(origin = {90.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {90.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      annotation(
        Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Line(visible = true, points = {{-80.0, 80.0}, {-80.0, -80.0}, {20.0, -80.0}, {80.0, 0.0}, {20.0, 80.0}, {-80.0, 80.0}}, color = {0, 0, 255}, thickness = 0.5), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-80.0, -40.0}, {80.0, 40.0}}, textString = "y = f(u1,u2)", fontName = "Arial"), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-76.0, 30.0}, {-54.0, 50.0}}, textString = "u1", fontName = "Arial"), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-76.0, -50.0}, {-54.0, -30.0}}, textString = "u2", fontName = "Arial"), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-100.0, 80.0}, {100.0, 118.0}}, textString = "%name", fontName = "Arial")}),
        Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Line(visible = true, points = {{-80.0, 80.0}, {-80.0, -80.0}, {20.0, -80.0}, {80.0, 0.0}, {20.0, 80.0}, {-80.0, 80.0}}, color = {0, 0, 255}, thickness = 0.5), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-80.0, -40.0}, {80.0, 40.0}}, textString = "y = f(u1,u2)", fontName = "Arial"), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-76.0, 30.0}, {-54.0, 50.0}}, textString = "u1", fontName = "Arial"), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-76.0, -50.0}, {-54.0, -30.0}}, textString = "u2", fontName = "Arial")}),
        Documentation(info = "<html>
General non-linear function with two explicit inputs.
</html>"));
    end Nonlin_2;

    partial block Nonlin_3 "Non-linear function with three inputs"
      Modelica.Blocks.Interfaces.RealInput u1 "First input variable" annotation(
        Placement(visible = true, transformation(origin = {-90.0, 60.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-90.0, 60.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealInput u2 "Second input variable" annotation(
        Placement(visible = true, transformation(origin = {-90.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-90.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealInput u3 "Third input variable" annotation(
        Placement(visible = true, transformation(origin = {-90.0, -60.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-90.0, -60.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealOutput y "Output variable" annotation(
        Placement(visible = true, transformation(origin = {90.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {90.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      annotation(
        Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Line(visible = true, points = {{-80.0, 80.0}, {-80.0, -80.0}, {20.0, -80.0}, {80.0, 0.0}, {20.0, 80.0}, {-80.0, 80.0}}, color = {0, 0, 255}, thickness = 0.5), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-100.0, 80.0}, {100.0, 118.0}}, textString = "%name", fontName = "Arial"), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-80.0, -40.0}, {80.0, 40.0}}, textString = "y = f(u1,u2,u3)", fontName = "Arial"), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-76.0, 50.0}, {-54.0, 70.0}}, textString = "u1", fontName = "Arial"), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-76.0, -70.0}, {-54.0, -50.0}}, textString = "u3", fontName = "Arial")}),
        Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Line(visible = true, points = {{-80.0, 80.0}, {-80.0, -80.0}, {20.0, -80.0}, {80.0, 0.0}, {20.0, 80.0}, {-80.0, 80.0}}, color = {0, 0, 255}, thickness = 0.5), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-80.0, -40.0}, {80.0, 40.0}}, textString = "y = f(u1,u2,u3)", fontName = "Arial"), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-76.0, 50.0}, {-54.0, 70.0}}, textString = "u1", fontName = "Arial"), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-76.0, -70.0}, {-54.0, -50.0}}, textString = "u3", fontName = "Arial")}),
        Documentation(info = "<html>
General non-linear function with three explicit inputs.
</html>"));
    end Nonlin_3;

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
    annotation(
      preferedView = "info",
      Documentation(info = "<html>
This package contains the mass flow connectors of the System Dynamics methodology and some partial models that are used elsewhere.
</html>"));
  end Interfaces;