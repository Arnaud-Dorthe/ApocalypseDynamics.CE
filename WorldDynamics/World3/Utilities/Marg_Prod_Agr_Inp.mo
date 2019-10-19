        block Marg_Prod_Agr_Inp "Agricultural input for marginally producing land"
          extends Interfaces.Nonlin_4;
          output Real land_yield(unit = "kg/(hectare.yr)") "Total land yield";
          output Real land_yield_mlt_cap "Land yield multiplier from capital";
          output Real marg_land_yield_mlt_cap(unit = "hectare/dollar") "Marginal land yield multiplier from capital";
          output Real s_avg_life_agr_inp(unit = "yr") "Average life of agricultural input";
          output Real marg_prod_agr_inp(unit = "kg/dollar") "Marginal productivity of agricultural inputs";
        equation
          land_yield = u1;
          land_yield_mlt_cap = u2;
          marg_land_yield_mlt_cap = u3;
          s_avg_life_agr_inp = u4;
          marg_prod_agr_inp = s_avg_life_agr_inp * land_yield * marg_land_yield_mlt_cap / land_yield_mlt_cap;
          y = marg_prod_agr_inp;
          annotation(
            Documentation(info = "<html>
This function is described on p.313 of <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>.
</html>"));
        end Marg_Prod_Agr_Inp;