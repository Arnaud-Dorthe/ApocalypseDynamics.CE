      block Logarithm "Logarithmic transformation"
        extends Interfaces.Nonlin_1;
      equation
        y = Modelica.Math.log10(u);
        annotation(
          Documentation(info = "<html>
Logarithmic transformation.
</html>"));
      end Logarithm;