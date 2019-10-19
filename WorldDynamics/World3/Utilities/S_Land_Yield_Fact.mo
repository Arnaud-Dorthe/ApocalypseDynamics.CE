        block S_Land_Yield_Fact "Land yield factor"
          extends Interfaces.Nonlin_1;
          parameter Real t_policy_year(unit = "yr") = 4000 "Year of policy change";
          parameter Real p_land_yield_fact_1 = 1 "Default land yield factor";
          output Real p_land_yield_fact_2 "Controlled land yield factor";
          output Real s_land_yield_fact "Land yield factor";
        equation
          p_land_yield_fact_2 = u;
          s_land_yield_fact = if time > t_policy_year then p_land_yield_fact_2 else p_land_yield_fact_1;
          y = s_land_yield_fact;
          annotation(
            Documentation(info = "<html>
This function is described on p.307 of <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>.
</html>"));
        end S_Land_Yield_Fact;