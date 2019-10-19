        block Res_Tech_Ch_Rt_NRATE "Non-recoverable resource technology change rate"
          extends Interfaces.Nonlin_2;
          parameter Real t_policy_year(unit = "yr") = 4000 "Year of policy change";
          output Real p_res_tech_chg_mlt_NRCM "Percentage of effective technology change";
          output Real res_tech_NRTD(unit = "1/yr") "Non-recoverable resource technology change factor";
          output Real res_tech_ch_rt_NRATE(unit = "1/yr") "Non-recoverable resource technology change rate";
        equation
          p_res_tech_chg_mlt_NRCM = u1;
          res_tech_NRTD = u2;
          res_tech_ch_rt_NRATE = if time > t_policy_year then p_res_tech_chg_mlt_NRCM * res_tech_NRTD else 0;
          y = res_tech_ch_rt_NRATE;
        end Res_Tech_Ch_Rt_NRATE;