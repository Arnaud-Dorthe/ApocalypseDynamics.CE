        block Industrial_Output "Industrial output"
          extends Interfaces.Nonlin_4;
          output Real s_fr_cap_al_obt_res "Fraction of capital allocated to obtaining resources";
          output Real capital_util_fr "Capital utilization fraction";
          output Real s_ind_cap_out_ratio(unit = "yr") "Industrial capital output ratio";
          output Real industrial_capital(unit = "dollar") "Capital invested in industry";
          output Real industrial_output(unit = "dollar/yr") "Industrial output";
        equation
          s_fr_cap_al_obt_res = u1;
          capital_util_fr = u2;
          s_ind_cap_out_ratio = u3;
          industrial_capital = u4;
          industrial_output = industrial_capital * (1 - s_fr_cap_al_obt_res) * capital_util_fr / s_ind_cap_out_ratio;
          y = industrial_output;
          annotation(
            Documentation(info = "<html>
This function is described on p.216 of <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>.
</html>"));
        end Industrial_Output;