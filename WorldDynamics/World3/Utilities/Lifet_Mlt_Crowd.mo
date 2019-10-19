        block Lifet_Mlt_Crowd "Life expectancy multiplier due to crowding"
          extends Interfaces.Nonlin_2;
          output Real crowd_mult_ind "Crowding multiplier index";
          output Real fr_pop_urban "Fraction of urban population";
          output Real lifet_mlt_crowd "Life expectancy multiplier due to crowding";
        equation
          crowd_mult_ind = u1;
          fr_pop_urban = u2;
          lifet_mlt_crowd = 1 - crowd_mult_ind * fr_pop_urban;
          y = lifet_mlt_crowd;
          annotation(
            Documentation(info = "<html>
This function is described on p.90 of <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>.
</html>"));
        end Lifet_Mlt_Crowd;