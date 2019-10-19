        block FIOA_Ind "Fraction of industrial output allocated to industry"
          extends Interfaces.Nonlin_3;
          output Real s_fioa_agr "Fraction of industrial output allocated to agriculture";
          output Real s_fioa_serv "Fraction of industrial output allocated to the service sector";
          output Real s_fioa_cons "Fraction of industrial output allocated to consumption";
          output Real fioa_ind "Fraction of industrial output allocated to industry";
        equation
          s_fioa_agr = u1;
          s_fioa_serv = u2;
          s_fioa_cons = u3;
          fioa_ind = 1 - s_fioa_agr - s_fioa_serv - s_fioa_cons;
          y = fioa_ind;
          annotation(
            Documentation(info = "<html>
This function is described on p.223 of <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>.
</html>"));
        end FIOA_Ind;