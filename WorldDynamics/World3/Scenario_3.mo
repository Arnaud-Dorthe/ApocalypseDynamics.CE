      model Scenario_3 "More accessible non-recoverable natural resources and pollution control"
        parameter Real agr_mtl_toxic_index(unit = "1/dollar") = 1 "Agricultural materials toxicity index";
        parameter Real assim_half_life_1970(unit = "yr") = 1.5 "Pollution assimilation half life in 1970";
        parameter Real avg_life_land_norm(unit = "yr") = 1000 "Normal life span of land";
        parameter Real des_compl_fam_size_norm = 3.8 "Desired normal complete family size";
        parameter Real des_food_ratio_dfr = 2 "Desired food ratio";
        parameter Real des_ppoll_index_DPOLX = 1.2 "Desired persistent pollution index";
        parameter Real des_res_use_rt_DNRUR(unit = "ton/yr") = 4800000000.0 "Desired resource utilization rate";
        parameter Real food_short_perc_del(unit = "yr") = 2 "Food shortage perception delay";
        parameter Real fr_agr_inp_pers_mtl = 0.001 "Effective fraction of agricultural pollution input";
        parameter Real frac_res_pers_mtl = 0.02 "Effective fraction of resource utilization on pollution generation";
        parameter Real hlth_serv_impact_del(unit = "yr") = 20 "Health service impact delay";
        parameter Real income_expect_avg_time(unit = "yr") = 3 "Income expected average time";
        parameter Real ind_mtl_emiss_fact(unit = "1/ton") = 0.1 "Industrial materials emission factor";
        parameter Real ind_mtl_toxic_index = 10.0 "Industrial materials toxicity index";
        parameter Real ind_out_pc_des(unit = "dollar/yr") = 400 "Desired annual industrial per capita output";
        parameter Real ind_out_in_1970(unit = "dollar/yr") = 790000000000.0 "Industrial output in 1970";
        parameter Real inherent_land_fert(unit = "kg/(hectare.yr)") = 600 "Inherent land fertility";
        parameter Real labor_force_partic = 0.75 "Percentage of participating labor force";
        parameter Real labor_util_fr_del_time(unit = "yr") = 2 "Labor utilization fraction delay time";
        parameter Real land_fr_harvested = 0.7 "Land fraction harvested";
        parameter Real life_expect_norm(unit = "yr") = 28 "Normal life expectancy";
        parameter Real lifet_perc_del(unit = "yr") = 20 "Perceived life-time delay";
        parameter Real max_tot_fert_norm = 12 "Normal maximal total fertility";
        parameter Real p_avg_life_agr_inp_1(unit = "yr") = 2 "Default average life of agricultural input";
        parameter Real p_avg_life_agr_inp_2(unit = "yr") = 2 "Controlled average life of agricultural input";
        parameter Real p_avg_life_ind_cap_1(unit = "yr") = 14 "Default average life of industrial capital";
        parameter Real p_avg_life_ind_cap_2(unit = "yr") = 14 "Controlled average life of industrial capital";
        parameter Real p_avg_life_serv_cap_1(unit = "yr") = 20 "Default average life of service sector capital";
        parameter Real p_avg_life_serv_cap_2(unit = "yr") = 20 "Controlled average life of service sector capital";
        parameter Real p_fioa_cons_const_1 = 0.43 "Default fraction of industrial output allocated to consumption";
        parameter Real p_fioa_cons_const_2 = 0.43 "Controlled fraction of industrial output allocated to consumption";
        parameter Real p_ind_cap_out_ratio_1(unit = "yr") = 3 "Default industrial capital output ratio";
        parameter Real p_land_yield_fact_1 = 1 "Default land yield factor";
        parameter Real p_nr_res_use_fact_1 = 1 "Default non-recoverable resource utilization factor";
        parameter Real p_ppoll_gen_fact_1 = 1 "Default persistent pollution generation factor";
        parameter Real p_serv_cap_out_ratio_1(unit = "yr") = 1.0 "Default fraction of service sector output ratio";
        parameter Real p_serv_cap_out_ratio_2(unit = "yr") = 1.0 "Controlled fraction of service sector output ratio";
        parameter Real pot_arable_land_tot(unit = "hectare") = 3200000000.0 "Total potential arable land";
        parameter Real ppoll_in_1970 = 136000000.0 "Persistent pollution in 1970";
        parameter Real ppoll_trans_del(unit = "yr") = 20 "Persistent pollution transmission delay";
        parameter Real processing_loss = 0.1 "Processing loss";
        parameter Real reproductive_lifetime(unit = "yr") = 30.0 "Reproductive life time";
        parameter Real social_adj_del(unit = "yr") = 20 "Social adjustment delay";
        parameter Real social_discount(unit = "1/yr") = 0.07 "Social discount";
        parameter Real subsist_food_pc(unit = "kg/yr") = 230 "Available per capita food";
        parameter Real tech_dev_del_TDD(unit = "yr") = 20 "Technology development time";
        parameter Real urb_ind_land_dev_time(unit = "yr") = 10 "Urban and industrial land development time";
        parameter Real t_air_poll_time(unit = "yr") = 4000 "Air pollution change time";
        parameter Real t_fcaor_time(unit = "yr") = 2002 "Year of capital allocation to resource use efficiency";
        parameter Real t_fert_cont_eff_time(unit = "yr") = 4000 "Year of continued fertility change";
        parameter Real t_ind_equil_time(unit = "yr") = 4000 "Year of industrial equilibrium";
        parameter Real t_land_life_time(unit = "yr") = 4000 "Land life time";
        parameter Real t_policy_year(unit = "yr") = 2002 "Year of policy change";
        parameter Real t_pop_equil_time(unit = "yr") = 4000 "Population equilibrium time";
        parameter Real t_zero_pop_grow_time(unit = "yr") = 4000 "Time to zero population growth";
        parameter Real p_fr_cap_al_obt_res_2[:] = {1, 0.1, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05} "Non-renewable resource fraction remaining";
        parameter Real p_ppoll_tech_chg_mlt[:] = {-0.04, -0.04, 0, 0} "Persistent pollution technology change multiplier";
        parameter Real p_res_tech_chg_mlt[:] = {0, 0, 0, 0} "Resource technology change multiplier";
        parameter Real p_yield_tech_chg_mlt[:] = {0, 0, 0, 0} "Yield technology change multiplier";
        parameter Real agr_inp_init(unit = "dollar/yr") = 5000000000.0 "Initial agricultural input";
        parameter Real arable_land_init(unit = "hectare") = 900000000.0 "Initial arable land";
        parameter Real industrial_capital_init(unit = "dollar") = 210000000000.0 "Initial industrial investment";
        parameter Real labor_util_fr_del_init = 1 "Initial delayed labor utilization fraction";
        parameter Real land_fertility_init(unit = "kg/(hectare.yr)") = 600 "Initial industrial investment";
        parameter Real nr_resources_init(unit = "ton") = 2000000000000.0 "Initial available non-recoverable resources";
        parameter Real perc_food_ratio_init = 1 "Initial perceived food ratio";
        parameter Real pers_pollution_init = 25000000.0 "Initial persistent pollution";
        parameter Real pop1_init = 650000000.0 "Initial population 14 years and younger";
        parameter Real pop2_init = 700000000.0 "Initial population 15 to 44 years old";
        parameter Real pop3_init = 190000000.0 "Initial population 45 to 64 years old";
        parameter Real pop4_init = 60000000.0 "Initial population 65 years and older";
        parameter Real pot_arable_land_init(unit = "hectare") = 2300000000.0 "Initial potential arable land";
        parameter Real ppoll_tech_init = 1 "Initial persistent pollution technology change factor";
        parameter Real res_tech_init = 1 "Initial non-recoverable resource technology factor";
        parameter Real service_capital_init(unit = "dollar") = 144000000000.0 "Initial service sector investment";
        parameter Real urban_ind_land_init(unit = "hectare") = 8200000.0 "Initial urban and industrial land";
        parameter Real yield_tech_init = 1 "Initial yield technology factor";
        output Real population "Total human world population";
        output Real food(unit = "dollar/yr") "Total annually produced food";
        output Real industrial_output(unit = "dollar/yr") "Total annual world industrial output";
        output Real ppoll_index "Persistent pollution index";
        output Real nr_resources "Remaining non-recoverable natural resources";
        output Real fioa_ind "Fraction of industrial output allocated to industrial/military complex";
        output Real s_fioa_agr "Fraction of industrial output allocated to food production";
        output Real s_fioa_cons "Fraction of industrial output allocated to consumption";
        output Real s_fioa_serv "Fraction of industrial output allocated to service sector";
        output Real s_fr_cap_al_obt_res "Fraction of capital allocated to resource use efficiency";
        output Real life_expectancy(unit = "yr") "Life expectancy";
        output Real food_pc(unit = "dollar/yr") "Total annual food per person";
        output Real serv_out_pc(unit = "dollar/yr") "Total annual services per person";
        output Real ind_out_pc(unit = "dollar/yr") "Total annual consumer goods per person";
        output Real human_ecological_footprint(unit = "Gha") "Human ecological footprint";
        output Real human_welfare_index "Human welfare index";
        SystemDynamics.WorldDynamics.World3.Population_Dynamics Population_Dynamics1(pop1_init = pop1_init, pop2_init = pop2_init, pop3_init = pop3_init, pop4_init = pop4_init, labor_force_partic = labor_force_partic, reproductive_lifetime = reproductive_lifetime, t_pop_equil_time = t_pop_equil_time) "Population dynamics" annotation(
          Placement(visible = true, transformation(origin = {-100.0, 180.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)),
          Dialog(group = "Variables"));
        SystemDynamics.WorldDynamics.World3.Pollution_Dynamics Pollution_Dynamics1(agr_mtl_toxic_index = agr_mtl_toxic_index, assim_half_life_1970 = assim_half_life_1970, des_ppoll_index_DPOLX = des_ppoll_index_DPOLX, fr_agr_inp_pers_mtl = fr_agr_inp_pers_mtl, frac_res_pers_mtl = frac_res_pers_mtl, ind_mtl_emiss_fact = ind_mtl_emiss_fact, ind_mtl_toxic_index = ind_mtl_toxic_index, ind_out_in_1970 = ind_out_in_1970, p_ppoll_gen_fact_1 = p_ppoll_gen_fact_1, pers_pollution_init = pers_pollution_init, ppoll_in_1970 = ppoll_in_1970, ppoll_tech_init = ppoll_tech_init, ppoll_trans_del = ppoll_trans_del, t_air_poll_time = t_air_poll_time, t_policy_year = t_policy_year, tech_dev_del_TDD = tech_dev_del_TDD, p_ppoll_tech_chg_mlt = p_ppoll_tech_chg_mlt) "Persistent pollution generation" annotation(
          Placement(visible = true, transformation(origin = {-100.0, 80.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)),
          Dialog(group = "Variables"));
        SystemDynamics.WorldDynamics.World3.Arable_Land_Dynamics Arable_Land_Dynamics1(arable_land_init = arable_land_init, avg_life_land_norm = avg_life_land_norm, inherent_land_fert = inherent_land_fert, pot_arable_land_init = pot_arable_land_init, pot_arable_land_tot = pot_arable_land_tot, social_discount = social_discount, t_land_life_time = t_land_life_time, urban_ind_land_init = urban_ind_land_init, urb_ind_land_dev_time = urb_ind_land_dev_time) "Arable land dynamics" annotation(
          Placement(visible = true, transformation(origin = {-100.0, -20.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)),
          Dialog(group = "Variables"));
        SystemDynamics.WorldDynamics.World3.Food_Production Food_Production1(agr_inp_init = agr_inp_init, food_short_perc_del = food_short_perc_del, p_avg_life_agr_inp_1 = p_avg_life_agr_inp_1, p_avg_life_agr_inp_2 = p_avg_life_agr_inp_2, p_land_yield_fact_1 = p_land_yield_fact_1, perc_food_ratio_init = perc_food_ratio_init, processing_loss = processing_loss, subsist_food_pc = subsist_food_pc, t_policy_year = t_policy_year, tech_dev_del_TDD = tech_dev_del_TDD, land_fr_harvested = land_fr_harvested) "Food production" annotation(
          Placement(visible = true, transformation(origin = {-100.0, -120.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)),
          Dialog(group = "Variables"));
        SystemDynamics.WorldDynamics.World3.Human_Ecological_Footprint Human_Ecological_Footprint1 "Human ecological footprint" annotation(
          Placement(visible = true, transformation(origin = {340.0, 180.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)),
          Dialog(group = "Variables"));
        SystemDynamics.WorldDynamics.World3.Human_Fertility Human_Fertility1(des_compl_fam_size_norm = des_compl_fam_size_norm, hlth_serv_impact_del = hlth_serv_impact_del, income_expect_avg_time = income_expect_avg_time, lifet_perc_del = lifet_perc_del, max_tot_fert_norm = max_tot_fert_norm, social_adj_del = social_adj_del, t_fert_cont_eff_time = t_fert_cont_eff_time, t_zero_pop_grow_time = t_zero_pop_grow_time) "Human fertility" annotation(
          Placement(visible = true, transformation(origin = {120.0, 180.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)),
          Dialog(group = "Variables"));
        SystemDynamics.WorldDynamics.World3.Human_Welfare_Index Human_Welfare_Index1 "Human welfare index" annotation(
          Placement(visible = true, transformation(origin = {340.0, 80.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)),
          Dialog(group = "Variables"));
        SystemDynamics.WorldDynamics.World3.Industrial_Investment Industrial_Investment1(industrial_capital_init = industrial_capital_init, ind_out_pc_des = ind_out_pc_des, p_avg_life_ind_cap_1 = p_avg_life_ind_cap_1, p_avg_life_ind_cap_2 = p_avg_life_ind_cap_2, p_fioa_cons_const_1 = p_fioa_cons_const_1, p_fioa_cons_const_2 = p_fioa_cons_const_2, p_ind_cap_out_ratio_1 = p_ind_cap_out_ratio_1, t_ind_equil_time = t_ind_equil_time, t_policy_year = t_policy_year) "Industrial investment" annotation(
          Placement(visible = true, transformation(origin = {120.0, 80.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)),
          Dialog(group = "Variables"));
        SystemDynamics.WorldDynamics.World3.Labor_Utilization Labor_Utilization1(labor_util_fr_del_init = labor_util_fr_del_init, labor_util_fr_del_time = labor_util_fr_del_time) "Labor utilization" annotation(
          Placement(visible = true, transformation(origin = {120.0, -20.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)),
          Dialog(group = "Variables"));
        SystemDynamics.WorldDynamics.World3.Land_Fertility Land_Fertility1(des_food_ratio_dfr = des_food_ratio_dfr, inherent_land_fert = inherent_land_fert, land_fertility_init = land_fertility_init, t_policy_year = t_policy_year, yield_tech_init = yield_tech_init, p_yield_tech_chg_mlt = p_yield_tech_chg_mlt) "Land fertility" annotation(
          Placement(visible = true, transformation(origin = {120.0, -120.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)),
          Dialog(group = "Variables"));
        SystemDynamics.WorldDynamics.World3.Life_Expectancy Life_Expectancy1(hlth_serv_impact_del = hlth_serv_impact_del, life_expect_norm = life_expect_norm, subsist_food_pc = subsist_food_pc) "Life expectancy" annotation(
          Placement(visible = true, transformation(origin = {340.0, -20.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)),
          Dialog(group = "Variables"));
        SystemDynamics.WorldDynamics.World3.NR_Resource_Utilization NR_Resource_Utilization1(des_res_use_rt_DNRUR = des_res_use_rt_DNRUR, nr_resources_init = nr_resources_init, p_nr_res_use_fact_1 = p_nr_res_use_fact_1, res_tech_init = res_tech_init, t_policy_year = t_policy_year, t_fcaor_time = t_fcaor_time, tech_dev_del_TDD = tech_dev_del_TDD, p_fr_cap_al_obt_res_2 = p_fr_cap_al_obt_res_2, p_res_tech_chg_mlt = p_res_tech_chg_mlt) "Non-recoverable natural resource utilization" annotation(
          Placement(visible = true, transformation(origin = {340.0, -120.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)),
          Dialog(group = "Variables"));
        SystemDynamics.WorldDynamics.World3.Service_Sector_Investment Service_Sector_Investment1(t_policy_year = t_policy_year, p_avg_life_serv_cap_1 = p_avg_life_serv_cap_1, p_avg_life_serv_cap_2 = p_avg_life_serv_cap_2, p_serv_cap_out_ratio_1 = p_serv_cap_out_ratio_1, p_serv_cap_out_ratio_2 = p_serv_cap_out_ratio_2, service_capital_init = service_capital_init) "Service sector investment" annotation(
          Placement(visible = true, transformation(origin = {-100.0, -220.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)),
          Dialog(group = "Variables"));
      equation
        connect(Food_Production1.s_fioa_agr, Industrial_Investment1.s_fioa_agr) annotation(
          Line(visible = true, points = {{-78.0, -136.0}, {-4.0, -136.0}, {-4.0, 64.0}, {98.0, 64.0}}, color = {0, 0, 191}));
        population = Population_Dynamics1.Population.y;
        food = Food_Production1.Food.food;
        industrial_output = Industrial_Investment1.Industrial_Output.industrial_output;
        ppoll_index = Pollution_Dynamics1.PPoll_Index.y;
        nr_resources = NR_Resource_Utilization1.NR_Resources.y;
        fioa_ind = Industrial_Investment1.FIOA_Ind.fioa_ind;
        s_fioa_agr = Food_Production1.S_FIOA_Agr.s_fioa_agr;
        s_fioa_cons = Industrial_Investment1.S_FIOA_Cons.s_fioa_cons;
        s_fioa_serv = Service_Sector_Investment1.S_FIOA_Serv.s_fioa_serv;
        s_fr_cap_al_obt_res = NR_Resource_Utilization1.S_Fr_Cap_Al_Obt_Res.s_fr_cap_al_obt_res;
        life_expectancy = Life_Expectancy1.Life_Expectancy.y;
        food_pc = Food_Production1.Food_PC.y;
        serv_out_pc = Service_Sector_Investment1.Serv_Out_PC.y;
        ind_out_pc = Industrial_Investment1.Ind_Out_PC.y;
        human_ecological_footprint = Human_Ecological_Footprint1.HEF_Human_Ecological_Footprint.hef_human_ecological_footprint;
        human_welfare_index = Human_Welfare_Index1.HWI_Human_Welfare_Index.hwi_human_welfare_index;
        connect(Population_Dynamics1.population, Pollution_Dynamics1.population) annotation(
          Line(points = {{-78.0, 190.0}, {-10.0, 190.0}, {-10.0, 140.0}, {-180.0, 140.0}, {-180.0, 88.0}, {-122.0, 88.0}}, color = {0, 0, 191}, visible = true));
        connect(Pollution_Dynamics1.population, Arable_Land_Dynamics1.population) annotation(
          Line(points = {{-122.0, 88.0}, {-180.0, 88.0}, {-180.0, -36.0}, {-122.0, -36.0}}, color = {0, 0, 191}, visible = true));
        connect(Arable_Land_Dynamics1.population, Food_Production1.population) annotation(
          Line(points = {{-122.0, -36.0}, {-180.0, -36.0}, {-180.0, -104.0}, {-122.0, -104.0}}, color = {0, 0, 191}, visible = true));
        connect(Food_Production1.population, Service_Sector_Investment1.population) annotation(
          Line(points = {{-122.0, -104.0}, {-180.0, -104.0}, {-180.0, -216.0}, {-122.0, -216.0}}, color = {0, 0, 191}, visible = true));
        connect(Population_Dynamics1.population, Industrial_Investment1.population) annotation(
          Line(points = {{-78.0, 190.0}, {-10.0, 190.0}, {-10.0, 34.0}, {116.0, 34.0}, {116.0, 58.0}}, color = {0, 0, 191}, visible = true));
        connect(Industrial_Investment1.population, Life_Expectancy1.population) annotation(
          Line(points = {{116.0, 58.0}, {116.0, 34.0}, {260.0, 34.0}, {260.0, -20.0}, {318.0, -20.0}}, color = {0, 0, 191}, visible = true));
        connect(Life_Expectancy1.population, NR_Resource_Utilization1.population) annotation(
          Line(points = {{318.0, -20.0}, {260.0, -20.0}, {260.0, -120.0}, {318.0, -120.0}}, color = {0, 0, 191}, visible = true));
        connect(Arable_Land_Dynamics1.arable_land, Pollution_Dynamics1.arable_land) annotation(
          Line(points = {{-78.0, -20.0}, {-20.0, -20.0}, {-20.0, 26.0}, {-176.0, 26.0}, {-176.0, 64.0}, {-122.0, 64.0}}, color = {0, 0, 191}, visible = true));
        connect(Pollution_Dynamics1.arable_land, Food_Production1.arable_land) annotation(
          Line(points = {{-122.0, 64.0}, {-176.0, 64.0}, {-176.0, -112.0}, {-122.0, -112.0}}, color = {0, 0, 191}, visible = true));
        connect(Arable_Land_Dynamics1.arable_land, Labor_Utilization1.arable_land) annotation(
          Line(points = {{-78.0, -20.0}, {40.0, -20.0}, {40.0, -36.0}, {98.0, -36.0}}, color = {0, 0, 191}, visible = true));
        connect(Labor_Utilization1.arable_land, Human_Ecological_Footprint1.arable_land) annotation(
          Line(points = {{98.0, -36.0}, {40.0, -36.0}, {40.0, -64.0}, {264.0, -64.0}, {264.0, 190.0}, {318.0, 190.0}}, color = {0, 0, 191}, visible = true));
        connect(Industrial_Investment1.industrial_output, Pollution_Dynamics1.industrial_output) annotation(
          Line(points = {{142.0, 84.3414}, {210.0, 84.3414}, {210.0, 22.0}, {-184.0, 22.0}, {-184.0, 80.0}, {-122.0, 80.0}}, color = {0, 0, 191}, visible = true));
        connect(Pollution_Dynamics1.industrial_output, Food_Production1.industrial_output) annotation(
          Line(points = {{-122.0, 80.0}, {-184.0, 80.0}, {-184.0, -136.0}, {-122.0, -136.0}}, color = {0, 0, 191}, visible = true));
        connect(Food_Production1.industrial_output, Service_Sector_Investment1.industrial_output) annotation(
          Line(points = {{-122.0, -136.0}, {-184.0, -136.0}, {-184.0, -224.0}, {-122.0, -224.0}}, color = {0, 0, 191}, visible = true));
        connect(Industrial_Investment1.industrial_output, NR_Resource_Utilization1.industrial_output) annotation(
          Line(points = {{142.0, 84.3414}, {210.0, 84.3414}, {210.0, -130.0}, {318.0, -130.0}}, color = {0, 0, 191}, visible = true));
        connect(Industrial_Investment1.ind_out_pc, Arable_Land_Dynamics1.ind_out_pc) annotation(
          Line(points = {{142.0, 68.0}, {200.0, 68.0}, {200.0, 30.0}, {-188.0, 30.0}, {-188.0, -28.0}, {-122.0, -28.0}}, color = {0, 0, 191}, visible = true));
        connect(Arable_Land_Dynamics1.ind_out_pc, Food_Production1.ind_out_pc) annotation(
          Line(points = {{-122.0, -28.0}, {-188.0, -28.0}, {-188.0, -128.0}, {-122.0, -128.0}}, color = {0, 0, 191}, visible = true));
        connect(Food_Production1.ind_out_pc, Service_Sector_Investment1.ind_out_pc) annotation(
          Line(points = {{-122.0, -128.0}, {-188.0, -128.0}, {-188.0, -232.0}, {-122.0, -232.0}}, color = {0, 0, 191}, visible = true));
        connect(Industrial_Investment1.ind_out_pc, Human_Fertility1.ind_out_pc) annotation(
          Line(points = {{142.0, 68.0}, {200.0, 68.0}, {200.0, 30.0}, {36.0, 30.0}, {36.0, 170.0}, {98.0, 170.0}}, color = {0, 0, 191}, visible = true));
        connect(Human_Fertility1.ind_out_pc, Labor_Utilization1.ind_out_pc) annotation(
          Line(points = {{98.0, 170.0}, {36.0, 170.0}, {36.0, -12.0}, {98.0, -12.0}}, color = {0, 0, 191}, visible = true));
        connect(Industrial_Investment1.ind_out_pc, Human_Welfare_Index1.ind_out_pc) annotation(
          Line(points = {{142.0, 68.0}, {200.0, 68.0}, {200.0, 70.0}, {318.0, 70.0}}, color = {0, 0, 191}, visible = true));
        connect(Industrial_Investment1.ind_out_pc, Life_Expectancy1.ind_out_pc) annotation(
          Line(points = {{142.0, 68.0}, {200.0, 68.0}, {200.0, -12.0}, {318.0, -12.0}}, color = {0, 0, 191}, visible = true));
        connect(Industrial_Investment1.ind_out_pc, NR_Resource_Utilization1.ind_out_pc) annotation(
          Line(points = {{142.0, 68.0}, {200.0, 68.0}, {200.0, -110.0}, {318.0, -110.0}}, color = {0, 0, 191}, visible = true));
        connect(Service_Sector_Investment1.serv_out_pc, Human_Fertility1.serv_out_pc) annotation(
          Line(points = {{-78.0, -210.0}, {0.0, -210.0}, {0.0, 190.0}, {98.0, 190.0}}, color = {0, 0, 191}, visible = true));
        connect(Service_Sector_Investment1.serv_out_pc, Labor_Utilization1.serv_out_pc) annotation(
          Line(points = {{-78.0, -210.0}, {0.0, -210.0}, {0.0, 18.0}, {70.0, 18.0}, {108.0, 18.0}, {108.0, 2.0}}, color = {0, 0, 191}, visible = true));
        connect(Life_Expectancy1.serv_out_pc, Labor_Utilization1.serv_out_pc) annotation(
          Line(points = {{318.0, -4.0}, {218.0, -4.0}, {218.0, 18.0}, {108.0, 18.0}, {108.0, 12.9215}, {108.0, 2.0}}, color = {0, 0, 191}, visible = true));
        connect(Pollution_Dynamics1.ppoll_index, Land_Fertility1.ppoll_index) annotation(
          Line(points = {{-78.0, 80.0}, {20.0, 80.0}, {20.0, -130.0}, {98.0, -130.0}}, color = {0, 0, 191}, visible = true));
        connect(Land_Fertility1.ppoll_index, Life_Expectancy1.ppoll_index) annotation(
          Line(points = {{98.0, -130.0}, {20.0, -130.0}, {20.0, -70.0}, {268.0, -70.0}, {268.0, -36.0}, {318.0, -36.0}}, color = {0, 0, 191}, visible = true));
        connect(Food_Production1.food_ratio, Land_Fertility1.food_ratio) annotation(
          Line(points = {{-78.0, -104.0}, {10.0, -104.0}, {10.0, -110.0}, {98.0, -110.0}}, color = {0, 0, 191}, visible = true));
        connect(Food_Production1.land_yield, Arable_Land_Dynamics1.land_yield) annotation(
          Line(points = {{-78.0, -112.0}, {-20.0, -112.0}, {-20.0, -60.0}, {-192.0, -60.0}, {-192.0, -4.0}, {-122.0, -4.0}}, color = {0, 0, 191}, visible = true));
        connect(Food_Production1.food_pc, Life_Expectancy1.food_pc) annotation(
          Line(points = {{-96.0, -98.0}, {-96.0, -74.0}, {256.0, -74.0}, {256.0, -28.0}, {318.0, -28.0}}, color = {0, 0, 191}, visible = true));
        connect(Food_Production1.marg_prod_agr_inp, Arable_Land_Dynamics1.marg_prod_agr_inp) annotation(
          Line(points = {{-78.0, -120.0}, {-24.0, -120.0}, {-24.0, -64.0}, {-172.0, -64.0}, {-172.0, -12.0}, {-122.0, -12.0}}, color = {0, 0, 191}, visible = true));
        connect(Food_Production1.agr_inp_per_hect, Pollution_Dynamics1.agr_inp_per_hect) annotation(
          Line(points = {{-78.0, -128.0}, {-16.0, -128.0}, {-16.0, -56.0}, {-196.0, -56.0}, {-196.0, 72.0}, {-122.0, 72.0}}, color = {0, 0, 191}, visible = true));
        connect(Food_Production1.agr_inp_per_hect, Labor_Utilization1.agr_inp_per_hect) annotation(
          Line(points = {{-78.0, -128.0}, {-16.0, -128.0}, {-16.0, -28.0}, {98.0, -28.0}}, color = {0, 0, 191}, visible = true));
        connect(Service_Sector_Investment1.service_capital, Labor_Utilization1.service_capital) annotation(
          Line(points = {{-78.0, -220.0}, {4.0, -220.0}, {4.0, -4.0}, {98.0, -4.0}}, color = {0, 0, 191}, visible = true));
        connect(Food_Production1.p_fr_inp_for_land_maint, Land_Fertility1.p_fr_inp_for_land_maint) annotation(
          Line(points = {{-88.0, -142.0}, {-88.0, -160.0}, {44.0, -160.0}, {44.0, -120.0}, {98.0, -120.0}}, color = {0, 0, 191}, visible = true));
        connect(Service_Sector_Investment1.s_fioa_serv, Industrial_Investment1.s_fioa_serv) annotation(
          Line(points = {{-78.0, -230.0}, {16.0, -230.0}, {16.0, 38.0}, {108.0, 38.0}, {108.0, 58.0}}, color = {0, 0, 191}, visible = true));
        connect(Population_Dynamics1.labor_force, Labor_Utilization1.labor_force) annotation(
          Line(points = {{-78.0, 170.0}, {12.0, 170.0}, {12.0, -60.0}, {108.0, -60.0}, {108.0, -42.0}}, color = {0, 0, 191}, visible = true));
        connect(Human_Fertility1.total_fertility, Population_Dynamics1.total_fertility) annotation(
          Line(points = {{142.0, 180.0}, {196.0, 180.0}, {196.0, 144.0}, {-200.0, 144.0}, {-200.0, 190.0}, {-122.0, 190.0}}, color = {0, 0, 191}, visible = true));
        connect(Industrial_Investment1.industrial_capital, Labor_Utilization1.industrial_capital) annotation(
          Line(points = {{142.0, 76.0}, {196.0, 76.0}, {196.0, -78.0}, {44.0, -78.0}, {44.0, -20.0}, {98.0, -20.0}}, color = {0, 0, 191}, visible = true));
        connect(Land_Fertility1.land_fertility, Food_Production1.land_fertility) annotation(
          Line(points = {{142.0, -120.0}, {192.0, -120.0}, {192.0, -164.0}, {-112.0, -164.0}, {-112.0, -142.0}}, color = {0, 0, 191}, visible = true));
        connect(Life_Expectancy1.life_expectancy, Human_Welfare_Index1.life_expectancy) annotation(
          Line(points = {{362.0, -20.0}, {420.0, -20.0}, {420.0, 40.0}, {250.0, 40.0}, {250.0, 90.0}, {318.0, 90.0}}, color = {0, 0, 191}, visible = true));
        connect(Human_Welfare_Index1.life_expectancy, Human_Fertility1.life_expectancy) annotation(
          Line(points = {{318.0, 90.0}, {250.0, 90.0}, {250.0, 128.0}, {32.0, 128.0}, {32.0, 180.0}, {98.0, 180.0}}, color = {0, 0, 191}, visible = true));
        connect(Human_Fertility1.life_expectancy, Population_Dynamics1.life_expectancy) annotation(
          Line(points = {{98.0, 180.0}, {32.0, 180.0}, {32.0, 128.0}, {-190.0, 128.0}, {-190.0, 170.0}, {-122.0, 170.0}}, color = {0, 0, 191}, visible = true));
        connect(NR_Resource_Utilization1.pc_res_use_mlt, Pollution_Dynamics1.pc_res_use_mlt) annotation(
          Line(points = {{362.0, -108.0}, {424.0, -108.0}, {424.0, 124.0}, {-176.0, 124.0}, {-176.0, 96.0}, {-122.0, 96.0}}, color = {0, 0, 191}, visible = true));
        connect(Land_Fertility1.yield_tech_LYTD, Food_Production1.yield_tech_LYTD) annotation(
          Line(points = {{142.0, -110.0}, {192.0, -110.0}, {192.0, -82.0}, {-112.0, -82.0}, {-112.0, -87.374}, {-112.0, -98.0}}, color = {0, 0, 191}, visible = true));
        connect(Arable_Land_Dynamics1.fr_inp_al_land_dev, Food_Production1.fr_inp_al_land_dev) annotation(
          Line(points = {{-78.0, -10.0}, {-28.0, -10.0}, {-28.0, -68.0}, {-172.0, -68.0}, {-172.0, -120.0}, {-122.0, -120.0}}, color = {0, 0, 191}, visible = true));
        connect(Pollution_Dynamics1.s_yield_mlt_air_poll, Food_Production1.s_yield_mlt_air_poll) annotation(
          Line(points = {{-78.0, 72.0}, {32.0, 72.0}, {32.0, -168.0}, {-104.0, -168.0}, {-104.0, -142.0}}, color = {0, 0, 191}, visible = true));
        connect(Labor_Utilization1.capital_util_fr, Service_Sector_Investment1.capital_util_fr) annotation(
          Line(points = {{142.0, -28.0}, {224.0, -28.0}, {224.0, -180.0}, {-172.0, -180.0}, {-172.0, -208.0}, {-122.0, -208.0}}, color = {0, 0, 191}, visible = true));
        connect(Pollution_Dynamics1.ppoll_tech_mult_icor_COPM, Industrial_Investment1.ppoll_tech_mult_icor_COPM) annotation(
          Line(points = {{-88.0, 0.0}, {88.0, 0.0}}, color = {0, 0, 191}, visible = true, origin = {10.0, 88.0}));
        connect(NR_Resource_Utilization1.ind_cap_out_ratio_2_ICOR2T, Industrial_Investment1.ind_cap_out_ratio_2_ICOR2T) annotation(
          Line(points = {{362.0, -124.0}, {428.0, -124.0}, {428.0, 120.0}, {108.0, 120.0}, {108.0, 102.0}}, color = {0, 0, 191}, visible = true));
        connect(Labor_Utilization1.capital_util_fr, Industrial_Investment1.capital_util_fr) annotation(
          Line(points = {{142.0, -28.0}, {224.0, -28.0}, {224.0, -180.0}, {24.0, -180.0}, {24.0, 80.0}, {98.0, 80.0}}, color = {0, 0, 191}, visible = true));
        connect(NR_Resource_Utilization1.s_fr_cap_al_obt_res, Industrial_Investment1.s_fr_cap_al_obt_res) annotation(
          Line(points = {{362.0, -132.0}, {432.0, -132.0}, {432.0, 132.0}, {44.0, 132.0}, {44.0, 72.0}, {98.0, 72.0}}, color = {0, 0, 191}, visible = true));
        connect(Pollution_Dynamics1.ppoll_gen_rt, Human_Ecological_Footprint1.ppoll_gen_rt) annotation(
          Line(points = {{-78.0, 64.0}, {-20.0, 64.0}, {-20.0, 148.0}, {256.0, 148.0}, {256.0, 170.0}, {318.0, 170.0}}, color = {0, 0, 191}, visible = true));
        connect(Arable_Land_Dynamics1.urban_ind_land, Human_Ecological_Footprint1.urban_ind_land) annotation(
          Line(points = {{-78.0, -30.0}, {-24.0, -30.0}, {-24.0, 136.0}, {252.0, 136.0}, {252.0, 180.0}, {318.0, 180.0}}, color = {0, 0, 191}, visible = true));
        connect(Food_Production1.yield_tech_mult_icor_COYM, Industrial_Investment1.yield_tech_mult_icor_COYM) annotation(
          Line(points = {{-96.0, -142.0}, {-96.0, -174.0}, {28.0, -174.0}, {28.0, 96.0}, {98.0, 96.0}}, color = {0, 0, 191}, visible = true));
        connect(Food_Production1.tot_agric_invest, Arable_Land_Dynamics1.tot_agric_invest) annotation(
          Line(points = {{-88.0, -98.0}, {-88.0, -52.0}, {-200.0, -52.0}, {-200.0, -20.0}, {-122.0, -20.0}}, color = {0, 0, 191}, visible = true));
        annotation(
          Icon(coordinateSystem(extent = {{-220.0, -260.0}, {440.0, 220.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, lineColor = {0, 0, 255}, fillColor = {255, 255, 0}, fillPattern = FillPattern.Solid, extent = {{-220.0, -260.0}, {442.0, 222.0}}), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-80.0, 60.0}, {300.0, 132.0}}, textString = "More Accessible", fontName = "Arial"), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-82.0, -14.0}, {304.0, 52.0}}, textString = "Non-recoverable", fontName = "Arial"), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-112.0, -106.0}, {326.0, -2.0}}, textString = "Natural Resources", fontName = "Arial"), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-136.0, -184.0}, {348.0, -80.0}}, textString = "and Pollution Control", fontName = "Arial")}),
          Diagram(coordinateSystem(extent = {{-220.0, -260.0}, {440.0, 220.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10})),
          experiment(StartTime = 1900, StopTime = 2100),
          experimentSetupOutput,
          Documentation(info = "<html>
This is <font color=red><b>Scenario #3</b></font> of the <font color=red><b>WORLD3</b></font> model. This scenario starts out with the same assumptions as <font color=red><b>Scenario #2</b></font>.  In that scenario, the continued production of industrial goods caused the persistent pollution to accumulate.  That pollution led to a deterioration of the fertility of our agricultural lands, which caused a collapse over time. <p>
 
For this reason, it is postulated here that improved pollution control technology can curbe the amount of pollutants released into the atmosphere by 4% starting in the year 2002.  The hope is that such a reduction can be reasonably well accomplished without suffocating the industry in the process.  In fact, our government already talk about measures that are considerably more stringent than just a 4% reduction in air pollution, although the already implemented measures have proven ineffective until now.  The greenhouse gas emissions are still growing essentially proportional with the industrial production. <p>
 
<hr> <p>
 
<b>References:</b> <p>
 
<ol>
<li> Meadows, D.H., D.L. Meadows, J. Randers, and W.W. Behrens III (1972), <i>Limits to Growth: A Report for the Club of Rome's Project on the Predicament of Mankind</i>, Universe Books, New York, 205p.
<li> Meadows, D.L., W.W. Behrens III, D.M., Meadows, R.F. Naill, J. Randers, and E.K.O. Zahn (1974), <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>, Wright-Allen Press, 637p.
<li> Meadows, D.H., D.L. Meadows, and J. Randers (1992), <i>Beyond the Limits</i>, Chelsea Green, 300p.
<li> Meadows, D.H., J. Randers, and D.L. Meadows (2004), <a href=\"http://www.amazon.com/Limits-Growth-Donella-H-Meadows/dp/193149858X\">Limits to Growth: The 30-Year Update</a>, Chelsea Green, 368p.
</ol> <p>
 
<hr> <p>
 
In order to accomplish this change, you need to modify the table P_PPoll_Tech_Chg_Mlt_POLGFM that models a multiplier to the generation of pollution as a function of available pollution technology: <p>
<font color=red>parameter Real p_ppoll_tech_chg_mlt[:] = {<b>-0.04</b>,<b>-0.04</b>,0,0} \"Persistent pollution technology change multiplier\";</font>, <p>
and you also you need to reset yet another one of the switching times in the model: <p>
<font color=red>parameter Real t_policy_year(unit=\"yr\") = <b>2002</b> \"Year of policy change\";</font>. <p>
The latter change has lots of consequences, as this policy control parameter appears in 16 different places in the model. <p>
 
<hr> <p>
 
Simulate the model from 1900 until 2100, and display the same variables as in the book <a href=\"http://www.amazon.com/Limits-Growth-Donella-H-Meadows/dp/193149858X\">Limits to Growth: The 30-Year Update</a> at page 211: <p>
<img src=\"modelica://SystemDynamics/Resources/Images/World3_7.png\"> <p>
<img src=\"modelica://SystemDynamics/Resources/Images/World3_8.png\"> <p>
<img src=\"modelica://SystemDynamics/Resources/Images/World3_9.png\"> <p>
 
<hr> <p>
</html>", revisions = ""));
      end Scenario_3;