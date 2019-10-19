        block Agr_Inp_Per_Hect "Agricultural input per hectare"
          extends Interfaces.Nonlin_3;
          output Real p_fr_inp_for_land_maint "Fraction of agricultural investiment allocated to land maintenance";
          output Real arable_land(unit = "hectare") "Total arable land";
          output Real agr_inp(unit = "dollar/yr") "Agricultural input";
          output Real agr_inp_per_hect(unit = "dollar/(hectare.yr)") "Agricultural input per hectare";
        equation
          p_fr_inp_for_land_maint = u1;
          arable_land = u2;
          agr_inp = u3;
          agr_inp_per_hect = agr_inp * (1 - p_fr_inp_for_land_maint) / arable_land;
          y = agr_inp_per_hect;
          annotation(
            Diagram,
            Documentation(info = "<html>
This function is described on p.294 of <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>.
</html>"));
        end Agr_Inp_Per_Hect;