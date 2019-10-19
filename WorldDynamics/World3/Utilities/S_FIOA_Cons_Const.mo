        block S_FIOA_Cons_Const "Fraction of industrial output allocated to consumption"
          extends Interfaces.Nonlin_0;
          parameter Real t_policy_year(unit = "yr") = 4000 "Year of policy change";
          parameter Real p_fioa_cons_const_1 = 0.43 "Default fraction of industrial output allocated to consumption";
          parameter Real p_fioa_cons_const_2 = 0.43 "Controlled fraction of industrial output allocated to consumption";
          output Real s_fioa_cons_const "Fraction of industrial output allocated to consumption";
        equation
          s_fioa_cons_const = if time > t_policy_year then p_fioa_cons_const_2 else p_fioa_cons_const_1;
          y = s_fioa_cons_const;
          annotation(
            Documentation(info = "<html>
This function is described on p.223 of <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>.
</html>"));
        end S_FIOA_Cons_Const;