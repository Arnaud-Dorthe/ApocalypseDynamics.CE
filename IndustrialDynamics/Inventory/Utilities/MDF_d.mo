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