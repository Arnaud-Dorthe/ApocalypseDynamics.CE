        block S_Fr_Cap_Al_Obt_Res "Fraction of capital allocated to resource use efficiency"
          extends Interfaces.Nonlin_2;
          parameter Real t_fcaor_time(unit = "yr") = 4000 "Year of capital allocation to resource use efficiency";
          output Real p_fr_cap_al_obt_res_1 "Original capital allocation to resource use efficiency";
          output Real p_fr_cap_al_obt_res_2 "Modified capital allocation to resource use efficiency";
          output Real s_fr_cap_al_obt_res "Fraction of capital allocated to resource use efficiency";
        equation
          p_fr_cap_al_obt_res_1 = u1;
          p_fr_cap_al_obt_res_2 = u2;
          s_fr_cap_al_obt_res = if time > t_fcaor_time then p_fr_cap_al_obt_res_2 else p_fr_cap_al_obt_res_1;
          y = s_fr_cap_al_obt_res;
          annotation(
            Documentation(info = "<html>
This function is described on p.393 of <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>.
</html>"));
        end S_Fr_Cap_Al_Obt_Res;