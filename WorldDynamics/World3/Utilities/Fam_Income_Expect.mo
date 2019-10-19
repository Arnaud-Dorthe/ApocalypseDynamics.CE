        block Fam_Income_Expect "Expected family income"
          extends Interfaces.Nonlin_2;
          output Real ind_out_pc(unit = "dollar/yr") "Per capita industrial output";
          output Real avg_ind_out_pc(unit = "dollar/yr") "Average per capita industrial output";
          output Real fam_income_expect "Expected family income fraction";
        equation
          ind_out_pc = u1;
          avg_ind_out_pc = u2;
          fam_income_expect = max({-0.2, min({0.2, (ind_out_pc - avg_ind_out_pc) / avg_ind_out_pc})});
          y = fam_income_expect;
          annotation(
            Documentation(info = "<html>
This function is described on p.122 of <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>.
</html>"));
        end Fam_Income_Expect;