        block Land_Rem_Urb_Ind_Use "Land removal for urban/industrial use"
          extends Interfaces.Nonlin_2;
          parameter Real urb_ind_land_dev_time(unit = "yr") = 10 "Urban and industrial land development time";
          output Real urb_ind_land_req(unit = "hectare") "Required urban and industrial land";
          output Real urban_ind_land(unit = "hectare") "Urban and industrial land";
          output Real land_rem_urb_ind_use(unit = "hectare/yr") "Land removal for urban/industrial use";
        equation
          urb_ind_land_req = u1;
          urban_ind_land = u2;
          land_rem_urb_ind_use = (urb_ind_land_req - urban_ind_land) / urb_ind_land_dev_time;
          y = land_rem_urb_ind_use;
          annotation(
            Documentation(info = "<html>
This function is described on p.322 of <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>.
</html>"));
        end Land_Rem_Urb_Ind_Use;