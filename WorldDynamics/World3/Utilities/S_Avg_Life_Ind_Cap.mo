        block S_Avg_Life_Ind_Cap "Average life of industrial capital"
          extends Interfaces.Nonlin_0;
          parameter Real t_policy_year(unit = "yr") = 4000 "Year of policy change";
          parameter Real p_avg_life_ind_cap_1(unit = "yr") = 14 "Default average life of industrial capital";
          parameter Real p_avg_life_ind_cap_2(unit = "yr") = 14 "Controlled average life of industrial capital";
          output Real s_avg_life_ind_cap(unit = "yr") "Average life of industrial capital";
        equation
          s_avg_life_ind_cap = if time > t_policy_year then p_avg_life_ind_cap_2 else p_avg_life_ind_cap_1;
          y = s_avg_life_ind_cap;
          annotation(
            Documentation(info = "<html>
This function is described on p.221 of <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>.
</html>"));
        end S_Avg_Life_Ind_Cap;