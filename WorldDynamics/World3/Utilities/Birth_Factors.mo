        block Birth_Factors "Birth factors of WORLD3 model"
          extends Interfaces.Nonlin_3;
          parameter Real Repro_Life(unit = "yr") = 30 "Reproductive lifetime";
          parameter Real t_pop_equil_time(unit = "yr") = 4000 "Population equilibrium time";
          output Real tot_fert "Total fertility";
          output Real deaths "Total deaths";
          output Real pop_15_44 "Population between the ages of 15 and 44";
          output Real births "Total births";
        equation
          tot_fert = u1;
          deaths = u2;
          pop_15_44 = u3;
          births = if time > t_pop_equil_time then deaths else 0.5 * tot_fert * pop_15_44 / Repro_Life;
          y = births;
          annotation(
            Documentation(info = "<html>
This function is described on p.96 of <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>.
</html>"));
        end Birth_Factors;