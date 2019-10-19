        block S_Avg_Life_Agr_Inp "Average life of service sector capital"
          extends Interfaces.Nonlin_0;
          parameter Real t_policy_year(unit = "yr") = 4000 "Year of policy change";
          parameter Real p_avg_life_agr_inp_1(unit = "yr") = 2 "Default average life of agricultural input";
          parameter Real p_avg_life_agr_inp_2(unit = "yr") = 2 "Controlled average life of agricultural input";
          output Real s_avg_life_agr_inp(unit = "yr") "Average life of agricultural input";
        equation
          s_avg_life_agr_inp = if time > t_policy_year then p_avg_life_agr_inp_2 else p_avg_life_agr_inp_1;
          y = s_avg_life_agr_inp;
          annotation(
            Documentation(info = "<html>
This function is described on p.293 of <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>.
</html>"));
        end S_Avg_Life_Agr_Inp;