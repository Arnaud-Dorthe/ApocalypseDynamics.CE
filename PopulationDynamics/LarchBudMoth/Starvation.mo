      block Starvation "Starvation function"
        extends Interfaces.Nonlin_2;
        output Real foliage;
        output Real food_demand;
        output Real starvation;
      equation
        foliage = u1;
        food_demand = u2;
        starvation = exp(-foliage / food_demand);
        y = starvation;
        annotation(
          Documentation(info = "<html>
Model of starvation function.
</html>"));
      end Starvation;