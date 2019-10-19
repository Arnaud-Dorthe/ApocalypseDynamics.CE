        block Marg_Prod_Land_Dev "Development of marginally producing land"
          extends Interfaces.Nonlin_2;
          parameter Real social_discount(unit = "1/yr") = 0.07 "Social discount";
          output Real land_yield(unit = "kg/(hectare.yr)") "Land yield";
          output Real dev_cost_per_hect(unit = "dollar/hectare") "Development cost per hectare";
          output Real marg_prod_land_dev(unit = "kg/dollar") "Marginal productivity of land development";
        equation
          land_yield = u1;
          dev_cost_per_hect = u2;
          marg_prod_land_dev = land_yield / (dev_cost_per_hect * social_discount);
          y = marg_prod_land_dev;
          annotation(
            Documentation(info = "<html>
This function is described on p.312 of <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>.
</html>"));
        end Marg_Prod_Land_Dev;