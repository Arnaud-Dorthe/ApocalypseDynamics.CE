        block MWF1 "Partial manufacturing adjustment for factory"
          extends Interfaces.Nonlin_4;
          output Real LDF "Desired delays in order processing";
          output Real LAF "Actual delays in order processing";
          output Real IDF "Desired produced goods in factory";
          output Real IAF "Actual produced goods in factory";
          output Real mwf1 "Partial manufacturing adjustment for factory";
        equation
          LDF = u1;
          LAF = u2;
          IDF = u3;
          IAF = u4;
          mwf1 = LDF - LAF + IDF - IAF;
          y = mwf1;
        end MWF1;