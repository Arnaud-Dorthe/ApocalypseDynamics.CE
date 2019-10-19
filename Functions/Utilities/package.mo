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