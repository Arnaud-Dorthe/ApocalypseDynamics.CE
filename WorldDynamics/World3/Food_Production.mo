      block Food_Production "Food production"
        parameter Real agr_inp_init(unit = "dollar/yr") = 5000000000.0 "Initial agricultural input";
        parameter Real food_short_perc_del(unit = "yr") = 2 "Food shortage perception delay";
        parameter Real land_fr_harvested = 0.7 "Land fraction harvested";
        parameter Real p_avg_life_agr_inp_1(unit = "yr") = 2 "Default average life of agricultural input";
        parameter Real p_avg_life_agr_inp_2(unit = "yr") = 2 "Controlled average life of agricultural input";
        parameter Real p_land_yield_fact_1 = 1 "Default land yield factor";
        parameter Real perc_food_ratio_init = 1 "Initial perceived food ratio";
        parameter Real processing_loss = 0.1 "Processing loss";
        parameter Real subsist_food_pc(unit = "kg/yr") = 230 "Available per capita food";
        parameter Real t_policy_year(unit = "yr") = 4000 "Year of policy change";
        parameter Real tech_dev_del_TDD(unit = "yr") = 20 "Technology development time";
        SystemDynamics.Interfaces.MassInPort ind_out_pc(unit = "dollar/yr") "Per capita annual industrial output" annotation(
          Placement(visible = true, transformation(origin = {-210.0, -70.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-110.0, -40.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular P_Indic_Food_PC_1(x_vals = 0:200:1600, y_vals = {230, 480, 690, 850, 970, 1070, 1150, 1210, 1250}) "p.286 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-142.0, -90.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular P_Indic_Food_PC_2(x_vals = 0:200:1600, y_vals = {230, 480, 690, 850, 970, 1070, 1150, 1210, 1250}) "p.286 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-142.0, -130.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Utilities.S_Indic_Food_PC S_Indic_Food_PC(t_policy_year = t_policy_year) "p.286 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-79.0, -110.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular P_Fr_IO_Al_Agr_1(x_vals = 0:0.5:2.5, y_vals = {0.4, 0.2, 0.1, 0.025, 0, 0}) "p.287 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {18.0, -90.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        Modelica.Blocks.Math.Division Div1 annotation(
          Placement(visible = true, transformation(origin = {-30.0, -104.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular P_Fr_IO_Al_Agr_2(x_vals = 0:0.5:2.5, y_vals = {0.4, 0.2, 0.1, 0.025, 0, 0}) "p.287 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {18.0, -130.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Utilities.S_FIOA_Agr S_FIOA_Agr(t_policy_year = t_policy_year) "p.287 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {76.0, -110.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Prod_2 Tot_Agric_Invest "p.287 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {120.0, -110.0}, extent = {{-12.0, -12.0}, {12.0, 12.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassInPort industrial_output(unit = "dollar/yr") "Annual industrial output" annotation(
          Placement(visible = true, transformation(origin = {-210.0, -130.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-110.0, -80.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Sources.Source Source1 annotation(
          Placement(visible = true, transformation(origin = {-150.0, 10.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Rates.Rate_1 Chg_Agr_Inp annotation(
          Placement(visible = true, transformation(origin = {-100.0, 10.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = 0)));
        SystemDynamics.Levels.Level1a Agr_Inp(x0 = agr_inp_init) annotation(
          Placement(visible = true, transformation(origin = {-40.0, 10.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Utilities.Ch_Agr_Inp Ch_Agr_Inp "p.292 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-100.0, -26.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -270)));
        SystemDynamics.WorldDynamics.World3.Utilities.Current_Agr_Inp Current_Agr_Inp "p.292 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-141.0, -50.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassInPort fr_inp_al_land_dev "Fraction of capital invested in agriculture allocated to the devlopment of arable land" annotation(
          Placement(visible = true, transformation(origin = {-210.0, -10.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-110.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Utilities.S_Avg_Life_Agr_Inp S_Avg_Life_Agr_Inp(t_policy_year = t_policy_year, p_avg_life_agr_inp_1 = p_avg_life_agr_inp_1, p_avg_life_agr_inp_2 = p_avg_life_agr_inp_2) "p.293 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {0.0, -50.0}, extent = {{10.0, -10.0}, {-10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular P_Fr_Inp_For_Land_Maint(x_vals = 0:4, y_vals = {0, 0.04, 0.07, 0.09, 0.1}) "p.332 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-126.5, 50.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Sources.Source Source2 annotation(
          Placement(visible = true, transformation(origin = {-40.0, 90.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Rates.Rate_1 Chg_Perc_Food_Ratio annotation(
          Placement(visible = true, transformation(origin = {10.0, 90.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = 0)));
        SystemDynamics.Levels.Level1a Perc_Food_Ratio(x0 = perc_food_ratio_init) annotation(
          Placement(visible = true, transformation(origin = {60.0, 90.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Utilities.Agr_Inp_Per_Hect Agr_Inp_Per_Hect "p.294 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-53.3528, 44.0583}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassInPort arable_land(unit = "hectare") "Arable land" annotation(
          Placement(visible = true, transformation(origin = {-210.0, 50.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-110.0, 40.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular Marg_Land_Yield_Mlt_Cap(y_vals = {0.075, 0.03, 0.015, 0.011, 0.009, 0.008, 0.007, 0.006, 0.005, 0.005, 0.005, 0.005, 0.005, 0.005, 0.005, 0.005, 0.005}, x_vals = {0, 40, 80, 120, 160, 200, 240, 280, 320, 360, 400, 440, 480, 520, 560, 600, 10000}) "p.313 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {23.5, -10.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular Land_Yield_Mlt_Cap(y_vals = {1, 3, 4.5, 5, 5.3, 5.6, 5.9, 6.1, 6.35, 6.6, 6.9, 7.2, 7.4, 7.6, 7.8, 8, 8.2, 8.4, 8.6, 8.8, 9, 9.2, 9.4, 9.6, 9.8, 10, 10}, x_vals = {0, 40, 80, 120, 160, 200, 240, 280, 320, 360, 400, 440, 480, 520, 560, 600, 640, 680, 720, 760, 800, 840, 880, 920, 960, 1000, 10000}) "p.306 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {21.5, 20.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Prod_4 Land_Yield "p.307 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {90.0, 30.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -90)));
        SystemDynamics.WorldDynamics.World3.Utilities.Marg_Prod_Agr_Inp Marg_Prod_Agr_Inp "p.313 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {160.0, -5.9417}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassOutPort marg_prod_agr_inp(unit = "kg/dollar") "Development of marginally producing land" annotation(
          Placement(visible = true, transformation(origin = {210.0, -10.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {110.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassOutPort land_yield(unit = "kg/(hectare.yr)") "Land yield" annotation(
          Placement(visible = true, transformation(origin = {210.0, 50.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {110.0, 40.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Utilities.Food Food(land_fr_harvested = land_fr_harvested, processing_loss = processing_loss) "p.280 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-158.0, 100.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        Modelica.Blocks.Math.Division Food_PC "p.281 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-126.0, 94.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassInPort population "Population" annotation(
          Placement(visible = true, transformation(origin = {-210.0, 110.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-110.0, 80.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        Modelica.Blocks.Math.Gain Food_Ratio(k = 1 / subsist_food_pc) "p.332 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-83.0, 94.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Utilities.Ch_Perc_Food_Ratio Ch_Perc_Food_Ratio(food_short_perc_del = food_short_perc_del) "p.333 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {121.825, 106.9111}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Utilities.S_Land_Yield_Fact S_Land_Yield_Fact(t_policy_year = t_policy_year, p_land_yield_fact_1 = p_land_yield_fact_1) "p.307 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {115.0, 50.0}, extent = {{10.0, -10.0}, {-10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Functions.SMTH3 P_Land_Yield_Fact_2(averaging_time(unit = "yr") = tech_dev_del_TDD) annotation(
          Placement(visible = true, transformation(origin = {157.0, 50.0}, extent = {{10.0, -10.0}, {-10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassInPort yield_tech_LYTD "Technology induced absolute yield enhancement" annotation(
          Placement(visible = true, transformation(origin = {-170.0, 150.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 90), iconTransformation(origin = {-60.0, 110.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -90)));
        SystemDynamics.Interfaces.MassInPort land_fertility(unit = "kg/(hectare.yr)") "Land fertility" annotation(
          Placement(visible = true, transformation(origin = {-170.0, -170.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -90), iconTransformation(origin = {-60.0, -110.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -270)));
        SystemDynamics.Interfaces.MassInPort s_yield_mlt_air_poll "Land yield multiplier from air pollution" annotation(
          Placement(visible = true, transformation(origin = {-110.0, -170.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -90), iconTransformation(origin = {-20.0, -110.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -270)));
        SystemDynamics.Interfaces.MassOutPort food_ratio "Food ratio" annotation(
          Placement(visible = true, transformation(origin = {210.0, 110.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {110.0, 80.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassOutPort tot_agric_invest(unit = "dollar/yr") "Total investment in the agricultural sector" annotation(
          Placement(visible = true, transformation(origin = {170.0, 150.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -90), iconTransformation(origin = {60.0, 110.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -270)));
        SystemDynamics.Interfaces.MassOutPort agr_inp_per_hect(unit = "dollar/(hectare.yr)") "Agricultural investments per hectare" annotation(
          Placement(visible = true, transformation(origin = {210.0, -70.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {110.0, -40.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassOutPort s_fioa_agr "Fraction of total investments allocated to the agricultural sector" annotation(
          Placement(visible = true, transformation(origin = {210.0, -130.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {110.0, -80.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassOutPort p_fr_inp_for_land_maint "Fraction of investments in the agricultural sector allocated to land maintenance" annotation(
          Placement(visible = true, transformation(origin = {170.0, -170.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 90), iconTransformation(origin = {60.0, -110.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -90)));
        SystemDynamics.Functions.Tabular Yield_Tech_Mult_Icor_COYM(y_vals = {1, 1, 1.05, 1.12, 1.25, 1.35, 1.5, 1.5}, x_vals = {0, 1, 1.2, 1.4, 1.6, 1.8, 2, 50}) annotation(
          Placement(visible = true, transformation(origin = {50.0, 50.0}, extent = {{10.0, -10.0}, {-10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassOutPort yield_tech_mult_icor_COYM "Technology induced relative enhancement of land yield" annotation(
          Placement(visible = true, transformation(origin = {110.0, -170.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 90), iconTransformation(origin = {20.0, -110.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -90)));
        SystemDynamics.Interfaces.MassOutPort food_pc(unit = "kg/yr") "Per capita annually consumed food" annotation(
          Placement(visible = true, transformation(origin = {110.0, 150.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -90), iconTransformation(origin = {20.0, 110.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -270)));
      equation
        connect(Marg_Prod_Agr_Inp.y, marg_prod_agr_inp) annotation(
          Line(visible = true, points = {{169.0, -5.9417}, {190.0, -5.9417}, {190.0, -10.0}, {210.0, -10.0}}, color = {0, 0, 191}));
        connect(S_FIOA_Agr.u1, P_Fr_IO_Al_Agr_1.y) annotation(
          Line(visible = true, points = {{67.0, -106.0}, {54.0, -106.0}, {54.0, -90.0}, {29.0, -90.0}}, color = {0, 0, 191}));
        connect(S_FIOA_Agr.u2, P_Fr_IO_Al_Agr_2.y) annotation(
          Line(visible = true, points = {{67.0, -114.0}, {54.0, -114.0}, {54.0, -130.0}, {29.0, -130.0}}, color = {0, 0, 191}));
        connect(S_Indic_Food_PC.u2, P_Indic_Food_PC_2.y) annotation(
          Line(visible = true, points = {{-88.0, -114.0}, {-106.0, -114.0}, {-106.0, -130.0}, {-131.0, -130.0}}, color = {0, 0, 191}));
        connect(S_Indic_Food_PC.u1, P_Indic_Food_PC_1.y) annotation(
          Line(visible = true, points = {{-88.0, -106.0}, {-106.0, -106.0}, {-106.0, -90.0}, {-131.0, -90.0}}, color = {0, 0, 191}));
        connect(Tot_Agric_Invest.y, Current_Agr_Inp.u2) annotation(
          Line(visible = true, points = {{120.0, -101.6}, {120.0, -64.0}, {-168.0, -64.0}, {-168.0, -54.0}, {-150.0, -54.0}}, color = {0, 0, 191}));
        connect(Current_Agr_Inp.u1, fr_inp_al_land_dev) annotation(
          Line(visible = true, points = {{-150.0, -46.0}, {-180.0, -46.0}, {-180.0, -10.0}, {-210.0, -10.0}}, color = {0, 0, 191}));
        connect(Ch_Agr_Inp.u3, Agr_Inp.y4) annotation(
          Line(visible = true, points = {{-94.0, -35.0}, {-94.0, -50.0}, {-51.25, -50.0}, {-51.25, -5.9972}, {-51.25, 0.25}}, color = {0, 0, 191}));
        connect(Agr_Inp_Per_Hect.u3, Agr_Inp.y) annotation(
          Line(visible = true, points = {{-62.3528, 38.0583}, {-76.0, 38.0583}, {-76.0, 20.0}, {-76.0, 18.25}, {-52.75, 18.25}}, color = {0, 0, 191}));
        connect(Marg_Land_Yield_Mlt_Cap.u, Agr_Inp_Per_Hect.y) annotation(
          Line(visible = true, points = {{15.5, -10.0}, {-10.0, -10.0}, {-10.0, 44.0583}, {-44.3528, 44.0583}}, color = {0, 0, 191}));
        connect(Land_Yield_Mlt_Cap.u, Agr_Inp_Per_Hect.y) annotation(
          Line(visible = true, points = {{13.5, 20.0}, {-10.0, 20.0}, {-10.0, 44.0583}, {-44.3528, 44.0583}}, color = {0, 0, 191}));
        connect(arable_land, Agr_Inp_Per_Hect.u2) annotation(
          Line(visible = true, points = {{-210.0, 50.0}, {-180.0, 50.0}, {-180.0, 30.0}, {-90.0, 30.0}, {-90.0, 44.0583}, {-62.3528, 44.0583}}, color = {0, 0, 191}));
        connect(Agr_Inp_Per_Hect.u1, P_Fr_Inp_For_Land_Maint.y) annotation(
          Line(visible = true, points = {{-62.3528, 50.0583}, {-78.95, 50.2}, {-78.95, 50.0}, {-115.5, 50.0}}, color = {0, 0, 191}));
        connect(S_FIOA_Agr.y, s_fioa_agr) annotation(
          Line(visible = true, points = {{85.0, -110.0}, {100.0, -110.0}, {100.0, -130.0}, {210.0, -130.0}}, color = {0, 0, 191}));
        connect(Tot_Agric_Invest.u1, S_FIOA_Agr.y) annotation(
          Line(visible = true, origin = {98.3, -110.0}, points = {{13.3, 0.0}, {-13.3, 0.0}}, color = {0, 0, 191}));
        connect(P_Fr_IO_Al_Agr_2.u, Div1.y) annotation(
          Line(visible = true, points = {{10.0, -130.0}, {-10.0, -130.0}, {-10.0, -104.0}, {-19.0, -104.0}}, color = {0, 0, 191}));
        connect(P_Fr_IO_Al_Agr_1.u, Div1.y) annotation(
          Line(visible = true, points = {{10.0, -90.0}, {-10.0, -90.0}, {-10.0, -104.0}, {-19.0, -104.0}}, color = {0, 0, 191}));
        connect(Div1.u2, S_Indic_Food_PC.y) annotation(
          Line(visible = true, origin = {-56.0, -110.0}, points = {{14.0, 0.0}, {-14.0, 0.0}}, color = {0, 0, 191}));
        connect(P_Indic_Food_PC_2.u, ind_out_pc) annotation(
          Line(visible = true, points = {{-150.0, -130.0}, {-180.0, -130.0}, {-180.0, -70.0}, {-210.0, -70.0}}, color = {0, 0, 191}));
        connect(P_Indic_Food_PC_1.u, ind_out_pc) annotation(
          Line(visible = true, points = {{-150.0, -90.0}, {-180.0, -90.0}, {-180.0, -70.0}, {-210.0, -70.0}}, color = {0, 0, 191}));
        connect(S_Avg_Life_Agr_Inp.y, Marg_Prod_Agr_Inp.u4) annotation(
          Line(visible = true, points = {{-9.0, -50.0}, {-40.0, -50.0}, {-40.0, -30.0}, {110.0, -30.0}, {110.0, -11.9417}, {151.0, -11.9417}}, color = {0, 0, 191}));
        connect(S_Avg_Life_Agr_Inp.y, Ch_Agr_Inp.u2) annotation(
          Line(visible = true, points = {{-9.0, -50.0}, {-40.0, -50.0}, {-40.0, -60.0}, {-100.0, -60.0}, {-100.0, -35.0}}, color = {0, 0, 191}));
        connect(Current_Agr_Inp.y, Ch_Agr_Inp.u1) annotation(
          Line(visible = true, origin = {-114.6667, -45.0}, points = {{-17.3333, -5.0}, {8.6667, -5.0}, {8.6667, 10.0}}, color = {0, 0, 191}));
        connect(Ch_Agr_Inp.y, Chg_Agr_Inp.u) annotation(
          Line(visible = true, origin = {-100.0, -11.375}, points = {{0.0, -5.625}, {0.0, 5.625}}, color = {0, 0, 191}));
        connect(Source1.MassInPort1, Chg_Agr_Inp.y) annotation(
          Line(visible = true, origin = {-123.25, 10.0}, points = {{-15.75, 0.0}, {15.75, 0.0}}, color = {95, 0, 191}));
        connect(Chg_Agr_Inp.y1, Agr_Inp.u1) annotation(
          Line(visible = true, origin = {-74.5, 10.0}, points = {{-18.0, 0.0}, {18.0, 0.0}}, color = {95, 0, 191}));
        connect(Marg_Land_Yield_Mlt_Cap.u, agr_inp_per_hect) annotation(
          Line(visible = true, points = {{15.5, -10.0}, {-10.0, -10.0}, {-10.0, -26.0}, {166.0, -26.0}, {166.0, -70.0}, {210.0, -70.0}}, color = {0, 0, 191}));
        connect(Marg_Land_Yield_Mlt_Cap.y, Marg_Prod_Agr_Inp.u3) annotation(
          Line(visible = true, points = {{34.5, -10.0}, {98.675, -10.0}, {98.675, -7.9417}, {151.0, -7.9417}}, color = {0, 0, 191}));
        connect(Land_Yield.y, Marg_Prod_Agr_Inp.u1) annotation(
          Line(visible = true, points = {{97.0, 30.0}, {130.0, 30.0}, {130.0, 0.0}, {151.0, 0.0583}}, color = {0, 0, 191}));
        connect(Land_Yield_Mlt_Cap.y, Marg_Prod_Agr_Inp.u2) annotation(
          Line(visible = true, points = {{32.5, 20.0}, {64.0, 20.0}, {64.0, -4.0}, {151.0, -3.9417}}, color = {0, 0, 191}));
        connect(Land_Yield.u3, s_yield_mlt_air_poll) annotation(
          Line(visible = true, points = {{84.4, 26.0}, {76.0, 26.0}, {76.0, -40.0}, {160.0, -40.0}, {160.0, -152.0}, {-110.0, -152.0}, {-110.0, -170.0}}, color = {0, 0, 191}));
        connect(Land_Yield.u2, land_fertility) annotation(
          Line(visible = true, points = {{84.4, 34.0}, {70.0, 34.0}, {70.0, -46.0}, {154.0, -46.0}, {154.0, -148.0}, {-170.0, -148.0}, {-170.0, -170.0}}, color = {0, 0, 191}));
        connect(Ch_Perc_Food_Ratio.y, Chg_Perc_Food_Ratio.u) annotation(
          Line(visible = true, points = {{130.825, 106.9111}, {160.0, 106.9111}, {160.0, 68.0}, {10.0, 68.0}, {10.0, 74.25}}, color = {0, 0, 191}));
        connect(Perc_Food_Ratio.y1, Ch_Perc_Food_Ratio.u2) annotation(
          Line(visible = true, points = {{72.75, 98.25}, {90.0, 98.25}, {90.0, 102.9111}, {112.825, 102.9111}}, color = {95, 0, 191}));
        connect(Food_Ratio.y, Ch_Perc_Food_Ratio.u1) annotation(
          Line(visible = true, points = {{-72.0, 94.0}, {-60.0, 94.0}, {-60.0, 111.0}, {90.0, 111.0}, {95.9556, 111.0}, {112.825, 110.9111}}, color = {0, 0, 191}));
        connect(P_Fr_Inp_For_Land_Maint.u, Perc_Food_Ratio.y) annotation(
          Line(visible = true, points = {{-134.5, 50.0}, {-162.0, 50.0}, {-162.0, 72.0}, {-52.0, 72.0}, {-52.0, 106.0}, {40.0, 106.0}, {40.0, 98.25}, {47.25, 98.25}}, color = {0, 0, 191}));
        connect(Chg_Perc_Food_Ratio.y1, Perc_Food_Ratio.u1) annotation(
          Line(visible = true, origin = {30.5, 90.0}, points = {{-13.0, 0.0}, {13.0, 0.0}}, color = {95, 0, 191}));
        connect(Land_Yield.y, Food.u1) annotation(
          Line(visible = true, points = {{97.0, 30.0}, {180.0, 30.0}, {180.0, 124.0}, {-180.0, 124.0}, {-180.0, 104.0}, {-167.0, 104.0}}, color = {0, 0, 191}));
        connect(Food.u2, arable_land) annotation(
          Line(visible = true, points = {{-167.0, 96.0}, {-180.0, 96.0}, {-180.0, 50.0}, {-210.0, 50.0}}, color = {0, 0, 191}));
        connect(Land_Yield.u4, Land_Yield_Mlt_Cap.y) annotation(
          Line(visible = true, points = {{90.0, 23.0}, {90.0, -4.0}, {64.0, -4.0}, {64.0, 20.0}, {32.5, 20.0}}, color = {0, 0, 191}));
        connect(S_Land_Yield_Fact.y, Land_Yield.u1) annotation(
          Line(visible = true, points = {{106.0, 50.0}, {90.0, 50.0}, {90.0, 37.0}}, color = {0, 0, 191}));
        connect(Land_Yield.y, land_yield) annotation(
          Line(visible = true, points = {{97.0, 30.0}, {180.0, 30.0}, {180.0, 50.0}, {210.0, 50.0}}, color = {0, 0, 191}));
        connect(P_Land_Yield_Fact_2.u, yield_tech_LYTD) annotation(
          Line(visible = true, points = {{168.0, 50.0}, {176.0, 50.0}, {176.0, 128.0}, {-170.0, 128.0}, {-170.0, 150.0}}, color = {0, 0, 191}));
        connect(P_Land_Yield_Fact_2.y, S_Land_Yield_Fact.u) annotation(
          Line(visible = true, origin = {135.0, 50.0}, points = {{11.0, 0.0}, {-11.0, 0.0}}, color = {0, 0, 191}));
        connect(S_Land_Yield_Fact.y, Yield_Tech_Mult_Icor_COYM.u) annotation(
          Line(visible = true, origin = {82.0, 50.0}, points = {{24.0, -0.0}, {-24.0, 0.0}}, color = {0, 0, 191}));
        connect(Yield_Tech_Mult_Icor_COYM.y, yield_tech_mult_icor_COYM) annotation(
          Line(visible = true, points = {{39.0, 50.0}, {-14.0, 50.0}, {-14.0, -24.0}, {106.0, -24.0}, {106.0, -140.0}, {110.0, -140.0}, {110.0, -170.0}}, color = {0, 0, 191}));
        connect(P_Fr_Inp_For_Land_Maint.y, p_fr_inp_for_land_maint) annotation(
          Line(visible = true, points = {{-115.5, 50.0}, {-80.0, 50.0}, {-80.0, -56.0}, {-50.0, -56.0}, {-50.0, -156.0}, {170.0, -156.0}, {170.0, -170.0}}, color = {0, 0, 191}));
        connect(Source2.MassInPort1, Chg_Perc_Food_Ratio.y) annotation(
          Line(visible = true, origin = {-13.25, 90.0}, points = {{-15.75, 0.0}, {15.75, 0.0}}, color = {95, 0, 191}));
        connect(Food_Ratio.y, food_ratio) annotation(
          Line(visible = true, points = {{-72.0, 94.0}, {-60.0, 94.0}, {-60.0, 132.0}, {184.0, 132.0}, {184.0, 110.0}, {210.0, 110.0}}, color = {0, 0, 191}));
        connect(Food_Ratio.u, Food_PC.y) annotation(
          Line(visible = true, origin = {-105.0, 94.0}, points = {{10.0, 0.0}, {-10.0, 0.0}}, color = {0, 0, 191}));
        connect(Food_PC.u1, Food.y) annotation(
          Line(visible = true, origin = {-143.5, 100.0}, points = {{5.5, 0.0}, {-5.5, 0.0}}, color = {0, 0, 191}));
        connect(Tot_Agric_Invest.u2, industrial_output) annotation(
          Line(points = {{128.4, -110.0}, {140.0, -110.0}, {140.0, -144.0}, {-190.0, -144.0}, {-190.0, -130.0}, {-210.0, -130.0}}, color = {0, 0, 191}, visible = true));
        connect(population, Food_PC.u2) annotation(
          Line(points = {{-210.0, 110.0}, {-190.0, 110.0}, {-190.0, 80.0}, {-146.0, 80.0}, {-146.0, 88.0}, {-138.0, 88.0}}, color = {0, 0, 191}, visible = true));
        connect(Food_PC.y, Div1.u1) annotation(
          Line(points = {{-115.0, 94.0}, {-110.0, 94.0}, {-110.0, 76.0}, {-174.0, 76.0}, {-174.0, -68.0}, {-46.0, -68.0}, {-46.0, -98.0}, {-42.0, -98.0}}, color = {0, 0, 191}, visible = true));
        connect(Food_PC.y, food_pc) annotation(
          Line(points = {{-115.0, 94.0}, {-110.0, 94.0}, {-110.0, 136.0}, {110.0, 136.0}, {110.0, 150.0}}, color = {0, 0, 191}, visible = true));
        connect(Tot_Agric_Invest.y, tot_agric_invest) annotation(
          Line(points = {{120.0, -101.6}, {120.0, -64.0}, {194.0, -64.0}, {194.0, 136.0}, {170.0, 136.0}, {170.0, 150.0}}, color = {0, 0, 191}, visible = true));
        annotation(
          Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, fillColor = {170, 255, 170}, fillPattern = FillPattern.Solid, lineThickness = 1.0, extent = {{-100.0, -100.0}, {100.0, 100.0}}, radius = 0.5), Text(visible = true, origin = {0.0, 30.0}, fillPattern = FillPattern.Solid, extent = {{-47.3724, -36.6918}, {47.3724, 36.6918}}, textString = "Food", fontSize = 102.0, fontName = "Arial"), Text(visible = true, origin = {0.0, -30.0}, fillPattern = FillPattern.Solid, extent = {{-95.13, -24.9532}, {95.13, 24.9532}}, textString = "Production", fontSize = 102.0, fontName = "Arial")}),
          Diagram(coordinateSystem(extent = {{-200.0, -160.0}, {200.0, 140.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{-181.0, -91.0}, {-179.0, -89.0}}), Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{-11.0, -105.0}, {-9.0, -103.0}}), Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{-11.0, 19.0}, {-9.0, 21.0}}), Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{-41.0, -51.0}, {-39.0, -49.0}}), Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{89.0, -5.0}, {91.0, -3.0}}), Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{-181.0, 49.0}, {-179.0, 51.0}}), Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{-111.0, 93.0}, {-109.0, 95.0}}), Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{179.0, 49.0}, {181.0, 51.0}}), Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{129.0, 29.0}, {131.0, 31.0}}), Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{-61.0, 110.0}, {-59.0, 112.0}}), Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{99.0, -111.0}, {101.0, -109.0}}), Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{-81.0, 49.0}, {-79.0, 51.0}}), Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{89.0, 49.0}, {91.0, 51.0}}), Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{119.0, -65.0}, {121.0, -63.0}})}),
          Documentation(info = "<html>
This model describes the production of food.  Food is a controlled variable, as farmers decide what to grow and how much to grow on the basis of their perception of what they can sell.  Consequently, the model uses the perceived food ratio as a state variable.  If the farmers decide that too much food is being produced already, they'll produce less next year, and vice versa. <p>
 
A second state variable describes the capital that is being invested in growing food.  Since that capital (for example, the capital expended in buying food harvesting machines) cannot be allocated or freed instantaneously, it makes sense to maintain also that variable as a state variable. <p>
 
The agricultural input is measured in dollars/year, whereas the food ratio is dimensionless.
</html>"));
      end Food_Production;