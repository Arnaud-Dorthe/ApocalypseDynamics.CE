        block S_Indic_Serv_PC "Fraction of per capita indicated output allocated to service sector"
          extends Interfaces.Nonlin_2;
          parameter Real t_policy_year(unit = "yr") = 4000 "Year of policy change";
          output Real p_indic_serv_pc_1(unit = "dollar/yr") "Default fraction of per capita indicated output allocated to service sector";
          output Real p_indic_serv_pc_2(unit = "dollar/yr") "Controlled fraction of per capita indicated output allocated to service sector";
          output Real s_indic_serv_pc(unit = "dollar/yr") "Fraction of per capita indicated output allocated to service sector";
        equation
          p_indic_serv_pc_1 = u1;
          p_indic_serv_pc_2 = u2;
          s_indic_serv_pc = if time > t_policy_year then p_indic_serv_pc_2 else p_indic_serv_pc_1;
          y = s_indic_serv_pc;
          annotation(
            Documentation(info = "<html>
This function is described on p.227 of <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>.
</html>"));
        end S_Indic_Serv_PC;