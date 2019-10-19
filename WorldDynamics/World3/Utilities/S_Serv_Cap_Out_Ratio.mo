        block S_Serv_Cap_Out_Ratio "Service sector capital output ratio"
          extends Interfaces.Nonlin_0;
          parameter Real t_policy_year(unit = "yr") = 4000 "Year of policy change";
          parameter Real p_serv_cap_out_ratio_1(unit = "yr") = 1.0 "Default fraction of service sector output ratio";
          parameter Real p_serv_cap_out_ratio_2(unit = "yr") = 1.0 "Controlled fraction of service sector output ratio";
          output Real s_serv_cap_out_ratio(unit = "yr") "Service sector capital output ratio";
        equation
          s_serv_cap_out_ratio = if time > t_policy_year then p_serv_cap_out_ratio_2 else p_serv_cap_out_ratio_1;
          y = s_serv_cap_out_ratio;
          annotation(
            Documentation(info = "<html>
This function is described on p.232 of <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>.
</html>"));
        end S_Serv_Cap_Out_Ratio;