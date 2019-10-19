        block S_Yield_Mlt_Air_Poll "Air pollution factor on agricultural yield"
          extends Interfaces.Nonlin_2;
          parameter Real t_air_poll_time(unit = "yr") = 4000 "Air pollution change time";
          output Real p_yield_mlt_air_poll_1 "Default air pollution factor on agricultural yield";
          output Real p_yield_mlt_air_poll_2 "Controlled air pollution factor on agricultural yield";
          output Real s_yield_mlt_air_poll "Air pollution factor on agricultural yield";
        equation
          p_yield_mlt_air_poll_1 = u1;
          p_yield_mlt_air_poll_2 = u2;
          s_yield_mlt_air_poll = if time > t_air_poll_time then p_yield_mlt_air_poll_2 else p_yield_mlt_air_poll_1;
          y = s_yield_mlt_air_poll;
          annotation(
            Documentation(info = "<html>
This function is described on p.310 of <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>.
</html>"));
        end S_Yield_Mlt_Air_Poll;