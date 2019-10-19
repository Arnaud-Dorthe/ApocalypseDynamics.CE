        block S_NR_Res_Use_Fact "Non-recoverable resource utilization factor"
          extends Interfaces.Nonlin_1;
          parameter Real t_policy_year(unit = "yr") = 4000 "Year of policy change";
          parameter Real p_nr_res_use_fact_1 = 1 "Default non-recoverable resource utilization factor";
          output Real p_nr_res_use_fact_2 "Controlled non-recoverable resource utilization factor";
          output Real s_nr_res_use_fact "Non-recoverable resource utilization factor";
        equation
          p_nr_res_use_fact_2 = u;
          s_nr_res_use_fact = if time > t_policy_year then p_nr_res_use_fact_2 else p_nr_res_use_fact_1;
          y = s_nr_res_use_fact;
          annotation(
            Documentation(info = "<html>
This function is described on p.390 of <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>.
</html>"));
        end S_NR_Res_Use_Fact;