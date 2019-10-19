      block Defoliation "Defoliation function"
        extends Interfaces.Nonlin_3;
        output Real foliage;
        output Real food_demand;
        output Real starvation;
        output Real defoliation;
      equation
        foliage = u1;
        food_demand = u2;
        starvation = u3;
        defoliation = (1.0 - starvation) * food_demand / foliage;
        y = defoliation;
        annotation(
          Documentation(info = "<html>
Model of defoliation function.
</html>"));
      end Defoliation;