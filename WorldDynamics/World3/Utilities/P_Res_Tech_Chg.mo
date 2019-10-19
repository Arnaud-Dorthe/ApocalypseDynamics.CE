        block P_Res_Tech_Chg "Percentage of effective resource technology change"
          extends Interfaces.Nonlin_1;
          parameter Real des_res_use_rt_DNRUR(unit = "ton/yr") = 4800000000.0 "Desired resource utilization rate";
          output Real nr_res_use_rate(unit = "ton/yr") "Non-recoverable resource utilization rate";
          output Real p_res_tech_chg "Percentage of effective resource technology change";
        equation
          nr_res_use_rate = u;
          p_res_tech_chg = 1 - nr_res_use_rate / des_res_use_rt_DNRUR;
          y = p_res_tech_chg;
        end P_Res_Tech_Chg;