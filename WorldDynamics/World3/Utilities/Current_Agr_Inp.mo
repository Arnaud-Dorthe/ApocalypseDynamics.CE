        block Current_Agr_Inp "Current agricultural input"
          extends Interfaces.Nonlin_2;
          output Real fr_inp_al_land_dev "Fraction of agricultural input allocated to land development";
          output Real tot_agric_invest(unit = "dollar/yr") "Total agricultural investment";
          output Real current_agr_inp(unit = "dollar/yr") "Current agricultural input";
        equation
          fr_inp_al_land_dev = u1;
          tot_agric_invest = u2;
          current_agr_inp = tot_agric_invest * (1 - fr_inp_al_land_dev);
          y = current_agr_inp;
          annotation(
            Documentation(info = "<html>
This function is described on p.292 of <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>.
</html>"));
        end Current_Agr_Inp;