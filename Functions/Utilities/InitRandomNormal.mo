      function InitRandomNormal
        extends Modelica.Icons.Function;
      
        external "C" ext_initRandomNormal() annotation(
          Include = "#include <ext_initRandomNormal.c>");
        annotation(
          Diagram(coordinateSystem(extent = {{-148.5, -105.0}, {148.5, 105.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
      end InitRandomNormal;