        block MWF "Manufacturing demand at factory"
          extends Interfaces.Nonlin_4;
          parameter Real DIF(unit = "wk") = 4 "Delay in inventory (and pipeline) adjustment";
          output Real mwf1 "Partial manufacturing adjustment for factory";
          output Real UOF "Actual unfilled orders";
          output Real UNF "Desired unfilled orders";
          output Real RRF(unit = "1/wk") "New orders arriving";
          output Real mwf(unit = "1/wk") "Manufacturing demand at factory";
        equation
          mwf1 = u1;
          UOF = u2;
          UNF = u3;
          RRF = u4;
          mwf = RRF + 1 / DIF * (mwf1 + UOF - UNF);
          y = mwf;
        end MWF;