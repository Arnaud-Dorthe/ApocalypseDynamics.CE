        block P_PPoll_Tech_Chg "Percentage of effective pollution technology change"
          extends Interfaces.Nonlin_1;
          parameter Real des_ppoll_index_DPOLX = 1.2 "Desired persistent pollution index";
          output Real ppoll_index "Persistent pollution index";
          output Real p_ppoll_tech_chg "Percentage of effective pollution technology change";
        equation
          ppoll_index = u;
          p_ppoll_tech_chg = 1 - ppoll_index / des_ppoll_index_DPOLX;
          y = p_ppoll_tech_chg;
        end P_PPoll_Tech_Chg;