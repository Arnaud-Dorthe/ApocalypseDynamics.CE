      block Infection_Rate "Non-linear infection rate model"
        extends Interfaces.Nonlin_2;
        output Real P_ni "Noninfected population";
        output Real R_con "Contraction rate";
        output Real R_inf "Infection rate";
      equation
        P_ni = u1;
        R_con = u2;
        R_inf = noEvent(min([R_con, P_ni]));
        y = R_inf;
        annotation(
          Documentation(info = "<html>
Non-linear infection rate model.
</html>"));
      end Infection_Rate;