        block Death_Factors "Number of people dying from a given group"
          extends Interfaces.Nonlin_2;
          output Real pop "Population of previous group";
          output Real mort(unit = "1/yr") "Mortality rate of people in previous group";
          output Real deaths(unit = "1/yr") "Number of people dying per year";
        equation
          pop = u1;
          mort = u2;
          deaths = pop * mort;
          y = deaths;
          annotation(
            Documentation(info = "<html>
This function is described on p.57 of <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>.
</html>"));
        end Death_Factors;