      block Pollution_Dynamics "Pollution dynamics"
        parameter Real agr_mtl_toxic_index(unit = "1/dollar") = 1 "Agricultural materials toxicity index";
        parameter Real assim_half_life_1970(unit = "yr") = 1.5 "Pollution assimilation half life in 1970";
        parameter Real des_ppoll_index_DPOLX = 1.2 "Desired persistent pollution index";
        parameter Real fr_agr_inp_pers_mtl = 0.001 "Effective fraction of agricultural pollution input";
        parameter Real frac_res_pers_mtl = 0.02 "Effective fraction of resource utilization on pollution generation";
        parameter Real ind_mtl_emiss_fact(unit = "1/ton") = 0.1 "Industrial materials emission factor";
        parameter Real ind_mtl_toxic_index = 10.0 "Industrial materials toxicity index";
        parameter Real ind_out_in_1970(unit = "dollar/yr") = 790000000000.0 "Industrial output in 1970";
        parameter Real p_ppoll_gen_fact_1 = 1 "Default persistent pollution generation factor";
        parameter Real pers_pollution_init = 25000000.0 "Initial persistent pollution";
        parameter Real ppoll_in_1970 = 136000000.0 "Persistent pollution in 1970";
        parameter Real ppoll_tech_init = 1 "Initial persistent pollution technology change factor";
        parameter Real ppoll_trans_del(unit = "yr") = 20 "Persistent pollution transmission delay";
        parameter Real t_air_poll_time(unit = "yr") = 4000 "Air pollution change time";
        parameter Real t_policy_year(unit = "yr") = 4000 "Year of policy change";
        parameter Real tech_dev_del_TDD(unit = "yr") = 20 "Technology development time";
        parameter Real p_ppoll_tech_chg_mlt[:] = {0, 0, 0, 0} "Persistent pollution technology change multiplier";
        SystemDynamics.Levels.Level Pers_Pollution(x0 = pers_pollution_init) "p.440 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-10.0, -10.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = 0)));
        SystemDynamics.Rates.RRate PPoll_Appear_Rt "p.435 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-70.0, -10.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = 0)));
        SystemDynamics.Rates.RRate PPoll_Assim_Rt "p.442 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {50.0, -10.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = 0)));
        SystemDynamics.Sources.Source Source1 annotation(
          Placement(visible = true, transformation(origin = {-110.0, -10.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Sources.Sink Sink1 annotation(
          Placement(visible = true, transformation(origin = {90.0, -10.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Functions.SMTH3 PPoll_Appear_Rate(smooth_init(unit = "1/yr") = 0, averaging_time(unit = "yr") = ppoll_trans_del) "p.435 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-70.0, -50.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -90)));
        SystemDynamics.WorldDynamics.World3.Utilities.PPoll_Assim_Rt PPoll_Ass_Rt "p.442 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {50.0, -44.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -270)));
        SystemDynamics.Functions.Tabular Assim_Half_Life_Mlt(x_vals = (-249):250:1001, y_vals = {1, 1, 11, 21, 31, 41}) "p.453 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {17.0, -112.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        Modelica.Blocks.Math.Gain PPoll_Index(k = 1 / ppoll_in_1970) "p.441 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-32.0, -112.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Utilities.PPoll_Gen_Rt PPoll_Gen_Rt "p.428 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-98.0, -80.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Utilities.PPoll_Gen_Agr PPoll_Gen_Agr(agr_mtl_toxic_index = agr_mtl_toxic_index, fr_agr_inp_pers_mtl = fr_agr_inp_pers_mtl) "p.433 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-147.0, -120.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Utilities.PPoll_Gen_Ind PPoll_Gen_Ind(frac_res_pers_mtl = frac_res_pers_mtl, ind_mtl_emiss_fact = ind_mtl_emiss_fact, ind_mtl_toxic_index = ind_mtl_toxic_index) "p.429 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-155.0, -80.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Levels.Level1a PPoll_Tech_PTD(x0 = ppoll_tech_init) annotation(
          Placement(visible = true, transformation(origin = {140.0, 100.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = 0)));
        SystemDynamics.Rates.Rate_1 PPoll_Tech_Chg_Rt annotation(
          Placement(visible = true, transformation(origin = {80.0, 100.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = 0)));
        SystemDynamics.Sources.Source Source2 annotation(
          Placement(visible = true, transformation(origin = {30.0, 100.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Utilities.PPoll_Tech_Chg_Rt PPoll_Tech_Ch_Rt(t_policy_year = t_policy_year) annotation(
          Placement(visible = true, transformation(origin = {80.0, 60.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -270)));
        SystemDynamics.Functions.Tabular P_PPoll_Tech_Chg_mlt_POLGFM(y_vals = p_ppoll_tech_chg_mlt, x_vals = {-100, -1, 0, 1}) annotation(
          Placement(visible = true, transformation(origin = {23.0, 30.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Utilities.P_PPoll_Tech_Chg P_PPoll_Tech_Chg(des_ppoll_index_DPOLX = des_ppoll_index_DPOLX) annotation(
          Placement(visible = true, transformation(origin = {-40.0, 30.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Functions.SMTH3 P_PPoll_Gen_Fact_2(averaging_time(unit = "yr") = tech_dev_del_TDD) annotation(
          Placement(visible = true, transformation(origin = {-30.0, 90.0}, extent = {{10.0, -10.0}, {-10.0, 10.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Utilities.S_PPoll_Gen_Fact S_PPoll_Gen_Fact(t_policy_year = t_policy_year, p_ppoll_gen_fact_1 = p_ppoll_gen_fact_1) "p.428 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-82.0, 90.0}, extent = {{10.0, -10.0}, {-10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassInPort population "Population" annotation(
          Placement(visible = true, transformation(origin = {-210.0, 50.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-110.0, 40.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassInPort pc_res_use_mlt(unit = "ton/yr") "Per capita resource utilization" annotation(
          Placement(visible = true, transformation(origin = {-210.0, 110.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-110.0, 80.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassInPort arable_land(unit = "hectare") "Arable land" annotation(
          Placement(visible = true, transformation(origin = {-210.0, -130.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-110.0, -80.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassInPort agr_inp_per_hect(unit = "dollar/(hectare.yr)") "Agricultural investments per hectare" annotation(
          Placement(visible = true, transformation(origin = {-210.0, -70.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-110.0, -40.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular PPoll_Tech_Mult_Icor_COPM(x_vals = {0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1, 2}, y_vals = {1.25, 1.2, 1.15, 1.11, 1.08, 1.05, 1.03, 1.02, 1.01, 1, 1, 1}) annotation(
          Placement(visible = true, transformation(origin = {-81.0, 120.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassOutPort ppoll_tech_mult_icor_COPM "Technology induced reduction in persistent pollution release" annotation(
          Placement(visible = true, transformation(origin = {210.0, 50.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {110.0, 40.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassOutPort ppoll_index "Persistent pollution index" annotation(
          Placement(visible = true, transformation(origin = {210.0, -10.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {110.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassOutPort ppoll_gen_rt(unit = "1/yr") "Persistent pollution generation rate" annotation(
          Placement(visible = true, transformation(origin = {210.0, -130.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {110.0, -80.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassInPort industrial_output(unit = "dollar/yr") "Annual industrial output" annotation(
          Placement(visible = true, transformation(origin = {-210.0, -10.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-110.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Utilities.Poll_Intens_Ind Poll_Intens_Ind annotation(
          Placement(visible = true, transformation(origin = {-150.0, 67.6993}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -270)));
        SystemDynamics.Interfaces.MassOutPort poll_intens_ind(unit = "1/dollar") "Persistent pollution intensity index" annotation(
          Placement(visible = true, transformation(origin = {210.0, 110.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {110.0, 80.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        Modelica.Blocks.Math.Gain Gain1(k = 1 / ind_out_in_1970) annotation(
          Placement(visible = true, transformation(origin = {-103.0, -140.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular P_Yield_Mlt_Air_Poll_1(x_vals = 0:10:30, y_vals = {1, 1, 0.7, 0.4}) "p.310 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {104.0, -48.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular P_Yield_Mlt_Air_Poll_2(x_vals = 0:10:30, y_vals = {1, 1, 0.98, 0.95}) "p.310 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {104.0, -90.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Utilities.S_Yield_Mlt_Air_Poll S_Yield_Mlt_Air_Poll(t_air_poll_time = t_air_poll_time) "p.310 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {170.0, -70.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassOutPort s_yield_mlt_air_poll "Land yield multiplier to air pollution release" annotation(
          Placement(visible = true, transformation(origin = {210.0, -70.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {110.0, -40.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        Modelica.Blocks.Math.Gain Assim_Half_Life(k = assim_half_life_1970) "p.453 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {56.0, -84.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -90)));
      equation
        connect(S_Yield_Mlt_Air_Poll.u1, P_Yield_Mlt_Air_Poll_1.y) annotation(
          Line(visible = true, points = {{161.0, -66.0}, {140.0, -66.0}, {140.0, -48.0}, {115.0, -48.0}}, color = {0, 0, 191}));
        connect(P_Yield_Mlt_Air_Poll_2.y, S_Yield_Mlt_Air_Poll.u2) annotation(
          Line(visible = true, points = {{115.0, -90.0}, {140.0, -90.0}, {140.0, -74.0}, {161.0, -74.0}}, color = {0, 0, 191}));
        connect(arable_land, PPoll_Gen_Agr.u2) annotation(
          Line(visible = true, points = {{-210.0, -130.0}, {-180.0, -130.0}, {-180.0, -124.0}, {-156.0, -124.0}}, color = {0, 0, 191}));
        connect(agr_inp_per_hect, PPoll_Gen_Agr.u1) annotation(
          Line(visible = true, points = {{-210.0, -70.0}, {-190.0, -70.0}, {-190.0, -116.0}, {-156.0, -116.0}}, color = {0, 0, 191}));
        connect(PPoll_Gen_Ind.u2, population) annotation(
          Line(visible = true, points = {{-164.0, -84.0}, {-180.0, -84.0}, {-180.0, 50.0}, {-210.0, 50.0}}, color = {0, 0, 191}));
        connect(PPoll_Gen_Ind.u1, pc_res_use_mlt) annotation(
          Line(visible = true, points = {{-164.0, -76.0}, {-176.0, -76.0}, {-176.0, -74.0}, {-176.0, 110.0}, {-210.0, 110.0}}, color = {0, 0, 191}));
        connect(S_PPoll_Gen_Fact.y, PPoll_Gen_Rt.u1) annotation(
          Line(visible = true, points = {{-91.0, 90.0}, {-126.0, 90.0}, {-126.0, -74.0}, {-107.0, -74.0}}, color = {0, 0, 191}));
        connect(PPoll_Gen_Agr.y, PPoll_Gen_Rt.u3) annotation(
          Line(visible = true, points = {{-138.0, -120.0}, {-126.0, -120.0}, {-126.0, -86.0}, {-107.0, -86.0}}, color = {0, 0, 191}));
        connect(Assim_Half_Life.y, PPoll_Ass_Rt.u2) annotation(
          Line(visible = true, points = {{56.0, -95.0}, {56.0, -65.1}, {54.0, -65.1}, {54.0, -53.0}}, color = {0, 0, 191}));
        connect(PPoll_Ass_Rt.u1, Pers_Pollution.y2) annotation(
          Line(visible = true, points = {{46.0, -53.0}, {46.0, -64.0}, {1.25, -64.0}, {1.25, -19.75}}, color = {0, 0, 191}));
        connect(S_Yield_Mlt_Air_Poll.y, s_yield_mlt_air_poll) annotation(
          Line(visible = true, origin = {194.5, -70.0}, points = {{-15.5, 0.0}, {15.5, 0.0}}, color = {0, 0, 191}));
        connect(Gain1.y, P_Yield_Mlt_Air_Poll_2.u) annotation(
          Line(visible = true, points = {{-92.0, -140.0}, {76.0, -140.0}, {76.0, -90.0}, {96.0, -90.0}}, color = {0, 0, 191}));
        connect(Gain1.y, P_Yield_Mlt_Air_Poll_1.u) annotation(
          Line(visible = true, points = {{-92.0, -140.0}, {76.0, -140.0}, {76.0, -48.0}, {96.0, -48.0}}, color = {0, 0, 191}));
        connect(PPoll_Ass_Rt.y, PPoll_Assim_Rt.u) annotation(
          Line(visible = true, origin = {50.0, -30.375}, points = {{0.0, -4.625}, {0.0, 4.625}}, color = {0, 0, 191}));
        connect(Assim_Half_Life_Mlt.y, Assim_Half_Life.u) annotation(
          Line(visible = true, points = {{28.0, -112.0}, {56.0, -112.0}, {56.0, -72.0}}, color = {0, 0, 191}));
        connect(PPoll_Index.y, Assim_Half_Life_Mlt.u) annotation(
          Line(visible = true, origin = {-6.0, -112.0}, points = {{-15.0, 0.0}, {15.0, 0.0}}, color = {0, 0, 191}));
        connect(PPoll_Index.y, ppoll_index) annotation(
          Line(visible = true, points = {{-21.0, -112.0}, {-10.0, -112.0}, {-10.0, -126.0}, {72.0, -126.0}, {72.0, 12.0}, {110.0, 12.0}, {110.0, -10.0}, {210.0, -10.0}}, color = {0, 0, 191}));
        connect(PPoll_Index.y, P_PPoll_Tech_Chg.u) annotation(
          Line(visible = true, points = {{-21.0, -112.0}, {-10.0, -112.0}, {-10.0, -126.0}, {72.0, -126.0}, {72.0, 12.0}, {-70.0, 12.0}, {-70.0, 30.0}, {-49.0, 30.0}}, color = {0, 0, 191}));
        connect(PPoll_Index.u, Pers_Pollution.y3) annotation(
          Line(visible = true, points = {{-44.0, -112.0}, {-56.0, -112.0}, {-56.0, -72.0}, {-10.0, -72.0}, {-10.0, -19.75}}, color = {0, 0, 191}));
        connect(PPoll_Gen_Rt.y, ppoll_gen_rt) annotation(
          Line(visible = true, points = {{-89.0, -80.0}, {-70.0, -80.0}, {-70.0, -130.0}, {210.0, -130.0}}, color = {0, 0, 191}));
        connect(PPoll_Gen_Ind.y, PPoll_Gen_Rt.u2) annotation(
          Line(visible = true, origin = {-126.5, -80.0}, points = {{-19.5, 0.0}, {19.5, 0.0}}, color = {0, 0, 191}));
        connect(PPoll_Gen_Rt.y, PPoll_Appear_Rate.u) annotation(
          Line(visible = true, points = {{-89.0, -80.0}, {-70.0, -80.0}, {-70.0, -39.0}}, color = {0, 0, 191}));
        connect(Gain1.u, industrial_output) annotation(
          Line(visible = true, points = {{-115.0, -140.0}, {-184.0, -140.0}, {-184.0, -10.0}, {-210.0, -10.0}}, color = {0, 0, 191}));
        connect(PPoll_Gen_Ind.y, Poll_Intens_Ind.u2) annotation(
          Line(visible = true, points = {{-146.0, -80.0}, {-134.0, -80.0}, {-134.0, -40.0}, {-150.0, -40.0}, {-150.0, 58.6993}}, color = {0, 0, 191}));
        connect(PPoll_Appear_Rate.y, PPoll_Appear_Rt.u) annotation(
          Line(visible = true, points = {{-70.0, -61.0}, {-70.0, -25.75}}, color = {0, 0, 191}));
        connect(PPoll_Assim_Rt.y, Pers_Pollution.u2) annotation(
          Line(visible = true, points = {{42.5, -10.0}, {24.9, -10.0}, {24.9, -10.0}, {6.5, -10.0}}, color = {95, 0, 191}));
        connect(Sink1.MassInPort1, PPoll_Assim_Rt.y1) annotation(
          Line(visible = true, points = {{79.0, -10.0}, {69.5, -10.0}, {69.5, -10.0}, {57.5, -10.0}}, color = {95, 0, 191}));
        connect(Source1.MassInPort1, PPoll_Appear_Rt.y) annotation(
          Line(visible = true, points = {{-99.0, -10.0}, {-89.5, -10.0}, {-89.5, -10.0}, {-77.5, -10.0}}, color = {95, 0, 191}));
        connect(PPoll_Appear_Rt.y1, Pers_Pollution.u1) annotation(
          Line(visible = true, points = {{-62.5, -10.0}, {-44.9, -10.0}, {-44.9, -10.0}, {-26.5, -10.0}}, color = {95, 0, 191}));
        connect(P_PPoll_Tech_Chg.y, P_PPoll_Tech_Chg_mlt_POLGFM.u) annotation(
          Line(visible = true, origin = {-8.0, 30.0}, points = {{-23.0, 0.0}, {23.0, 0.0}}, color = {0, 0, 191}));
        connect(PPoll_Tech_Ch_Rt.u1, P_PPoll_Tech_Chg_mlt_POLGFM.y) annotation(
          Line(visible = true, origin = {62.0, 37.0}, points = {{14.0, 14.0}, {14.0, -7.0}, {-28.0, -7.0}}, color = {0, 0, 191}));
        connect(PPoll_Tech_Ch_Rt.u2, PPoll_Tech_PTD.y4) annotation(
          Line(visible = true, points = {{84.0, 51.0}, {83.9764, 35.6612}, {83.9764, 30.0}, {128.75, 30.0}, {128.75, 90.25}}, color = {0, 0, 191}));
        connect(P_PPoll_Gen_Fact_2.u, PPoll_Tech_PTD.y) annotation(
          Line(visible = true, points = {{-19.0, 90.0}, {0.0, 90.0}, {0.0, 120.0}, {110.0, 120.0}, {110.0, 108.25}, {127.25, 108.25}}, color = {0, 0, 191}));
        connect(PPoll_Tech_Chg_Rt.y1, PPoll_Tech_PTD.u1) annotation(
          Line(visible = true, origin = {105.5, 100.0}, points = {{-18.0, 0.0}, {18.0, 0.0}}, color = {95, 0, 191}));
        connect(PPoll_Tech_Ch_Rt.y, PPoll_Tech_Chg_Rt.u) annotation(
          Line(visible = true, origin = {80.0, 76.625}, points = {{0.0, -7.625}, {0.0, 7.625}}, color = {0, 0, 191}));
        connect(Source2.MassInPort1, PPoll_Tech_Chg_Rt.y) annotation(
          Line(visible = true, origin = {56.75, 100.0}, points = {{-15.75, 0.0}, {15.75, 0.0}}, color = {95, 0, 191}));
        connect(S_PPoll_Gen_Fact.u, P_PPoll_Gen_Fact_2.y) annotation(
          Line(visible = true, origin = {-57.0, 90.0}, points = {{-16.0, 0.0}, {16.0, 0.0}}, color = {0, 0, 191}));
        connect(S_PPoll_Gen_Fact.y, Poll_Intens_Ind.u3) annotation(
          Line(visible = true, points = {{-91.0, 90.0}, {-126.0, 90.0}, {-126.0, -10.0}, {-144.0, -10.0}, {-144.0, 58.6993}}, color = {0, 0, 191}));
        connect(S_PPoll_Gen_Fact.y, PPoll_Tech_Mult_Icor_COPM.u) annotation(
          Line(visible = true, points = {{-91.0, 90.0}, {-126.0, 90.0}, {-126.0, 120.0}, {-89.0, 120.0}}, color = {0, 0, 191}));
        connect(PPoll_Tech_Mult_Icor_COPM.y, ppoll_tech_mult_icor_COPM) annotation(
          Line(visible = true, points = {{-70.0, 120.0}, {-20.0, 120.0}, {-20.0, 130.0}, {180.0, 130.0}, {180.0, 50.0}, {210.0, 50.0}}, color = {0, 0, 191}));
        connect(Poll_Intens_Ind.u1, industrial_output) annotation(
          Line(points = {{-156.0, 58.6993}, {-156.0, -10.0}, {-210.0, -10.0}}, color = {0, 0, 191}, visible = true));
        connect(Poll_Intens_Ind.y, poll_intens_ind) annotation(
          Line(points = {{-150.0, 76.6993}, {-150.0, 140.0}, {190.0, 140.0}, {190.0, 110.0}, {210.0, 110.0}}, color = {0, 0, 191}, visible = true));
        annotation(
          Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, fillColor = {170, 255, 170}, fillPattern = FillPattern.Solid, lineThickness = 1.0, extent = {{-100.0, -100.0}, {100.0, 100.0}}, radius = 0.5), Text(visible = true, origin = {0.2251, 30.0}, fillPattern = FillPattern.Solid, extent = {{-69.7749, -36.6918}, {69.7749, 36.6918}}, textString = "Pollution", fontSize = 102.0, fontName = "Arial"), Text(visible = true, origin = {-0.3752, -30.0}, fillPattern = FillPattern.Solid, extent = {{-79.6248, -36.6918}, {79.6248, 36.6918}}, textString = "Dynamics", fontSize = 102.0, fontName = "Arial")}),
          Diagram(coordinateSystem(extent = {{-200.0, -160.0}, {200.0, 140.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{-11.0, -113.0}, {-9.0, -111.0}}), Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{-127.0, 89.0}, {-125.0, 91.0}}), Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{-71.0, -81.0}, {-69.0, -79.0}}), Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{71.0, 11.0}, {73.0, 13.0}}), Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{-135.0, -81.0}, {-133.0, -79.0}}), Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{-127.0, -11.0}, {-125.0, -9.0}}), Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{-185.0, -11.0}, {-183.0, -9.0}}), Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{75.0, -91.0}, {77.0, -89.0}})}),
          Documentation(info = "<html>
This model describes the appearance of persistent pollutants.  These pollutants are an unwelcome yet inevitable byproduct of our industrial production.  Especially air pollution is problematic, because these pollutants are difficult to re-capture, and they remain in the air for a long time, somewhere in the order of 100 years.  These then lead to <font color=red><b>Global Warming</b></font>. <p>
 
Whereas the earlier <font color=red><b>WORLD2</b></font> model listed only the appearance and assimilation of pollution itself, the newer <font color=red><b>WORLD3</b></font> model accounts for the possibility of reducing the release of pollutants into the air by improved technology using a second state variable.  For example, it may be possible to burn coal in a power plant that captures the released CO<sub>2</sub> rather than releasing it into the atmosphere.  In this way, the greenhouse gas emissions could be significantly reduced, and thereby, the effects of global warming could be mitigated. <p>
 
Pollutants can take many forms.  For this reason, the <font color=red><b>WORLD3</b></font> model normalizes the pollutants and expresses them in \"units of pollution.\"  In accordance with engineering practice, normalized quantities are assumed to be dimensionless (the dimensions are filtered out in the process of normalization), and consequently, pollution in this model is assumed dimensionless.  The technology change factor is also dimensionless.
</html>"));
      end Pollution_Dynamics;