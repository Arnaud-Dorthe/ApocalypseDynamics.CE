      package Utilities "Utility models of Forrester's WORLD2 model"
        extends Modelica.Icons.Library;

        block Parameter_Change "Parameter variation of WORLD2 model"
          extends Interfaces.Nonlin_2;
        equation
          y = u1 * u2;
        end Parameter_Change;
        annotation(
          preferedView = "info",
          Documentation(info = "<html>
Utility models of Forrester's <font color=red><b>WORLD2</b></font> model.
</html>"));
      end Utilities;