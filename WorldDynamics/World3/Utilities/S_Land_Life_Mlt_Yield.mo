        block S_Land_Life_Mlt_Yield "Land Life Yield Factor"
          extends Interfaces.Nonlin_2;
          constant Real time_unit(unit = "yr") = 1 "Unit conversion constant";
          parameter Real t_land_life_time(unit = "yr") = 4000 "Land life time";
          output Real p_land_life_mlt_yield_1 "Percentage of land with multiple yield - first model";
          output Real p_land_life_mlt_yield_2 "Percentage of land with multiple yield - second model";
          output Real s_land_life_mlt_yield "Land Life Yield Factor";
        protected
          Real k "Homotopy factor";
        equation
          p_land_life_mlt_yield_1 = u1;
          p_land_life_mlt_yield_2 = u2;
          if time > t_land_life_time then
            k = 0.95 ^ ((time - t_land_life_time) / time_unit);
          else
            k = 1;
          end if;
          s_land_life_mlt_yield = k * p_land_life_mlt_yield_1 + (1 - k) * p_land_life_mlt_yield_2;
          y = s_land_life_mlt_yield;
          annotation(
            Documentation(info = "<html>
This function is described on p.317 of <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>.
</html>"));
        end S_Land_Life_Mlt_Yield;