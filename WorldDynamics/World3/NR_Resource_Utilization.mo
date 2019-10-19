      block NR_Resource_Utilization "Utilization of non-recoverable natural resources"
        parameter Real des_res_use_rt_DNRUR(unit = "ton/yr") = 4800000000.0 "Desired resource utilization rate";
        parameter Real nr_resources_init(unit = "ton") = 1000000000000.0 "Initial available non-recoverable resources";
        parameter Real p_nr_res_use_fact_1 = 1 "Default non-recoverable resource utilization factor";
        parameter Real res_tech_init = 1 "Initial non-recoverable resource technology factor";
        parameter Real t_policy_year(unit = "yr") = 4000 "Year of policy change";
        parameter Real t_fcaor_time(unit = "yr") = 4000 "Year of capital allocation to resource use efficiency";
        parameter Real tech_dev_del_TDD(unit = "yr") = 20 "Technology development time";
        parameter Real p_fr_cap_al_obt_res_2[:] = {1, 0.2, 0.1, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05} "Non-renewable resource fraction remaining";
        parameter Real p_res_tech_chg_mlt[:] = {0, 0, 0, 0} "Resource technology change multiplier";
        SystemDynamics.Levels.Level1b NR_Resources(x0 = nr_resources_init) "p.387 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {40.0, 100.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = 0)));
        SystemDynamics.Rates.RRate NR_Res_Use_Rate "p.389 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {100.0, 100.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = 0)));
        SystemDynamics.Sources.Sink Sink1 annotation(
          Placement(visible = true, transformation(origin = {150.0, 100.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Prod_3 NR_Res_Use_Rt "p.389 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {100.0, 60.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Utilities.S_NR_Res_Use_Fact S_NR_Res_Use_Fact(t_policy_year = t_policy_year, p_nr_res_use_fact_1 = p_nr_res_use_fact_1) "p.390 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {69.0, -10.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Functions.SMTH3 P_Nr_Res_Use_Fact_2(averaging_time(unit = "yr") = tech_dev_del_TDD) annotation(
          Placement(visible = true, transformation(origin = {14.0, -10.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Levels.Level1a Res_Tech_NRTD(x0 = res_tech_init) annotation(
          Placement(visible = true, transformation(origin = {-40.0, -18.0827}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = 0)));
        SystemDynamics.Rates.Rate_1 Res_Tech_Ch_Rt_NRATE annotation(
          Placement(visible = true, transformation(origin = {-100.0, -18.0827}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = 0)));
        SystemDynamics.Sources.Source Source1 annotation(
          Placement(visible = true, transformation(origin = {-145.782, -18.0827}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Utilities.Res_Tech_Ch_Rt_NRATE Res_Tech_Chg_Rt(t_policy_year = t_policy_year) annotation(
          Placement(visible = true, transformation(origin = {-100.0, -66.5489}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -270)));
        SystemDynamics.Functions.Tabular P_Res_Tech_Chg_Mlt_NRCM(x_vals = {-10, -1, 0, 1}, y_vals = p_res_tech_chg_mlt) annotation(
          Placement(visible = true, transformation(origin = {-46.0, -130.0}, extent = {{10.0, -10.0}, {-10.0, 10.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Utilities.P_Res_Tech_Chg P_Res_Tech_Chg(des_res_use_rt_DNRUR = des_res_use_rt_DNRUR) annotation(
          Placement(visible = true, transformation(origin = {77.3158, -130.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -180)));
        SystemDynamics.Functions.Tabular PC_Res_Use_Mlt(x_vals = 0:200:1600, y_vals = {0, 0.85, 2.6, 3.4, 3.8, 4.1, 4.4, 4.7, 5}) "p.390 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {46.0, 60.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassInPort ind_out_pc(unit = "dollar/yr") "Per capita annual industrial output" annotation(
          Placement(visible = true, transformation(origin = {-210.0, 60.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-110.0, 50.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassInPort population "Population" annotation(
          Placement(visible = true, transformation(origin = {-210.0, -10.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-110.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassOutPort pc_res_use_mlt(unit = "ton/yr") "Per capita resource utilization" annotation(
          Placement(visible = true, transformation(origin = {210.0, 110.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {110.0, 60.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        Modelica.Blocks.Math.Gain NR_Res_Fr_Remain(k = 1 / nr_resources_init) "p.393 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-20.0, 100.0}, extent = {{10.0, -10.0}, {-10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular P_Fr_Cap_Al_Obt_Res_1(x_vals = 0:0.1:1, y_vals = {1, 0.9, 0.7, 0.5, 0.2, 0.1, 0.05, 0.05, 0.05, 0.05, 0.05}) "p.394 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-86.0, 120.0}, extent = {{10.0, -10.0}, {-10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular P_Fr_Cap_Al_Obt_Res_2(x_vals = 0:0.1:1, y_vals = p_fr_cap_al_obt_res_2) "p.394 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-86.0, 80.0}, extent = {{10.0, -10.0}, {-10.0, 10.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Utilities.S_Fr_Cap_Al_Obt_Res S_Fr_Cap_Al_Obt_Res(t_fcaor_time = t_fcaor_time) "p.393 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-159.0, 100.0}, extent = {{10.0, -10.0}, {-10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassOutPort s_fr_cap_al_obt_res "Fraction of capital allocated to resource use efficiency" annotation(
          Placement(visible = true, transformation(origin = {210.0, -70.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {110.0, -60.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular Ind_Cap_Out_Ratio_2(x_vals = {0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1, 2}, y_vals = {3.75, 3.6, 3.47, 3.36, 3.25, 3.16, 3.1, 3.06, 3.02, 3.01, 3, 3}) annotation(
          Placement(visible = true, transformation(origin = {131.0, -10.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassOutPort ind_cap_out_ratio_2_ICOR2T "Industrial capital output ratio" annotation(
          Placement(visible = true, transformation(origin = {210.0, -10.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {110.0, -20.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassInPort industrial_output(unit = "dollar/yr") "Annual industrial output" annotation(
          Placement(visible = true, transformation(origin = {-210.0, -80.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-110.0, -50.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        Modelica.Blocks.Math.Division Res_Intens annotation(
          Placement(visible = true, transformation(origin = {112.0, -68.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -270)));
        SystemDynamics.Interfaces.MassOutPort res_intens(unit = "ton/dollar") "Resource utilization intensity" annotation(
          Placement(visible = true, transformation(origin = {210.0, 50.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {110.0, 20.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      equation
        connect(P_Fr_Cap_Al_Obt_Res_1.y, S_Fr_Cap_Al_Obt_Res.u1) annotation(
          Line(visible = true, points = {{-97.0, 120.0}, {-128.0, 120.0}, {-128.0, 104.0}, {-150.0, 104.0}}, color = {0, 0, 191}));
        connect(P_Fr_Cap_Al_Obt_Res_2.y, S_Fr_Cap_Al_Obt_Res.u2) annotation(
          Line(visible = true, points = {{-97.0, 80.0}, {-128.0, 80.0}, {-128.0, 96.0}, {-150.0, 96.0}}, color = {0, 0, 191}));
        connect(P_Res_Tech_Chg.y, P_Res_Tech_Chg_Mlt_NRCM.u) annotation(
          Line(visible = true, origin = {15.1579, -130.0}, points = {{53.1579, 0.0}, {-53.1579, 0.0}}, color = {0, 0, 191}));
        connect(P_Res_Tech_Chg_Mlt_NRCM.y, Res_Tech_Chg_Rt.u1) annotation(
          Line(visible = true, origin = {-88.3333, -111.8496}, points = {{31.3333, -18.1504}, {-15.6667, -18.1504}, {-15.6667, 36.3007}}, color = {0, 0, 191}));
        connect(industrial_output, Res_Intens.u2) annotation(
          Line(visible = true, points = {{-210.0, -80.0}, {-180.0, -80.0}, {-180.0, -106.0}, {118.0, -106.0}, {118.0, -80.0}}, color = {0, 0, 191}));
        connect(Res_Intens.y, res_intens) annotation(
          Line(visible = true, points = {{112.0, -57.0}, {112.0, -40.0}, {190.0, -40.0}, {190.0, 50.0}, {210.0, 50.0}}, color = {0, 0, 191}));
        connect(P_Res_Tech_Chg.u, Res_Intens.u1) annotation(
          Line(visible = true, origin = {99.4386, -113.3333}, points = {{-13.1228, -16.6667}, {6.5614, -16.6667}, {6.5614, 33.3333}}, color = {0, 0, 191}));
        connect(Res_Tech_Ch_Rt_NRATE.y, Source1.MassInPort1) annotation(
          Line(visible = true, origin = {-121.141, -18.0827}, points = {{13.641, 0.0}, {-13.641, 0.0}}, color = {95, 0, 191}));
        connect(Res_Tech_NRTD.u1, Res_Tech_Ch_Rt_NRATE.y1) annotation(
          Line(visible = true, origin = {-74.5, -18.0827}, points = {{18.0, 0.0}, {-18.0, 0.0}}, color = {95, 0, 191}));
        connect(Res_Tech_Chg_Rt.y, Res_Tech_Ch_Rt_NRATE.u) annotation(
          Line(visible = true, origin = {-100.0, -45.6908}, points = {{0.0, -11.8581}, {0.0, 11.8581}}, color = {0, 0, 191}));
        connect(P_Nr_Res_Use_Fact_2.u, Res_Tech_NRTD.y1) annotation(
          Line(visible = true, points = {{3.0, -10.0}, {-9.2, -10.0}, {-9.2, -10.1}, {-27.25, -9.8327}}, color = {0, 0, 191}));
        connect(Res_Tech_Chg_Rt.u2, Res_Tech_NRTD.y4) annotation(
          Line(visible = true, points = {{-96.0, -75.5489}, {-96.0, -100.0}, {-51.25, -100.0}, {-51.25, -27.8327}}, color = {0, 0, 191}));
        connect(Ind_Cap_Out_Ratio_2.y, ind_cap_out_ratio_2_ICOR2T) annotation(
          Line(visible = true, points = {{142.0, -10.0}, {184.25, -10.0}, {184.25, -10.0}, {210.0, -10.0}}, color = {0, 0, 191}));
        connect(Ind_Cap_Out_Ratio_2.u, S_NR_Res_Use_Fact.y) annotation(
          Line(visible = true, points = {{123.0, -10.0}, {106.125, -10.0}, {106.125, -10.0}, {101.25, -10.0}, {101.25, -10.0}, {78.0, -10.0}}, color = {0, 0, 191}));
        connect(P_Nr_Res_Use_Fact_2.y, S_NR_Res_Use_Fact.u) annotation(
          Line(visible = true, points = {{25.0, -10.0}, {37.95, -10.0}, {37.95, -10.0}, {60.0, -10.0}}, color = {0, 0, 191}));
        connect(S_NR_Res_Use_Fact.y, NR_Res_Use_Rt.u2) annotation(
          Line(visible = true, origin = {92.6667, 11.0}, points = {{-14.6667, -21.0}, {7.3333, -21.0}, {7.3333, 42.0}}, color = {0, 0, 191}));
        connect(NR_Res_Use_Rt.u3, population) annotation(
          Line(visible = true, points = {{107.0, 60.0}, {120.0, 60.0}, {120.0, 30.0}, {-180.0, 30.0}, {-180.0, -10.0}, {-210.0, -10.0}}, color = {0, 0, 191}));
        connect(PC_Res_Use_Mlt.y, NR_Res_Use_Rt.u1) annotation(
          Line(visible = true, origin = {75.0, 60.0}, points = {{-18.0, 0.0}, {18.0, 0.0}}, color = {0, 0, 191}));
        connect(NR_Res_Use_Rt.y, P_Res_Tech_Chg.u) annotation(
          Line(visible = true, points = {{100.0, 67.0}, {100.0, 80.0}, {170.0, 80.0}, {170.0, -130.0}, {86.3158, -130.0}}, color = {0, 0, 191}));
        connect(NR_Res_Use_Rt.y, NR_Res_Use_Rate.u) annotation(
          Line(visible = true, origin = {100.0, 75.625}, points = {{0.0, -8.625}, {0.0, 8.625}}, color = {0, 0, 191}));
        connect(PC_Res_Use_Mlt.y, pc_res_use_mlt) annotation(
          Line(visible = true, points = {{57.0, 60.0}, {80.0, 60.0}, {80.0, 20.0}, {180.0, 20.0}, {180.0, 110.0}, {210.0, 110.0}}, color = {0, 0, 191}));
        connect(PC_Res_Use_Mlt.u, ind_out_pc) annotation(
          Line(visible = true, origin = {-86.0, 60.0}, points = {{124.0, 0.0}, {-124.0, 0.0}}, color = {0, 0, 191}));
        connect(NR_Res_Use_Rate.y1, Sink1.MassInPort1) annotation(
          Line(visible = true, origin = {123.25, 100.0}, points = {{-15.75, 0.0}, {15.75, 0.0}}, color = {95, 0, 191}));
        connect(NR_Res_Use_Rate.y, NR_Resources.u1) annotation(
          Line(visible = true, origin = {74.5, 100.0}, points = {{18.0, 0.0}, {-18.0, 0.0}}, color = {95, 0, 191}));
        connect(NR_Res_Fr_Remain.u, NR_Resources.y) annotation(
          Line(visible = true, points = {{-8.0, 100.0}, {16.0, 100.0}, {16.0, 108.25}, {27.25, 108.25}}, color = {0, 0, 191}));
        connect(NR_Res_Fr_Remain.y, P_Fr_Cap_Al_Obt_Res_2.u) annotation(
          Line(visible = true, points = {{-31.0, 100.0}, {-50.0, 100.0}, {-50.0, 80.0}, {-78.0, 80.0}}, color = {0, 0, 191}));
        connect(NR_Res_Fr_Remain.y, P_Fr_Cap_Al_Obt_Res_1.u) annotation(
          Line(visible = true, points = {{-31.0, 100.0}, {-50.0, 100.0}, {-50.0, 120.0}, {-78.0, 120.0}}, color = {0, 0, 191}));
        connect(S_Fr_Cap_Al_Obt_Res.y, s_fr_cap_al_obt_res) annotation(
          Line(visible = true, points = {{-168.0, 100.0}, {-190.0, 100.0}, {-190.0, -150.0}, {180.0, -150.0}, {180.0, -70.0}, {210.0, -70.0}}, color = {0, 0, 191}));
        annotation(
          Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, fillColor = {170, 255, 170}, fillPattern = FillPattern.Solid, lineThickness = 1.0, extent = {{-100.0, -100.0}, {100.0, 100.0}}, radius = 0.5), Text(visible = true, origin = {0.0, 50.0}, fillPattern = FillPattern.Solid, extent = {{-47.3724, -36.6918}, {47.3724, 36.6918}}, textString = "NR", fontSize = 102.0, fontName = "Arial"), Text(visible = true, origin = {-0.0, -49.1014}, fillPattern = FillPattern.Solid, extent = {{-88.3557, -20.8986}, {88.3557, 20.8986}}, textString = "Utilization", fontSize = 102.0, fontName = "Arial"), Text(visible = true, fillPattern = FillPattern.Solid, extent = {{-78.7713, -36.6918}, {78.7713, 36.6918}}, textString = "Resource", fontSize = 102.0, fontName = "Arial")}),
          Diagram(coordinateSystem(extent = {{-200.0, -160.0}, {200.0, 140.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{99.0, 79.0}, {101.0, 81.0}}), Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{79.0, 59.0}, {81.0, 61.0}}), Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{-51.0, 99.0}, {-49.0, 101.0}}), Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{99.0, -11.0}, {101.0, -9.0}}), Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{104.0, -131.0}, {106.0, -129.0}})}),
          Documentation(info = "<html>
This model describes the utilization of non-recoverable natural resources.  In the model (created in the early 1970s), the non-recoverable resources considered are mostly metals.  They are thus measured in metric tons. <p>
 
From today's perspective, it might make more sense to concentrate on the remaining fossil fuels, which is not the approach that Meadows and his coworkers took.  Yet, the effects of the dwindling resources on the overall economy are comparable, whether we can no longer produce goods, because we lack the raw materials or because we lack the energy to do so, results ultimately in the same predicament.  Due to the laws of exponential growth, we are running out of all kind of natural resources (fossil fuels, minerals, fresh water) almost simultaneously. <p>
 
In the case of minerals, recovery is partly possible, as discarded materials can be recycled.  However doing so requires energy for the re-concentration of these scrap materials.  The materials themselves don't get used up.  They only get dissipated further and further, until their density is so low that they cannot be collected any longer within reasonable cost limits. <p>
 
In the case of fossil fuels, these truly get used up.  These resources are non-recoverable within human time constants.  They were developed over many millions of years and essentially represent \"fossil sunshine.\"  Humanity is using all of these resources up within the very short time span (in geological terms) of a few hundred years.  <font color=red><b>Peak Oil</b></font>, i.e., the time when we shall have used up 50% of the available oil, and when supply can no longer keep up with demand, is now just around the corner. <p>
 
The fantastic recent developments of technology and the medical sciences, accompanied by an unprecedented growth of human population, would not have been possible without these resources, and won't be maintainable, once they shall have been used up. <p>
 
Whereas the earlier <font color=red><b>WORLD2</b></font> model only accounted for the dwindling resources themselves, the newer <font color=red><b>WORLD3</b></font> model offers a second state variable representing technological change.  Through more advanced technology, it is possible to use the available resources more efficiently, and that effect is accounted for by the second state variable in the model. <p>
 
In the <font color=red><b>WORLD3</b></font> model, the natural resources themselves are measured in metric tons, whereas the technology change has no units.
</html>", revisions = ""));
      end NR_Resource_Utilization;