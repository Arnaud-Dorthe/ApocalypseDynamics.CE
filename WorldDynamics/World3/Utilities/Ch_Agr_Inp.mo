        block Ch_Agr_Inp "Change in agricultural input"
          extends Interfaces.Nonlin_3;
          output Real current_agr_inp(unit = "dollar/yr") "Current agricultural input";
          output Real s_avg_life_agr_inp(unit = "yr") "Average life of agricultural input";
          output Real agr_inp(unit = "dollar/yr") "Agricultural input";
          output Real chg_agr_inp(unit = "dollar/yr2") "Change in agricultural input";
        equation
          current_agr_inp = u1;
          s_avg_life_agr_inp = u2;
          agr_inp = u3;
          chg_agr_inp = (current_agr_inp - agr_inp) / s_avg_life_agr_inp;
          y = chg_agr_inp;
          annotation(
            Documentation(info = "<html>
This function is described on p.292 of <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>.
</html>"));
        end Ch_Agr_Inp;