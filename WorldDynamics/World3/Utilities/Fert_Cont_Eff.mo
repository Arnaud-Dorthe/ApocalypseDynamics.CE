        block Fert_Cont_Eff "Effective fertility continuation"
          extends Interfaces.Nonlin_1;
          parameter Real t_fert_cont_eff_time(unit = "yr") = 4000 "Year of continued fertility change";
          output Real fert_cont_eff_table "Effective fertility continuation table";
          output Real fert_cont_eff "Effective fertility continuation";
        equation
          fert_cont_eff_table = u;
          fert_cont_eff = if time > t_fert_cont_eff_time then 1.0 else fert_cont_eff_table;
          y = fert_cont_eff;
          annotation(
            Documentation(info = "<html>
This function is described on p.133 of <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>.
</html>"));
        end Fert_Cont_Eff;