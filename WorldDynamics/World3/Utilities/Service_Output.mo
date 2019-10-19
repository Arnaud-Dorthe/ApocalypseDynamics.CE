        block Service_Output "Service sector output"
          extends Interfaces.Nonlin_3;
          output Real capital_util_fr "Fraction of capacity utilization";
          output Real s_serv_cap_out_ratio(unit = "yr") "Service sector capital output ratio";
          output Real service_capital(unit = "dollar") "Capital invested in the service sector";
          output Real service_output(unit = "dollar/yr") "Service sector output";
        equation
          capital_util_fr = u1;
          s_serv_cap_out_ratio = u2;
          service_capital = u3;
          service_output = service_capital * capital_util_fr / s_serv_cap_out_ratio;
          y = service_output;
          annotation(
            Documentation(info = "<html>
This function is described on p.231 of <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>.
</html>"));
        end Service_Output;