        block Total_Fertility "Total fertility"
          extends Interfaces.Nonlin_3;
          output Real fert_cont_eff "Fertility control effectiveness";
          output Real max_tot_fert "Maximum total fertility";
          output Real des_tot_fert "Desired total fertility";
          output Real total_fertility "Total fertility";
        equation
          fert_cont_eff = u1;
          max_tot_fert = u2;
          des_tot_fert = u3;
          total_fertility = min({max_tot_fert, fert_cont_eff * des_tot_fert + (1 - fert_cont_eff) * max_tot_fert});
          y = total_fertility;
          annotation(
            Documentation(info = "<html>
This function is described on p.97 of <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>.
</html>"));
        end Total_Fertility;