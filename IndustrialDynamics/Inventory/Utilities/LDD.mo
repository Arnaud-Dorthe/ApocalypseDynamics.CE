        block LDD "Desired delay in order processing"
          extends Interfaces.Nonlin_2;
          parameter Real DCD(unit = "wk") = 2 "Clerical delay";
          parameter Real DMD(unit = "wk") = 0.5 "Mail delay";
          parameter Real DTD(unit = "wk") = 2 "Transportation delay";
          output Real RSD(unit = "1/wk") "Delayed new orders";
          output Real DFF(unit = "wk") "Desired delay in filling orders";
          output Real ldd "Desired delay in order processing";
        equation
          RSD = u1;
          DFF = u2;
          ldd = RSD * (DCD + DMD + DFF + DTD);
          y = ldd;
        end LDD;