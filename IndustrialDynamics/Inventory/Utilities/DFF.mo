        block DFF "Desired delay in filling orders"
          extends Interfaces.Nonlin_2;
          parameter Real DHF(unit = "wk") = 1 "Delay in handling";
          parameter Real DUF(unit = "wk") = 1 "Delay due to unfillable orders";
          output Real IAF "Actual produced goods in factory";
          output Real IDF "Desired produced goods in factory";
          output Real dff(unit = "wk") "Desired delay in filling orders";
        equation
          IAF = u1;
          IDF = u2;
          dff = DHF + DUF * IDF / IAF;
          y = dff;
        end DFF;