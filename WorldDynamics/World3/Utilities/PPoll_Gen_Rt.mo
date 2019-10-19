        block PPoll_Gen_Rt "Persistent pollution generation rate"
          extends Interfaces.Nonlin_3;
          output Real s_ppoll_gen_fact "Percentage of effective persistent pollution generation";
          output Real ppoll_gen_ind(unit = "1/yr") "Persistent pollution generation from industry";
          output Real ppoll_gen_agr(unit = "1/yr") "Persistent pollution generation from agriculture";
          output Real ppoll_gen_rt(unit = "1/yr") "Persistent pollution generation rate";
        equation
          s_ppoll_gen_fact = u1;
          ppoll_gen_ind = u2;
          ppoll_gen_agr = u3;
          ppoll_gen_rt = (ppoll_gen_ind + ppoll_gen_agr) * s_ppoll_gen_fact;
          y = ppoll_gen_rt;
          annotation(
            Documentation(info = "<html>
This function is described on p.428 of <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>.
</html>"));
        end PPoll_Gen_Rt;