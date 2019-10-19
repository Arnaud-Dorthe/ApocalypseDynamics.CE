        block S_FIOA_Serv "Fraction of industrial output allocated to service sector"
          extends Interfaces.Nonlin_2;
          parameter Real t_policy_year(unit = "yr") = 4000 "Year of policy change";
          output Real p_fr_io_al_serv_1 "Default fraction of industrial output allocated to service sector";
          output Real p_fr_io_al_serv_2 "Controlled fraction of industrial output allocated to service sector";
          output Real s_fioa_serv "Fraction of industrial output allocated to service sector";
        equation
          p_fr_io_al_serv_1 = u1;
          p_fr_io_al_serv_2 = u2;
          s_fioa_serv = if time > t_policy_year then p_fr_io_al_serv_2 else p_fr_io_al_serv_1;
          y = s_fioa_serv;
          annotation(
            Documentation(info = "<html>
This function is described on p.229 of <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>.
</html>"));
        end S_FIOA_Serv;