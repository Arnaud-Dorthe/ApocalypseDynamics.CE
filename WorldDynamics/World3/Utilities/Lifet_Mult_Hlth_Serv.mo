        block Lifet_Mult_Hlth_Serv "Life expectancy multiplier due to health services"
          extends Interfaces.Nonlin_2;
          output Real lifet_mlt_hlth_serv_1 "Original life expectancy multiplier due to health services";
          output Real lifet_mlt_hlth_serv_2 "Improved life expectancy multiplier due to health services";
          output Real lifet_mult_hlth_serv "Life expectancy multiplier due to health services";
        equation
          lifet_mlt_hlth_serv_1 = u1;
          lifet_mlt_hlth_serv_2 = u2;
          lifet_mult_hlth_serv = if time > 1940 then lifet_mlt_hlth_serv_2 else lifet_mlt_hlth_serv_1;
          y = lifet_mult_hlth_serv;
          annotation(
            Documentation(info = "<html>
This function is described on p.76 of <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>.
</html>"));
        end Lifet_Mult_Hlth_Serv;