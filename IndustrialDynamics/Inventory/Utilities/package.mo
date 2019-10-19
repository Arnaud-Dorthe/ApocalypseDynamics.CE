      package Utilities "Utility models of Forrester's inventory model"
        extends Modelica.Icons.Library;

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

        block LAD "Actual delay in order processing"
          extends Interfaces.Nonlin_4;
          output Real CPD "Items delayed in order";
          output Real PMD "Items delayed in mail";
          output Real UOF "Unfilled orders";
          output Real MTD "Items delayed in transportation";
          output Real lad "Items delayed in order processing";
        equation
          CPD = u1;
          PMD = u2;
          UOF = u3;
          MTD = u4;
          lad = CPD + PMD + UOF + MTD;
          y = lad;
        end LAD;

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

        block MDF_d "Manufacturing rate at factory"
          extends Interfaces.Nonlin_1;
          parameter Real ALF(unit = "1/wk") = 1000000.0 "Manufacturing capacity limit at factory";
          output Real MWF(unit = "1/wk") "Manufacturing demand at factory";
          output Real MDF(unit = "1/wk") "Manufacturing rate at factory";
        equation
          MWF = u;
          MDF = if ALF >= MWF then MWF else ALF;
          y = MDF;
        end MDF_d;

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
        annotation(
          preferedView = "info",
          Documentation(info = "<html>
Utility models of Forrester's inventory model.
</html>"));
      end Utilities;