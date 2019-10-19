        block Food "Total produced food"
          extends Interfaces.Nonlin_2;
          parameter Real land_fr_harvested = 0.7 "Land fraction harvested";
          parameter Real processing_loss = 0.1 "Processing loss";
          output Real land_yield(unit = "kg/(hectare.yr)") "Land yield";
          output Real arable_land(unit = "hectare") "Total arable land";
          output Real food(unit = "kg/yr") "Total produced food";
        equation
          land_yield = u1;
          arable_land = u2;
          food = land_yield * arable_land * land_fr_harvested * (1.0 - processing_loss);
          y = food;
          annotation(
            Documentation(info = "<html>
This function is described on p.280 of <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>.
</html>"));
        end Food;