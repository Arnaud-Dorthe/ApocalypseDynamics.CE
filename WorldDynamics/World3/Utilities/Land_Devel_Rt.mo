        block Land_Devel_Rt "Land development rate"
          extends Interfaces.Nonlin_3;
          output Real dev_cost_per_hect(unit = "dollar/hectare") "Development cost per hectare";
          output Real fr_inp_al_land_dev "Percentage of land available for development";
          output Real tot_agric_invest(unit = "dollar/yr") "Total agricultural investment";
          output Real land_devel_rt(unit = "hectare/yr") "Land development rate";
        equation
          dev_cost_per_hect = u1;
          fr_inp_al_land_dev = u2;
          tot_agric_invest = u3;
          land_devel_rt = tot_agric_invest * fr_inp_al_land_dev / dev_cost_per_hect;
          y = land_devel_rt;
          annotation(
            Documentation(info = "<html>
This function is described on p.289 of <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>.
</html>"));
        end Land_Devel_Rt;