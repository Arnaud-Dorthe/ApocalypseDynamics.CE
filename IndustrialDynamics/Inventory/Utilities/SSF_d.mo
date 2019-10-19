        block SSF_d "Delivery rate at factory"
          extends Interfaces.Nonlin_2;
          output Real IAF(unit = "1/wk") "Available distribution capacity at factory";
          output Real STF(unit = "1/wk") "Desired order filling rate";
          output Real SSF(unit = "1/wk") "Delivery rate at factory";
        equation
          IAF = u1;
          STF = u2;
          SSF = if IAF > STF then STF else IAF;
          y = SSF;
        end SSF_d;