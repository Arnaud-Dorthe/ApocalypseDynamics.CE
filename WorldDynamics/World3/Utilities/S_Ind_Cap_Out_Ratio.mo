        block S_Ind_Cap_Out_Ratio "Industrial capital output ratio"
          extends Interfaces.Nonlin_1;
          parameter Real t_policy_year(unit = "yr") = 4000 "Year of policy change";
          parameter Real p_ind_cap_out_ratio_1(unit = "yr") = 3 "Default industrial capital output ratio";
          output Real p_ind_cap_out_ratio_2(unit = "yr") "Controlled industrial capital output ratio";
          output Real s_ind_cap_out_ratio(unit = "yr") "Industrial capital output ratio";
        equation
          p_ind_cap_out_ratio_2 = u;
          s_ind_cap_out_ratio = if time > t_policy_year then p_ind_cap_out_ratio_2 else p_ind_cap_out_ratio_1;
          y = s_ind_cap_out_ratio;
          annotation(
            Documentation(info = "<html>
This function is described on p.216 of <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>.
</html>"));
        end S_Ind_Cap_Out_Ratio;