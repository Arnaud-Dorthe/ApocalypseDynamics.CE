      function RandomNormal
        extends Modelica.Icons.Function;
        output Real y;
        input Real u;
      
        external "C" y = ext_RandomNormal(u) annotation(
          Include = "#include <ext_RandomNormal.c>");
        annotation(
          Diagram(coordinateSystem(extent = {{-148.5, -105.0}, {148.5, 105.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
      end RandomNormal;