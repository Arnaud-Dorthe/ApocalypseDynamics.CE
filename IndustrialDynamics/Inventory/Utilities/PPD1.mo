        block PPD1 "Manufacturing demand at distribution"
          extends Interfaces.Nonlin_4;
          parameter Real DID(unit = "wk") = 4 "Delay in inventory (and pipeline) adjustment";
          output Real ppd2 "Partial manufacturing adjustment for distribution";
          output Real UOD "Actual unfilled orders";
          output Real UND "Desired unfilled orders";
          output Real RRD(unit = "1/wk") "New orders arriving";
          output Real ppd1(unit = "1/wk") "Manufacturing demand at distribution";
        equation
          ppd2 = u1;
          UOD = u2;
          UND = u3;
          RRD = u4;
          ppd1 = RRD + 1 / DID * (ppd2 + UOD - UND);
          y = ppd1;
        end PPD1;