        block Need_For_Fert_Cont "Need for fertility continuation"
          extends Interfaces.Nonlin_2;
          output Real max_tot_fert "Maximal total fertility";
          output Real des_tot_fert "Desired total fertility";
          output Real need_for_fert_cont "Need for fertility continuation";
        equation
          max_tot_fert = u1;
          des_tot_fert = u2;
          need_for_fert_cont = max({0, min({10, max_tot_fert / des_tot_fert - 1.0})});
          y = need_for_fert_cont;
          annotation(
            Documentation(info = "<html>
This function is described on p.131 of <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>.
</html>"));
        end Need_For_Fert_Cont;