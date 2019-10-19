        block Matur_Factors "Number of people switching groups"
          extends Interfaces.Nonlin_2;
          parameter Real bracket(unit = "yr") = 1 "Time bracket of previous group";
          output Real pop "Population of previous group";
          output Real mort "Mortality rate of people in previous group";
          output Real matur(unit = "1/yr") "Number of people switching groups";
        equation
          pop = u1;
          mort = u2;
          matur = pop * (1 - mort) / bracket;
          y = matur;
          annotation(
            Documentation(info = "<html>
This function is described on p.141 of <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>.
</html>"));
        end Matur_Factors;