      model Grecr "Raw fiber content function"
        extends Interfaces.Nonlin_2;
        output Real defoliation "First input";
        output Real rawfiber "Second input";
        output Real zraw "Auxiliary variable";
        output Real grecr1 "Auxiliary variable";
        output Real grecr2 "Auxiliary variable";
        output Real grecr3 "Auxiliary variable";
        output Real grecr4 "Auxiliary variable";
        output Real grecr "Output variable";
      equation
        defoliation = u1;
        rawfiber = u2;
        zraw = 0.425 + sqrt((18.0 - rawfiber) / max([(rawfiber - 11.99) ^ 2, 0.01]));
        grecr1 = if zraw > rawfiber - 11.99 then 11.99 / rawfiber else 1.0 - zraw / rawfiber;
        grecr2 = if rawfiber > 11.99 then grecr1 else 1.0;
        grecr3 = 1.0 + (defoliation - 0.4) * (18.0 - rawfiber) / (0.4 * rawfiber);
        grecr4 = 18.0 / rawfiber;
        grecr = if defoliation < 0.4 then grecr2 else if defoliation < 0.8 then grecr3 else grecr4;
        y = grecr;
        annotation(
          Documentation(info = "<html>
This function models the change in raw fiber content as a function of defoliation.
</html>"));
      end Grecr;