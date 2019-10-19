        block S_Indic_Food_PC "Indicated food per capita"
          extends Interfaces.Nonlin_2;
          parameter Real t_policy_year(unit = "yr") = 4000 "Year of policy change";
          output Real p_indic_food_pc_1(unit = "kg/yr") "Default indicated food per capita";
          output Real p_indic_food_pc_2(unit = "kg/yr") "Controlled indicated food per capita";
          output Real s_indic_food_pc(unit = "kg/yr") "Indicated food per capita";
        equation
          p_indic_food_pc_1 = u1;
          p_indic_food_pc_2 = u2;
          s_indic_food_pc = if time > t_policy_year then p_indic_food_pc_2 else p_indic_food_pc_1;
          y = s_indic_food_pc;
          annotation(
            Documentation(info = "<html>
This function is described on p.286 of <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>.
</html>"));
        end S_Indic_Food_PC;