        block PPoll_Tech_Chg_Rt "Persistent pollution technology change rate"
          extends Interfaces.Nonlin_2;
          parameter Real t_policy_year(unit = "yr") = 4000 "Year of policy change";
          output Real p_ppoll_tech_chg_mlt_POLGFM "Percentage of effective technology change on pollution generation";
          output Real ppoll_tech_PTD(unit = "1/yr") "Persistent pollution technology change factor";
          output Real ppoll_tech_chg_rt(unit = "1/yr") "Persistent pollution technology change rate";
        equation
          p_ppoll_tech_chg_mlt_POLGFM = u1;
          ppoll_tech_PTD = u2;
          ppoll_tech_chg_rt = if time > t_policy_year then p_ppoll_tech_chg_mlt_POLGFM * ppoll_tech_PTD else 0;
          y = ppoll_tech_chg_rt;
        end PPoll_Tech_Chg_Rt;