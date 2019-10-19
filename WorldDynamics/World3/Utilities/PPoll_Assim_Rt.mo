        block PPoll_Assim_Rt "Persistent pollution assimilation rate"
          extends Interfaces.Nonlin_2;
          output Real pers_pollution "Persistent pollution";
          output Real assim_half_life(unit = "yr") "Persistent pollution assimilation half-life";
          output Real ppoll_assim_rt(unit = "1/yr") "Persistent pollution assimilation rate";
        equation
          pers_pollution = u1;
          assim_half_life = u2;
          ppoll_assim_rt = pers_pollution / (1.4 * assim_half_life);
          y = ppoll_assim_rt;
          annotation(
            Documentation(info = "<html>
This function is described on p.442 of <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>.
</html>"));
        end PPoll_Assim_Rt;