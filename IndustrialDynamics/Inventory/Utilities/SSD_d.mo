        block SSD_d "Delivery rate at distribution"
          extends Interfaces.Nonlin_2;
          output Real IAD(unit = "1/wk") "Available distribution capacity at distribution";
          output Real STD(unit = "1/wk") "Desired order filling rate";
          output Real SSD(unit = "1/wk") "Delivery rate at distribution";
        equation
          IAD = u1;
          STD = u2;
          SSD = if IAD > STD then STD else IAD;
          y = SSD;
        end SSD_d;