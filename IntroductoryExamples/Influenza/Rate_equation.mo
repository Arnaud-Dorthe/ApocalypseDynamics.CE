      block Rate_equation "Non-linear function describing the rate equations"
        extends Interfaces.Nonlin_2;
      equation
        y = u1 / u2;
        annotation(
          Documentation(info = "<html>
Non-linear function describing the rate equations.
</html>"));
      end Rate_equation;