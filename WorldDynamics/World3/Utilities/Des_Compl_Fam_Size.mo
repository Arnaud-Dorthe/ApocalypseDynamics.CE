        block Des_Compl_Fam_Size "Desired complete family size"
          extends Interfaces.Nonlin_2;
          parameter Real t_zero_pop_grow_time(unit = "yr") = 4000 "Time to zero population growth";
          parameter Real des_compl_fam_size_norm = 3.8 "Desired normal complete family size";
          output Real soc_fam_size_norm "Social family size norm";
          output Real fam_resp_to_soc_norm "Family response to social norm";
          output Real des_compl_fam_size "Desired complete family size";
        equation
          soc_fam_size_norm = u1;
          fam_resp_to_soc_norm = u2;
          des_compl_fam_size = if time > t_zero_pop_grow_time then 2.0 else des_compl_fam_size_norm * fam_resp_to_soc_norm * soc_fam_size_norm;
          y = des_compl_fam_size;
          annotation(
            Documentation(info = "<html>
This function is described on p.113 of <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>.
</html>"));
        end Des_Compl_Fam_Size;