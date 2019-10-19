        block HWI_Human_Welfare_Index "Human welfare index"
          extends Interfaces.Nonlin_3;
          output Real life_expectancy_index "Life expectancy index";
          output Real education_index "Education index";
          output Real gdp_index "Gross domestic product index";
          output Real hwi_human_welfare_index "Human welfare index";
        equation
          life_expectancy_index = u1;
          education_index = u2;
          gdp_index = u3;
          hwi_human_welfare_index = (life_expectancy_index + education_index + gdp_index) / 3;
          y = hwi_human_welfare_index;
        end HWI_Human_Welfare_Index;