        block DFD "Desired delay in filling orders"
          extends Interfaces.Nonlin_2;
          parameter Real DHD(unit = "wk") = 1 "Delay in handling";
          parameter Real DUD(unit = "wk") = 1 "Delay due to unfillable orders";
          output Real IAD "Actual produced goods in distribution";
          output Real IDD "Desired produced goods in distribution";
          output Real dfd(unit = "wk") "Desired delay in filling orders";
        equation
          IAD = u1;
          IDD = u2;
          dfd = DHD + DUD * IDD / IAD;
          y = dfd;
        end DFD;