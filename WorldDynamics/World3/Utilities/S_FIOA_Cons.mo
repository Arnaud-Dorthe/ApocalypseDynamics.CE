        block S_FIOA_Cons "Fraction of industrial output allocated to consumption"
          extends Interfaces.Nonlin_2;
          parameter Real t_ind_equil_time(unit = "yr") = 4000 "Year of industrial equilibrium";
          output Real s_fioa_cons_const "Original capital allocation to resource use efficiency";
          output Real p_fioa_cons_var "Modified capital allocation to resource use efficiency";
          output Real s_fioa_cons "Fraction of industrial output allocated to consumption";
        equation
          s_fioa_cons_const = u1;
          p_fioa_cons_var = u2;
          s_fioa_cons = if time > t_ind_equil_time then p_fioa_cons_var else s_fioa_cons_const;
          y = s_fioa_cons;
          annotation(
            Documentation(info = "<html>
This function is described on p.223 of <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>.
</html>"));
        end S_FIOA_Cons;