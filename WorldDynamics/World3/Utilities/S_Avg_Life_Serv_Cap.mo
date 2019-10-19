        block S_Avg_Life_Serv_Cap "Average life of service sector capital"
          extends Interfaces.Nonlin_0;
          parameter Real t_policy_year(unit = "yr") = 4000 "Year of policy change";
          parameter Real p_avg_life_serv_cap_1(unit = "yr") = 20 "Default average life of service sector capital";
          parameter Real p_avg_life_serv_cap_2(unit = "yr") = 20 "Controlled average life of service sector capital";
          output Real s_avg_life_serv_cap(unit = "yr") "Average life of service sector capital";
        equation
          s_avg_life_serv_cap = if time > t_policy_year then p_avg_life_serv_cap_2 else p_avg_life_serv_cap_1;
          y = s_avg_life_serv_cap;
          annotation(
            Documentation(info = "<html>
This function is described on p.231 of <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>.
</html>"));
        end S_Avg_Life_Serv_Cap;