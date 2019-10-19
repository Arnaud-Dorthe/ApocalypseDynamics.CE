        block Ch_Perc_Food_Ratio "Change in perceived food ratio"
          extends Interfaces.Nonlin_2;
          parameter Real food_short_perc_del(unit = "yr") = 2 "Food shortage perception delay";
          output Real food_ratio "Food ratio";
          output Real perc_food_ratio "Perceived food ratio";
          output Real chg_perc_food_ratio(unit = "1/yr") "Change in perceived food ratio";
        equation
          food_ratio = u1;
          perc_food_ratio = u2;
          chg_perc_food_ratio = (food_ratio - perc_food_ratio) / food_short_perc_del;
          y = chg_perc_food_ratio;
          annotation(
            Documentation(info = "<html>
This function is described on p.333 of <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>.
</html>"));
        end Ch_Perc_Food_Ratio;