        block Land_Fert_Reg "Land fertility regeneration"
          extends Interfaces.Nonlin_2;
          parameter Real inherent_land_fert(unit = "kg/(hectare.yr)") = 600 "Inherent land fertility";
          output Real land_fert_regen_time(unit = "yr") "Land fertility regeneration time";
          output Real land_fertility(unit = "kg/(hectare.yr)") "Land fertility";
          output Real land_fert_regen(unit = "kg/(hectare.yr2)") "Land fertility regeneration";
        equation
          land_fert_regen_time = u1;
          land_fertility = u2;
          land_fert_regen = (inherent_land_fert - land_fertility) / land_fert_regen_time;
          y = land_fert_regen;
          annotation(
            Documentation(info = "<html>
This function is described on p.328 of <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>.
</html>"));
        end Land_Fert_Reg;