        block PPD2 "Partial manufacturing adjustment for distribution"
          extends Interfaces.Nonlin_4;
          output Real LDD "Desired delays in order processing";
          output Real LAD "Actual delays in order processing";
          output Real IDD "Desired produced goods in distribution";
          output Real IAD "Actual produced goods in distribution";
          output Real ppd2 "Partial manufacturing adjustment for distribution";
        equation
          LDD = u1;
          LAD = u2;
          IDD = u3;
          IAD = u4;
          ppd2 = LDD - LAD + IDD - IAD;
          y = ppd2;
        end PPD2;