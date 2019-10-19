      package Utilities "Utility models of Meadows' WORLD3 model"
        extends Modelica.Icons.Library;

        block Agr_Inp_Per_Hect "Agricultural input per hectare"
          extends Interfaces.Nonlin_3;
          output Real p_fr_inp_for_land_maint "Fraction of agricultural investiment allocated to land maintenance";
          output Real arable_land(unit = "hectare") "Total arable land";
          output Real agr_inp(unit = "dollar/yr") "Agricultural input";
          output Real agr_inp_per_hect(unit = "dollar/(hectare.yr)") "Agricultural input per hectare";
        equation
          p_fr_inp_for_land_maint = u1;
          arable_land = u2;
          agr_inp = u3;
          agr_inp_per_hect = agr_inp * (1 - p_fr_inp_for_land_maint) / arable_land;
          y = agr_inp_per_hect;
          annotation(
            Diagram,
            Documentation(info = "<html>
This function is described on p.294 of <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>.
</html>"));
        end Agr_Inp_Per_Hect;

        block BD_Rates "Birth and death rates"
          extends Interfaces.Nonlin_2;
          output Real bd(unit = "1/yr") "Total annual births or deaths";
          output Real pop "Total population";
          output Real bd_rate(unit = "1/yr") "Total annual birth or death rate";
        equation
          bd = u1;
          pop = u2;
          bd_rate = 1000 * bd / pop;
          y = bd_rate;
          annotation(
            Documentation(info = "<html>
This function is described on p.140 of <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>.
</html>"));
        end BD_Rates;

        block Birth_Factors "Birth factors of WORLD3 model"
          extends Interfaces.Nonlin_3;
          parameter Real Repro_Life(unit = "yr") = 30 "Reproductive lifetime";
          parameter Real t_pop_equil_time(unit = "yr") = 4000 "Population equilibrium time";
          output Real tot_fert "Total fertility";
          output Real deaths "Total deaths";
          output Real pop_15_44 "Population between the ages of 15 and 44";
          output Real births "Total births";
        equation
          tot_fert = u1;
          deaths = u2;
          pop_15_44 = u3;
          births = if time > t_pop_equil_time then deaths else 0.5 * tot_fert * pop_15_44 / Repro_Life;
          y = births;
          annotation(
            Documentation(info = "<html>
This function is described on p.96 of <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>.
</html>"));
        end Birth_Factors;

        block Ch_Agr_Inp "Change in agricultural input"
          extends Interfaces.Nonlin_3;
          output Real current_agr_inp(unit = "dollar/yr") "Current agricultural input";
          output Real s_avg_life_agr_inp(unit = "yr") "Average life of agricultural input";
          output Real agr_inp(unit = "dollar/yr") "Agricultural input";
          output Real chg_agr_inp(unit = "dollar/yr2") "Change in agricultural input";
        equation
          current_agr_inp = u1;
          s_avg_life_agr_inp = u2;
          agr_inp = u3;
          chg_agr_inp = (current_agr_inp - agr_inp) / s_avg_life_agr_inp;
          y = chg_agr_inp;
          annotation(
            Documentation(info = "<html>
This function is described on p.292 of <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>.
</html>"));
        end Ch_Agr_Inp;

        block Ch_Lab_Util_Fr_Del "Change in delayed labor utilization fraction"
          extends Interfaces.Nonlin_2;
          parameter Real labor_util_fr_del_time(unit = "yr") = 2 "Labor utilization fraction delay time";
          output Real labor_util_fr "Labor utilization fraction";
          output Real labor_util_fr_del "Delayed labor utilization fraction";
          output Real chg_lab_util_fr_del(unit = "1/yr") "Change in delayed labor utilization fraction";
        equation
          labor_util_fr = u1;
          labor_util_fr_del = u2;
          chg_lab_util_fr_del = (labor_util_fr - labor_util_fr_del) / labor_util_fr_del_time;
          y = chg_lab_util_fr_del;
          annotation(
            Documentation(info = "<html>
This function is described on p.241 of <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>.
</html>"));
        end Ch_Lab_Util_Fr_Del;

        block Ch_Perc_Food_Ratio "Change in perceived food ratio"
          extends Interfaces.Nonlin_2;
          parameter Real food_short_perc_del(unit = "yr") = 2 "Food shortage perception delay";
          output Real food_ratio "Food ratio";
          output Real perc_food_ratio "Perceived food ratio";
          output Real chg_perc_food_ratio(unit = "1/yr") "Change in perceived food ratio";
        equation
          food_ratio = u1;
          perc_food_ratio = u2;
          chg_perc_food_ratio = (food_ratio - perc_food_ratio) / food_short_perc_del;
          y = chg_perc_food_ratio;
          annotation(
            Documentation(info = "<html>
This function is described on p.333 of <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>.
</html>"));
        end Ch_Perc_Food_Ratio;

        block Current_Agr_Inp "Current agricultural input"
          extends Interfaces.Nonlin_2;
          output Real fr_inp_al_land_dev "Fraction of agricultural input allocated to land development";
          output Real tot_agric_invest(unit = "dollar/yr") "Total agricultural investment";
          output Real current_agr_inp(unit = "dollar/yr") "Current agricultural input";
        equation
          fr_inp_al_land_dev = u1;
          tot_agric_invest = u2;
          current_agr_inp = tot_agric_invest * (1 - fr_inp_al_land_dev);
          y = current_agr_inp;
          annotation(
            Documentation(info = "<html>
This function is described on p.292 of <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>.
</html>"));
        end Current_Agr_Inp;

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

        block Fert_Cont_Eff "Effective fertility continuation"
          extends Interfaces.Nonlin_1;
          parameter Real t_fert_cont_eff_time(unit = "yr") = 4000 "Year of continued fertility change";
          output Real fert_cont_eff_table "Effective fertility continuation table";
          output Real fert_cont_eff "Effective fertility continuation";
        equation
          fert_cont_eff_table = u;
          fert_cont_eff = if time > t_fert_cont_eff_time then 1.0 else fert_cont_eff_table;
          y = fert_cont_eff;
          annotation(
            Documentation(info = "<html>
This function is described on p.133 of <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>.
</html>"));
        end Fert_Cont_Eff;

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

        block Food "Total produced food"
          extends Interfaces.Nonlin_2;
          parameter Real land_fr_harvested = 0.7 "Land fraction harvested";
          parameter Real processing_loss = 0.1 "Processing loss";
          output Real land_yield(unit = "kg/(hectare.yr)") "Land yield";
          output Real arable_land(unit = "hectare") "Total arable land";
          output Real food(unit = "kg/yr") "Total produced food";
        equation
          land_yield = u1;
          arable_land = u2;
          food = land_yield * arable_land * land_fr_harvested * (1.0 - processing_loss);
          y = food;
          annotation(
            Documentation(info = "<html>
This function is described on p.280 of <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>.
</html>"));
        end Food;

        block GDP_Index "Gross domestic product index"
          extends Interfaces.Nonlin_1;
          output Real gdp_per_capita(unit = "dollar/yr") "Per capita gross domestic product";
          output Real gdp_index "Gross domestic product index";
        equation
          gdp_per_capita = u;
          gdp_index = (Modelica.Math.log10(gdp_per_capita) - Modelica.Math.log10(24.0)) / (Modelica.Math.log10(9508.0) - Modelica.Math.log10(24.0));
          y = gdp_index;
        end GDP_Index;

        block HEF_Human_Ecological_Footprint "Human ecological footprint"
          extends Interfaces.Nonlin_3;
          output Real arable_land_in_Gha(unit = "Gha") "Arable land in Gigahectare";
          output Real urban_land_in_Gha(unit = "Gha") "Urban land in Gigahectare";
          output Real absorption_land_in_Gha(unit = "Gha") "Absorption land in Gigahectare";
          output Real hef_human_ecological_footprint(unit = "hectare") "Human ecological footprint";
        equation
          arable_land_in_Gha = u1;
          urban_land_in_Gha = u2;
          absorption_land_in_Gha = u3;
          hef_human_ecological_footprint = (arable_land_in_Gha + urban_land_in_Gha + absorption_land_in_Gha) / 1.91;
          y = hef_human_ecological_footprint;
        end HEF_Human_Ecological_Footprint;

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

        block Industrial_Output "Industrial output"
          extends Interfaces.Nonlin_4;
          output Real s_fr_cap_al_obt_res "Fraction of capital allocated to obtaining resources";
          output Real capital_util_fr "Capital utilization fraction";
          output Real s_ind_cap_out_ratio(unit = "yr") "Industrial capital output ratio";
          output Real industrial_capital(unit = "dollar") "Capital invested in industry";
          output Real industrial_output(unit = "dollar/yr") "Industrial output";
        equation
          s_fr_cap_al_obt_res = u1;
          capital_util_fr = u2;
          s_ind_cap_out_ratio = u3;
          industrial_capital = u4;
          industrial_output = industrial_capital * (1 - s_fr_cap_al_obt_res) * capital_util_fr / s_ind_cap_out_ratio;
          y = industrial_output;
          annotation(
            Documentation(info = "<html>
This function is described on p.216 of <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>.
</html>"));
        end Industrial_Output;

        block Land_Devel_Rt "Land development rate"
          extends Interfaces.Nonlin_3;
          output Real dev_cost_per_hect(unit = "dollar/hectare") "Development cost per hectare";
          output Real fr_inp_al_land_dev "Percentage of land available for development";
          output Real tot_agric_invest(unit = "dollar/yr") "Total agricultural investment";
          output Real land_devel_rt(unit = "hectare/yr") "Land development rate";
        equation
          dev_cost_per_hect = u1;
          fr_inp_al_land_dev = u2;
          tot_agric_invest = u3;
          land_devel_rt = tot_agric_invest * fr_inp_al_land_dev / dev_cost_per_hect;
          y = land_devel_rt;
          annotation(
            Documentation(info = "<html>
This function is described on p.289 of <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>.
</html>"));
        end Land_Devel_Rt;

        block Land_Fert_Reg "Land fertility regeneration"
          extends Interfaces.Nonlin_2;
          parameter Real inherent_land_fert(unit = "kg/(hectare.yr)") = 600 "Inherent land fertility";
          output Real land_fert_regen_time(unit = "yr") "Land fertility regeneration time";
          output Real land_fertility(unit = "kg/(hectare.yr)") "Land fertility";
          output Real land_fert_regen(unit = "kg/(hectare.yr2)") "Land fertility regeneration";
        equation
          land_fert_regen_time = u1;
          land_fertility = u2;
          land_fert_regen = (inherent_land_fert - land_fertility) / land_fert_regen_time;
          y = land_fert_regen;
          annotation(
            Documentation(info = "<html>
This function is described on p.328 of <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>.
</html>"));
        end Land_Fert_Reg;

        block Land_Rem_Urb_Ind_Use "Land removal for urban/industrial use"
          extends Interfaces.Nonlin_2;
          parameter Real urb_ind_land_dev_time(unit = "yr") = 10 "Urban and industrial land development time";
          output Real urb_ind_land_req(unit = "hectare") "Required urban and industrial land";
          output Real urban_ind_land(unit = "hectare") "Urban and industrial land";
          output Real land_rem_urb_ind_use(unit = "hectare/yr") "Land removal for urban/industrial use";
        equation
          urb_ind_land_req = u1;
          urban_ind_land = u2;
          land_rem_urb_ind_use = (urb_ind_land_req - urban_ind_land) / urb_ind_land_dev_time;
          y = land_rem_urb_ind_use;
          annotation(
            Documentation(info = "<html>
This function is described on p.322 of <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>.
</html>"));
        end Land_Rem_Urb_Ind_Use;

        block Lifet_Mlt_Crowd "Life expectancy multiplier due to crowding"
          extends Interfaces.Nonlin_2;
          output Real crowd_mult_ind "Crowding multiplier index";
          output Real fr_pop_urban "Fraction of urban population";
          output Real lifet_mlt_crowd "Life expectancy multiplier due to crowding";
        equation
          crowd_mult_ind = u1;
          fr_pop_urban = u2;
          lifet_mlt_crowd = 1 - crowd_mult_ind * fr_pop_urban;
          y = lifet_mlt_crowd;
          annotation(
            Documentation(info = "<html>
This function is described on p.90 of <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>.
</html>"));
        end Lifet_Mlt_Crowd;

        block Lifet_Mult_Hlth_Serv "Life expectancy multiplier due to health services"
          extends Interfaces.Nonlin_2;
          output Real lifet_mlt_hlth_serv_1 "Original life expectancy multiplier due to health services";
          output Real lifet_mlt_hlth_serv_2 "Improved life expectancy multiplier due to health services";
          output Real lifet_mult_hlth_serv "Life expectancy multiplier due to health services";
        equation
          lifet_mlt_hlth_serv_1 = u1;
          lifet_mlt_hlth_serv_2 = u2;
          lifet_mult_hlth_serv = if time > 1940 then lifet_mlt_hlth_serv_2 else lifet_mlt_hlth_serv_1;
          y = lifet_mult_hlth_serv;
          annotation(
            Documentation(info = "<html>
This function is described on p.76 of <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>.
</html>"));
        end Lifet_Mult_Hlth_Serv;

        block Marg_Prod_Agr_Inp "Agricultural input for marginally producing land"
          extends Interfaces.Nonlin_4;
          output Real land_yield(unit = "kg/(hectare.yr)") "Total land yield";
          output Real land_yield_mlt_cap "Land yield multiplier from capital";
          output Real marg_land_yield_mlt_cap(unit = "hectare/dollar") "Marginal land yield multiplier from capital";
          output Real s_avg_life_agr_inp(unit = "yr") "Average life of agricultural input";
          output Real marg_prod_agr_inp(unit = "kg/dollar") "Marginal productivity of agricultural inputs";
        equation
          land_yield = u1;
          land_yield_mlt_cap = u2;
          marg_land_yield_mlt_cap = u3;
          s_avg_life_agr_inp = u4;
          marg_prod_agr_inp = s_avg_life_agr_inp * land_yield * marg_land_yield_mlt_cap / land_yield_mlt_cap;
          y = marg_prod_agr_inp;
          annotation(
            Documentation(info = "<html>
This function is described on p.313 of <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>.
</html>"));
        end Marg_Prod_Agr_Inp;

        block Marg_Prod_Land_Dev "Development of marginally producing land"
          extends Interfaces.Nonlin_2;
          parameter Real social_discount(unit = "1/yr") = 0.07 "Social discount";
          output Real land_yield(unit = "kg/(hectare.yr)") "Land yield";
          output Real dev_cost_per_hect(unit = "dollar/hectare") "Development cost per hectare";
          output Real marg_prod_land_dev(unit = "kg/dollar") "Marginal productivity of land development";
        equation
          land_yield = u1;
          dev_cost_per_hect = u2;
          marg_prod_land_dev = land_yield / (dev_cost_per_hect * social_discount);
          y = marg_prod_land_dev;
          annotation(
            Documentation(info = "<html>
This function is described on p.312 of <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>.
</html>"));
        end Marg_Prod_Land_Dev;

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

        block Need_For_Fert_Cont "Need for fertility continuation"
          extends Interfaces.Nonlin_2;
          output Real max_tot_fert "Maximal total fertility";
          output Real des_tot_fert "Desired total fertility";
          output Real need_for_fert_cont "Need for fertility continuation";
        equation
          max_tot_fert = u1;
          des_tot_fert = u2;
          need_for_fert_cont = max({0, min({10, max_tot_fert / des_tot_fert - 1.0})});
          y = need_for_fert_cont;
          annotation(
            Documentation(info = "<html>
This function is described on p.131 of <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>.
</html>"));
        end Need_For_Fert_Cont;

        block P_PPoll_Tech_Chg "Percentage of effective pollution technology change"
          extends Interfaces.Nonlin_1;
          parameter Real des_ppoll_index_DPOLX = 1.2 "Desired persistent pollution index";
          output Real ppoll_index "Persistent pollution index";
          output Real p_ppoll_tech_chg "Percentage of effective pollution technology change";
        equation
          ppoll_index = u;
          p_ppoll_tech_chg = 1 - ppoll_index / des_ppoll_index_DPOLX;
          y = p_ppoll_tech_chg;
        end P_PPoll_Tech_Chg;

        block P_Res_Tech_Chg "Percentage of effective resource technology change"
          extends Interfaces.Nonlin_1;
          parameter Real des_res_use_rt_DNRUR(unit = "ton/yr") = 4800000000.0 "Desired resource utilization rate";
          output Real nr_res_use_rate(unit = "ton/yr") "Non-recoverable resource utilization rate";
          output Real p_res_tech_chg "Percentage of effective resource technology change";
        equation
          nr_res_use_rate = u;
          p_res_tech_chg = 1 - nr_res_use_rate / des_res_use_rt_DNRUR;
          y = p_res_tech_chg;
        end P_Res_Tech_Chg;

        block Poll_Intens_Ind "Pollution intensity index"
          extends Interfaces.Nonlin_3;
          output Real industrial_output(unit = "dollar/yr") "Industrial output";
          output Real ppoll_gen_ind(unit = "1/yr") "Persistent pollution index";
          output Real s_ppoll_gen_fact "Pollution generation factor";
          output Real poll_intens_ind(unit = "1/dollar") "Pollution intensity index";
        equation
          industrial_output = u1;
          ppoll_gen_ind = u2;
          s_ppoll_gen_fact = u3;
          poll_intens_ind = ppoll_gen_ind * s_ppoll_gen_fact / industrial_output;
          y = poll_intens_ind;
        end Poll_Intens_Ind;

        block PPoll_Assim_Rt "Persistent pollution assimilation rate"
          extends Interfaces.Nonlin_2;
          output Real pers_pollution "Persistent pollution";
          output Real assim_half_life(unit = "yr") "Persistent pollution assimilation half-life";
          output Real ppoll_assim_rt(unit = "1/yr") "Persistent pollution assimilation rate";
        equation
          pers_pollution = u1;
          assim_half_life = u2;
          ppoll_assim_rt = pers_pollution / (1.4 * assim_half_life);
          y = ppoll_assim_rt;
          annotation(
            Documentation(info = "<html>
This function is described on p.442 of <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>.
</html>"));
        end PPoll_Assim_Rt;

        block PPoll_Gen_Agr "Persistent pollution generated by agricultural output"
          extends Interfaces.Nonlin_2;
          parameter Real agr_mtl_toxic_index(unit = "1/dollar") = 1 "Agricultural materials toxicity index";
          parameter Real fr_agr_inp_pers_mtl = 0.001 "Effective fraction of agricultural pollution input";
          output Real agr_inp_per_hect(unit = "dollar/(hectare.yr)") "Agricultural input per hectare";
          output Real arable_land(unit = "hectare") "Total arable land";
          output Real ppoll_gen_agr(unit = "1/yr") "Persistent pollution generated by agricultural output";
        equation
          agr_inp_per_hect = u1;
          arable_land = u2;
          ppoll_gen_agr = agr_inp_per_hect * arable_land * fr_agr_inp_pers_mtl * agr_mtl_toxic_index;
          y = ppoll_gen_agr;
          annotation(
            Documentation(info = "<html>
This function is described on p.433 of <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>.
</html>"));
        end PPoll_Gen_Agr;

        block PPoll_Gen_Ind "Persistent pollution generated by industrial output"
          extends Interfaces.Nonlin_2;
          parameter Real frac_res_pers_mtl = 0.02 "Fraction of resources as persistent materials";
          parameter Real ind_mtl_emiss_fact(unit = "1/ton") = 0.1 "Industrial materials emission factor";
          parameter Real ind_mtl_toxic_index = 10.0 "Industrial materials toxicity index";
          output Real pc_res_use_mlt(unit = "ton/yr") "Per capita resource utilization multiplier";
          output Real population "Total population";
          output Real ppoll_gen_ind(unit = "1/yr") "Persistent pollution generated by industrial output";
        equation
          pc_res_use_mlt = u1;
          population = u2;
          ppoll_gen_ind = pc_res_use_mlt * population * frac_res_pers_mtl * ind_mtl_emiss_fact * ind_mtl_toxic_index;
          y = ppoll_gen_ind;
          annotation(
            Documentation(info = "<html>
This function is described on p.429 of <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>.
</html>"));
        end PPoll_Gen_Ind;

        block PPoll_Gen_Rt "Persistent pollution generation rate"
          extends Interfaces.Nonlin_3;
          output Real s_ppoll_gen_fact "Percentage of effective persistent pollution generation";
          output Real ppoll_gen_ind(unit = "1/yr") "Persistent pollution generation from industry";
          output Real ppoll_gen_agr(unit = "1/yr") "Persistent pollution generation from agriculture";
          output Real ppoll_gen_rt(unit = "1/yr") "Persistent pollution generation rate";
        equation
          s_ppoll_gen_fact = u1;
          ppoll_gen_ind = u2;
          ppoll_gen_agr = u3;
          ppoll_gen_rt = (ppoll_gen_ind + ppoll_gen_agr) * s_ppoll_gen_fact;
          y = ppoll_gen_rt;
          annotation(
            Documentation(info = "<html>
This function is described on p.428 of <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>.
</html>"));
        end PPoll_Gen_Rt;

        block PPoll_Tech_Chg_Rt "Persistent pollution technology change rate"
          extends Interfaces.Nonlin_2;
          parameter Real t_policy_year(unit = "yr") = 4000 "Year of policy change";
          output Real p_ppoll_tech_chg_mlt_POLGFM "Percentage of effective technology change on pollution generation";
          output Real ppoll_tech_PTD(unit = "1/yr") "Persistent pollution technology change factor";
          output Real ppoll_tech_chg_rt(unit = "1/yr") "Persistent pollution technology change rate";
        equation
          p_ppoll_tech_chg_mlt_POLGFM = u1;
          ppoll_tech_PTD = u2;
          ppoll_tech_chg_rt = if time > t_policy_year then p_ppoll_tech_chg_mlt_POLGFM * ppoll_tech_PTD else 0;
          y = ppoll_tech_chg_rt;
        end PPoll_Tech_Chg_Rt;

        block Res_Tech_Ch_Rt_NRATE "Non-recoverable resource technology change rate"
          extends Interfaces.Nonlin_2;
          parameter Real t_policy_year(unit = "yr") = 4000 "Year of policy change";
          output Real p_res_tech_chg_mlt_NRCM "Percentage of effective technology change";
          output Real res_tech_NRTD(unit = "1/yr") "Non-recoverable resource technology change factor";
          output Real res_tech_ch_rt_NRATE(unit = "1/yr") "Non-recoverable resource technology change rate";
        equation
          p_res_tech_chg_mlt_NRCM = u1;
          res_tech_NRTD = u2;
          res_tech_ch_rt_NRATE = if time > t_policy_year then p_res_tech_chg_mlt_NRCM * res_tech_NRTD else 0;
          y = res_tech_ch_rt_NRATE;
        end Res_Tech_Ch_Rt_NRATE;

        block S_Avg_Life_Agr_Inp "Average life of service sector capital"
          extends Interfaces.Nonlin_0;
          parameter Real t_policy_year(unit = "yr") = 4000 "Year of policy change";
          parameter Real p_avg_life_agr_inp_1(unit = "yr") = 2 "Default average life of agricultural input";
          parameter Real p_avg_life_agr_inp_2(unit = "yr") = 2 "Controlled average life of agricultural input";
          output Real s_avg_life_agr_inp(unit = "yr") "Average life of agricultural input";
        equation
          s_avg_life_agr_inp = if time > t_policy_year then p_avg_life_agr_inp_2 else p_avg_life_agr_inp_1;
          y = s_avg_life_agr_inp;
          annotation(
            Documentation(info = "<html>
This function is described on p.293 of <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>.
</html>"));
        end S_Avg_Life_Agr_Inp;

        block S_Avg_Life_Ind_Cap "Average life of industrial capital"
          extends Interfaces.Nonlin_0;
          parameter Real t_policy_year(unit = "yr") = 4000 "Year of policy change";
          parameter Real p_avg_life_ind_cap_1(unit = "yr") = 14 "Default average life of industrial capital";
          parameter Real p_avg_life_ind_cap_2(unit = "yr") = 14 "Controlled average life of industrial capital";
          output Real s_avg_life_ind_cap(unit = "yr") "Average life of industrial capital";
        equation
          s_avg_life_ind_cap = if time > t_policy_year then p_avg_life_ind_cap_2 else p_avg_life_ind_cap_1;
          y = s_avg_life_ind_cap;
          annotation(
            Documentation(info = "<html>
This function is described on p.221 of <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>.
</html>"));
        end S_Avg_Life_Ind_Cap;

        block S_Avg_Life_Serv_Cap "Average life of service sector capital"
          extends Interfaces.Nonlin_0;
          parameter Real t_policy_year(unit = "yr") = 4000 "Year of policy change";
          parameter Real p_avg_life_serv_cap_1(unit = "yr") = 20 "Default average life of service sector capital";
          parameter Real p_avg_life_serv_cap_2(unit = "yr") = 20 "Controlled average life of service sector capital";
          output Real s_avg_life_serv_cap(unit = "yr") "Average life of service sector capital";
        equation
          s_avg_life_serv_cap = if time > t_policy_year then p_avg_life_serv_cap_2 else p_avg_life_serv_cap_1;
          y = s_avg_life_serv_cap;
          annotation(
            Documentation(info = "<html>
This function is described on p.231 of <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>.
</html>"));
        end S_Avg_Life_Serv_Cap;

        block S_FIOA_Agr "Fraction of industrial output allocated to agricultural sector"
          extends Interfaces.Nonlin_2;
          parameter Real t_policy_year(unit = "yr") = 4000 "Year of policy change";
          output Real p_fr_io_al_agr_1 "Default fraction of industrial output allocated to agricultural sector";
          output Real p_fr_io_al_agr_2 "Controlled fraction of industrial output allocated to agricultural sector";
          output Real s_fioa_agr "Fraction of industrial output allocated to agricultural sector";
        equation
          p_fr_io_al_agr_1 = u1;
          p_fr_io_al_agr_2 = u2;
          s_fioa_agr = if time > t_policy_year then p_fr_io_al_agr_2 else p_fr_io_al_agr_1;
          y = s_fioa_agr;
          annotation(
            Documentation(info = "<html>
This function is described on p.287 of <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>.
</html>"));
        end S_FIOA_Agr;

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

        block S_Fr_Cap_Al_Obt_Res "Fraction of capital allocated to resource use efficiency"
          extends Interfaces.Nonlin_2;
          parameter Real t_fcaor_time(unit = "yr") = 4000 "Year of capital allocation to resource use efficiency";
          output Real p_fr_cap_al_obt_res_1 "Original capital allocation to resource use efficiency";
          output Real p_fr_cap_al_obt_res_2 "Modified capital allocation to resource use efficiency";
          output Real s_fr_cap_al_obt_res "Fraction of capital allocated to resource use efficiency";
        equation
          p_fr_cap_al_obt_res_1 = u1;
          p_fr_cap_al_obt_res_2 = u2;
          s_fr_cap_al_obt_res = if time > t_fcaor_time then p_fr_cap_al_obt_res_2 else p_fr_cap_al_obt_res_1;
          y = s_fr_cap_al_obt_res;
          annotation(
            Documentation(info = "<html>
This function is described on p.393 of <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>.
</html>"));
        end S_Fr_Cap_Al_Obt_Res;

        block S_Ind_Cap_Out_Ratio "Industrial capital output ratio"
          extends Interfaces.Nonlin_1;
          parameter Real t_policy_year(unit = "yr") = 4000 "Year of policy change";
          parameter Real p_ind_cap_out_ratio_1(unit = "yr") = 3 "Default industrial capital output ratio";
          output Real p_ind_cap_out_ratio_2(unit = "yr") "Controlled industrial capital output ratio";
          output Real s_ind_cap_out_ratio(unit = "yr") "Industrial capital output ratio";
        equation
          p_ind_cap_out_ratio_2 = u;
          s_ind_cap_out_ratio = if time > t_policy_year then p_ind_cap_out_ratio_2 else p_ind_cap_out_ratio_1;
          y = s_ind_cap_out_ratio;
          annotation(
            Documentation(info = "<html>
This function is described on p.216 of <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>.
</html>"));
        end S_Ind_Cap_Out_Ratio;

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

        block S_Indic_Serv_PC "Fraction of per capita indicated output allocated to service sector"
          extends Interfaces.Nonlin_2;
          parameter Real t_policy_year(unit = "yr") = 4000 "Year of policy change";
          output Real p_indic_serv_pc_1(unit = "dollar/yr") "Default fraction of per capita indicated output allocated to service sector";
          output Real p_indic_serv_pc_2(unit = "dollar/yr") "Controlled fraction of per capita indicated output allocated to service sector";
          output Real s_indic_serv_pc(unit = "dollar/yr") "Fraction of per capita indicated output allocated to service sector";
        equation
          p_indic_serv_pc_1 = u1;
          p_indic_serv_pc_2 = u2;
          s_indic_serv_pc = if time > t_policy_year then p_indic_serv_pc_2 else p_indic_serv_pc_1;
          y = s_indic_serv_pc;
          annotation(
            Documentation(info = "<html>
This function is described on p.227 of <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>.
</html>"));
        end S_Indic_Serv_PC;

        block S_Land_Life_Mlt_Yield "Land Life Yield Factor"
          extends Interfaces.Nonlin_2;
          constant Real time_unit(unit = "yr") = 1 "Unit conversion constant";
          parameter Real t_land_life_time(unit = "yr") = 4000 "Land life time";
          output Real p_land_life_mlt_yield_1 "Percentage of land with multiple yield - first model";
          output Real p_land_life_mlt_yield_2 "Percentage of land with multiple yield - second model";
          output Real s_land_life_mlt_yield "Land Life Yield Factor";
        protected
          Real k "Homotopy factor";
        equation
          p_land_life_mlt_yield_1 = u1;
          p_land_life_mlt_yield_2 = u2;
          if time > t_land_life_time then
            k = 0.95 ^ ((time - t_land_life_time) / time_unit);
          else
            k = 1;
          end if;
          s_land_life_mlt_yield = k * p_land_life_mlt_yield_1 + (1 - k) * p_land_life_mlt_yield_2;
          y = s_land_life_mlt_yield;
          annotation(
            Documentation(info = "<html>
This function is described on p.317 of <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>.
</html>"));
        end S_Land_Life_Mlt_Yield;

        block S_Land_Yield_Fact "Land yield factor"
          extends Interfaces.Nonlin_1;
          parameter Real t_policy_year(unit = "yr") = 4000 "Year of policy change";
          parameter Real p_land_yield_fact_1 = 1 "Default land yield factor";
          output Real p_land_yield_fact_2 "Controlled land yield factor";
          output Real s_land_yield_fact "Land yield factor";
        equation
          p_land_yield_fact_2 = u;
          s_land_yield_fact = if time > t_policy_year then p_land_yield_fact_2 else p_land_yield_fact_1;
          y = s_land_yield_fact;
          annotation(
            Documentation(info = "<html>
This function is described on p.307 of <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>.
</html>"));
        end S_Land_Yield_Fact;

        block S_NR_Res_Use_Fact "Non-recoverable resource utilization factor"
          extends Interfaces.Nonlin_1;
          parameter Real t_policy_year(unit = "yr") = 4000 "Year of policy change";
          parameter Real p_nr_res_use_fact_1 = 1 "Default non-recoverable resource utilization factor";
          output Real p_nr_res_use_fact_2 "Controlled non-recoverable resource utilization factor";
          output Real s_nr_res_use_fact "Non-recoverable resource utilization factor";
        equation
          p_nr_res_use_fact_2 = u;
          s_nr_res_use_fact = if time > t_policy_year then p_nr_res_use_fact_2 else p_nr_res_use_fact_1;
          y = s_nr_res_use_fact;
          annotation(
            Documentation(info = "<html>
This function is described on p.390 of <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>.
</html>"));
        end S_NR_Res_Use_Fact;

        block S_PPoll_Gen_Fact "Persistent pollution generation factor"
          extends Interfaces.Nonlin_1;
          parameter Real t_policy_year(unit = "yr") = 4000 "Year of policy change";
          parameter Real p_ppoll_gen_fact_1 = 1 "Default persistent pollution generation factor";
          output Real p_ppoll_gen_fact_2 "Controlled persistent pollution generation factor";
          output Real s_ppoll_gen_fact "Persistent pollution generation factor";
        equation
          p_ppoll_gen_fact_2 = u;
          s_ppoll_gen_fact = if time > t_policy_year then p_ppoll_gen_fact_2 else p_ppoll_gen_fact_1;
          y = s_ppoll_gen_fact;
          annotation(
            Documentation(info = "<html>
This function is described on p.428 of <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>.
</html>"));
        end S_PPoll_Gen_Fact;

        block S_Serv_Cap_Out_Ratio "Service sector capital output ratio"
          extends Interfaces.Nonlin_0;
          parameter Real t_policy_year(unit = "yr") = 4000 "Year of policy change";
          parameter Real p_serv_cap_out_ratio_1(unit = "yr") = 1.0 "Default fraction of service sector output ratio";
          parameter Real p_serv_cap_out_ratio_2(unit = "yr") = 1.0 "Controlled fraction of service sector output ratio";
          output Real s_serv_cap_out_ratio(unit = "yr") "Service sector capital output ratio";
        equation
          s_serv_cap_out_ratio = if time > t_policy_year then p_serv_cap_out_ratio_2 else p_serv_cap_out_ratio_1;
          y = s_serv_cap_out_ratio;
          annotation(
            Documentation(info = "<html>
This function is described on p.232 of <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>.
</html>"));
        end S_Serv_Cap_Out_Ratio;

        block S_Yield_Mlt_Air_Poll "Air pollution factor on agricultural yield"
          extends Interfaces.Nonlin_2;
          parameter Real t_air_poll_time(unit = "yr") = 4000 "Air pollution change time";
          output Real p_yield_mlt_air_poll_1 "Default air pollution factor on agricultural yield";
          output Real p_yield_mlt_air_poll_2 "Controlled air pollution factor on agricultural yield";
          output Real s_yield_mlt_air_poll "Air pollution factor on agricultural yield";
        equation
          p_yield_mlt_air_poll_1 = u1;
          p_yield_mlt_air_poll_2 = u2;
          s_yield_mlt_air_poll = if time > t_air_poll_time then p_yield_mlt_air_poll_2 else p_yield_mlt_air_poll_1;
          y = s_yield_mlt_air_poll;
          annotation(
            Documentation(info = "<html>
This function is described on p.310 of <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>.
</html>"));
        end S_Yield_Mlt_Air_Poll;

        block Service_Output "Service sector output"
          extends Interfaces.Nonlin_3;
          output Real capital_util_fr "Fraction of capacity utilization";
          output Real s_serv_cap_out_ratio(unit = "yr") "Service sector capital output ratio";
          output Real service_capital(unit = "dollar") "Capital invested in the service sector";
          output Real service_output(unit = "dollar/yr") "Service sector output";
        equation
          capital_util_fr = u1;
          s_serv_cap_out_ratio = u2;
          service_capital = u3;
          service_output = service_capital * capital_util_fr / s_serv_cap_out_ratio;
          y = service_output;
          annotation(
            Documentation(info = "<html>
This function is described on p.231 of <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>.
</html>"));
        end Service_Output;

        block Total_Fertility "Total fertility"
          extends Interfaces.Nonlin_3;
          output Real fert_cont_eff "Fertility control effectiveness";
          output Real max_tot_fert "Maximum total fertility";
          output Real des_tot_fert "Desired total fertility";
          output Real total_fertility "Total fertility";
        equation
          fert_cont_eff = u1;
          max_tot_fert = u2;
          des_tot_fert = u3;
          total_fertility = min({max_tot_fert, fert_cont_eff * des_tot_fert + (1 - fert_cont_eff) * max_tot_fert});
          y = total_fertility;
          annotation(
            Documentation(info = "<html>
This function is described on p.97 of <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>.
</html>"));
        end Total_Fertility;

        block Yield_Tech_Chg_Rt "Yield technology change rate"
          extends Interfaces.Nonlin_2;
          parameter Real t_policy_year(unit = "yr") = 4000 "Year of policy change";
          output Real p_yield_tech_chg_mlt_LYCM "Yield technology change factor";
          output Real yield_tech_LYTD "Yield technology";
          output Real yield_tech_chg_rt(unit = "1/yr") "Yield technology change rate";
        equation
          p_yield_tech_chg_mlt_LYCM = u1;
          yield_tech_LYTD = u2;
          yield_tech_chg_rt = if time > t_policy_year then p_yield_tech_chg_mlt_LYCM * yield_tech_LYTD else 0;
          y = yield_tech_chg_rt;
        end Yield_Tech_Chg_Rt;
        annotation(
          preferedView = "info",
          Documentation(info = "<html>
Utility models of Meadows' <font color=red><b>WORLD3</b></font> model.
</html>"));
      end Utilities;