        block Yield_Tech_Chg_Rt "Yield technology change rate"
          extends Interfaces.Nonlin_2;
          parameter Real t_policy_year(unit = "yr") = 4000 "Year of policy change";
          output Real p_yield_tech_chg_mlt_LYCM "Yield technology change factor";
          output Real yield_tech_LYTD "Yield technology";
          output Real yield_tech_chg_rt(unit = "1/yr") "Yield technology change rate";
        equation
          p_yield_tech_chg_mlt_LYCM = u1;
          yield_tech_LYTD = u2;
          yield_tech_chg_rt = if time > t_policy_year then p_yield_tech_chg_mlt_LYCM * yield_tech_LYTD else 0;
          y = yield_tech_chg_rt;
        end Yield_Tech_Chg_Rt;