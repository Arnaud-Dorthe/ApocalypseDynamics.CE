        block S_PPoll_Gen_Fact "Persistent pollution generation factor"
          extends Interfaces.Nonlin_1;
          parameter Real t_policy_year(unit = "yr") = 4000 "Year of policy change";
          parameter Real p_ppoll_gen_fact_1 = 1 "Default persistent pollution generation factor";
          output Real p_ppoll_gen_fact_2 "Controlled persistent pollution generation factor";
          output Real s_ppoll_gen_fact "Persistent pollution generation factor";
        equation
          p_ppoll_gen_fact_2 = u;
          s_ppoll_gen_fact = if time > t_policy_year then p_ppoll_gen_fact_2 else p_ppoll_gen_fact_1;
          y = s_ppoll_gen_fact;
          annotation(
            Documentation(info = "<html>
This function is described on p.428 of <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>.
</html>"));
        end S_PPoll_Gen_Fact;