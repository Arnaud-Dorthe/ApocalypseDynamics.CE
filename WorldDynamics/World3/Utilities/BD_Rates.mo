        block BD_Rates "Birth and death rates"
          extends Interfaces.Nonlin_2;
          output Real bd(unit = "1/yr") "Total annual births or deaths";
          output Real pop "Total population";
          output Real bd_rate(unit = "1/yr") "Total annual birth or death rate";
        equation
          bd = u1;
          pop = u2;
          bd_rate = 1000 * bd / pop;
          y = bd_rate;
          annotation(
            Documentation(info = "<html>
This function is described on p.140 of <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>.
</html>"));
        end BD_Rates;