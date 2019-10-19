      block Land_Fertility "Land fertility"
        parameter Real des_food_ratio_dfr = 2 "Desired food ratio";
        parameter Real inherent_land_fert(unit = "kg/(hectare.yr)") = 600 "Inherent land fertility";
        parameter Real land_fertility_init(unit = "kg/(hectare.yr)") = 600 "Initial industrial investment";
        parameter Real t_policy_year(unit = "yr") = 4000 "Year of policy change";
        parameter Real yield_tech_init = 1 "Initial yield technology factor";
        parameter Real p_yield_tech_chg_mlt[:] = {0, 0, 0, 0} "Yield technology change multiplier";
        SystemDynamics.Sources.Source Source1 annotation(
          Placement(visible = true, transformation(origin = {-66.2556, -17.775}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Rates.RRate Land_Fert_Regen "p.328 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-35.3056, -17.775}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = 0)),
          Dialog(group = "Variables"));
        SystemDynamics.Levels.Level Land_Fertility(x0 = land_fertility_init) "p.324 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {1.852, -17.6868}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = 0)),
          Dialog(group = "Variables"));
        SystemDynamics.Rates.RRate Land_Fert_Degr "p.326 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {40.0, -27.3}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = 0)),
          Dialog(group = "Variables"));
        SystemDynamics.Sources.Sink Sink1 annotation(
          Placement(visible = true, transformation(origin = {63.0806, -27.3}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Utilities.Land_Fert_Reg Land_Fert_Reg(inherent_land_fert = inherent_land_fert) "p.328 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-35.3056, -47.3694}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -270)),
          Dialog(group = "Variables"));
        SystemDynamics.Auxiliary.Prod_2 Land_Fert_Deg "p.326 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {40.0, -60.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular Land_Fert_Regen_Time(x_vals = 0:0.02:0.1, y_vals = {20, 13, 8, 4, 2, 2}) "p.330 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-60.0, -74.7625}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)),
          Dialog(group = "Variables"));
        SystemDynamics.Functions.Tabular Land_Fert_Degr_Rt(x_vals = {0, 10, 20, 30, 100}, y_vals = {0, 0.1, 0.3, 0.5, 0.5}) "p.326 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {51.9556, -90.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)),
          Dialog(group = "Variables"));
        SystemDynamics.Interfaces.MassInPort p_fr_inp_for_land_maint "Fraction of investments in the agricultural sector allocated to land maintenance" annotation(
          Placement(visible = true, transformation(origin = {-110.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-110.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassInPort ppoll_index "Persistent pollution index" annotation(
          Placement(visible = true, transformation(origin = {-110.0, -50.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-110.0, -50.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassOutPort land_fertility(unit = "kg/(hectare.yr)") "Land fertility" annotation(
          Placement(visible = true, transformation(origin = {110.0, -40.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {110.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Rates.Rate_1 Yield_Tech_Chg_Rt_LYTDR annotation(
          Placement(visible = true, transformation(origin = {15.9833, 77.775}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = 0)),
          Dialog(group = "Variables"));
        SystemDynamics.WorldDynamics.World3.Utilities.Yield_Tech_Chg_Rt Yield_Tech_Chg_Rt(t_policy_year = t_policy_year) annotation(
          Placement(visible = true, transformation(origin = {16.1257, 46.8312}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -270)));
        SystemDynamics.Functions.Tabular P_Yield_Tech_Chg_Mlt_LYCM(y_vals = p_yield_tech_chg_mlt, x_vals = {-2, 0, 1, 2}) annotation(
          Placement(visible = true, transformation(origin = {-20.0, 20.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)),
          Dialog(group = "Variables"));
        SystemDynamics.Interfaces.MassInPort food_ratio "Food ratio" annotation(
          Placement(visible = true, transformation(origin = {-110.0, 60.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-110.0, 50.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        Modelica.Blocks.Math.Add Add1(k2 = -1) annotation(
          Placement(visible = true, transformation(origin = {-56.1556, 20.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Const Des_Food_Ratio_DFR(k = des_food_ratio_dfr) annotation(
          Placement(visible = true, transformation(origin = {-73.9222, 73.5389}, extent = {{-10.0, 10.0}, {10.0, -10.0}}, rotation = 0)),
          Dialog(group = "Variables"));
        SystemDynamics.Interfaces.MassOutPort yield_tech_LYTD "Technology induced absolute yield enhancement" annotation(
          Placement(visible = true, transformation(origin = {110.0, 40.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {110.0, 50.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Sources.Source Source2 annotation(
          Placement(visible = true, transformation(origin = {-27.9111, 77.775}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Levels.Level1a Yield_Tech_LYTD(x0 = yield_tech_init) annotation(
          Placement(visible = true, transformation(origin = {55.0, 70.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = 0)),
          Dialog(group = "Variables"));
      equation
        connect(Land_Fert_Regen_Time.u, p_fr_inp_for_land_maint) annotation(
          Line(visible = true, points = {{-68.0, -74.7625}, {-80.0, -74.4979}, {-80.0, 0.0}, {-110.0, 0.0}}, color = {0, 0, 191}));
        connect(Land_Fert_Regen_Time.y, Land_Fert_Reg.u1) annotation(
          Line(visible = true, origin = {-42.5371, -68.6315}, points = {{-6.4629, -6.131}, {3.2315, -6.131}, {3.2315, 12.2621}}, color = {0, 0, 191}));
        connect(land_fertility, Land_Fertility.y1) annotation(
          Line(visible = true, points = {{110.0, -40.0}, {90.0, -40.0}, {90.0, -9.4368}, {14.6021, -9.4368}}, color = {0, 0, 191}));
        connect(Land_Fert_Deg.u1, Land_Fertility.y2) annotation(
          Line(visible = true, points = {{33.0, -60.0}, {13.1021, -60.0}, {13.1021, -27.4368}}, color = {0, 0, 191}));
        connect(Land_Fert_Reg.u2, Land_Fertility.y4) annotation(
          Line(visible = true, origin = {10.2306, 18.3444}, points = {{-41.5362, -74.7138}, {-41.5362, -86.3423}, {-19.6286, -86.3423}, {-19.6286, -45.7812}}, color = {0, 0, 191}));
        connect(Land_Fertility.u2, Land_Fert_Degr.y) annotation(
          Line(visible = true, origin = {23.713, -22.4934}, points = {{-5.361, 4.8066}, {-1.713, 4.8066}, {-1.713, -4.8066}, {8.787, -4.8066}}, color = {95, 0, 191}));
        connect(Land_Fert_Regen.y1, Land_Fertility.u1) annotation(
          Line(visible = true, origin = {-18.4374, -17.7309}, points = {{-9.3682, -0.0441}, {2.7894, -0.0441}, {2.7894, 0.0441}, {3.7894, 0.0441}}, color = {95, 0, 191}));
        connect(Land_Fert_Degr_Rt.y, Land_Fert_Deg.u2) annotation(
          Line(visible = true, points = {{62.9556, -90.0}, {80.0, -90.0}, {80.0, -60.0}, {47.0, -60.0}}, color = {0, 0, 191}));
        connect(Land_Fert_Deg.y, Land_Fert_Degr.u) annotation(
          Line(visible = true, origin = {40.0, -48.025}, points = {{0.0, -4.975}, {0.0, 4.975}}, color = {0, 0, 191}));
        connect(Land_Fert_Degr.y1, Sink1.MassInPort1) annotation(
          Line(visible = true, origin = {49.0269, -27.3}, points = {{-1.5269, 0.0}, {-1.5269, 0.0}, {3.0537, 0.0}}, color = {95, 0, 191}));
        connect(Land_Fert_Reg.y, Land_Fert_Regen.u) annotation(
          Line(visible = true, origin = {-35.3056, -35.9472}, points = {{0.0, -2.4222}, {0.0, 2.4222}}, color = {0, 0, 191}));
        connect(Source1.MassInPort1, Land_Fert_Regen.y) annotation(
          Line(visible = true, origin = {-49.0306, -17.775}, points = {{-6.225, 0.0}, {6.225, 0.0}}, color = {95, 0, 191}));
        connect(yield_tech_LYTD, Yield_Tech_LYTD.y2) annotation(
          Line(visible = true, points = {{110.0, 40.0}, {66.25, 40.0}, {66.25, 60.25}}, color = {0, 0, 191}));
        connect(Yield_Tech_Chg_Rt.u2, Yield_Tech_LYTD.y4) annotation(
          Line(visible = true, points = {{20.1257, 37.8312}, {20.0, 20.0}, {44.25, 20.0}, {43.75, 60.25}}, color = {0, 0, 191}));
        connect(Yield_Tech_Chg_Rt_LYTDR.y1, Yield_Tech_LYTD.u1) annotation(
          Line(visible = true, origin = {33.2458, 73.8875}, points = {{-9.7625, 3.8875}, {2.2542, 3.8875}, {2.2542, -3.8875}, {5.2542, -3.8875}}, color = {95, 0, 191}));
        connect(Source2.MassInPort1, Yield_Tech_Chg_Rt_LYTDR.y) annotation(
          Line(visible = true, origin = {-4.2139, 77.775}, points = {{-12.6972, 0.0}, {12.6972, 0.0}}, color = {95, 0, 191}));
        connect(Yield_Tech_Chg_Rt.y, Yield_Tech_Chg_Rt_LYTDR.u) annotation(
          Line(visible = true, points = {{16.1257, 55.8312}, {15.9833, 62.025}}, color = {0, 0, 191}));
        connect(food_ratio, Add1.u2) annotation(
          Line(points = {{-110.0, 60.0}, {-90.0, 60.0}, {-90.0, 14.0}, {-68.1556, 14.0}}, color = {0, 0, 191}, visible = true));
        connect(Add1.u1, Des_Food_Ratio_DFR.y) annotation(
          Line(points = {{3.8444, -13.513}, {-1.9222, -13.513}, {-1.9222, 27.0259}}, color = {0, 0, 191}, visible = true, origin = {-72.0, 39.513}));
        connect(Add1.y, P_Yield_Tech_Chg_Mlt_LYCM.u) annotation(
          Line(points = {{-8.5778, 0.0}, {8.5778, 0.0}}, color = {0, 0, 191}, visible = true, origin = {-36.5778, 20.0}));
        connect(Yield_Tech_Chg_Rt.u1, P_Yield_Tech_Chg_Mlt_LYCM.y) annotation(
          Line(points = {{7.0419, 11.8875}, {7.0419, -5.9437}, {-14.0838, -5.9437}}, color = {0, 0, 191}, visible = true, origin = {5.0838, 25.9437}));
        connect(Land_Fert_Degr_Rt.u, ppoll_index) annotation(
          Line(points = {{43.9556, -90.0}, {-90.0, -90.0}, {-90.0, -50.0}, {-110.0, -50.0}}, color = {0, 0, 191}, visible = true));
        annotation(
          Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics),
          Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, fillColor = {170, 255, 170}, fillPattern = FillPattern.Solid, lineThickness = 1.0, extent = {{-100.0, -100.0}, {100.0, 100.0}}, radius = 0.5), Text(visible = true, origin = {0.0, 30.0}, fillPattern = FillPattern.Solid, extent = {{-47.3724, -36.6918}, {47.3724, 36.6918}}, textString = "Land", fontSize = 102.0, fontName = "Arial"), Text(visible = true, origin = {0.0, -30.0}, fillPattern = FillPattern.Solid, extent = {{-65.0807, -36.6918}, {65.0807, 36.6918}}, textString = "Fertility", fontSize = 102.0, fontName = "Arial")}),
          Documentation(info = "<html>
This model computes the land fertility as a function of its utilization.  Land can be overused.  If that happens, the fertility of the land shrinks.  This is likely to happen as the overall world population continues to climb. <p>
 
The land fertility is measured in kilograms of equivalent vegetable food per hectare and year.  Arable land can be used to either grow vegetable food directly, or alternatively, to raise animals that then enter the human food chain.  Yet it takes more land per human to raise animals than to grow vegetable food.  For this reason, it is meaningful to convert proteins obtained from eating meat to equivalent units of vegetable food. <p>
 
Notice that this model uses two different types of rate models.  Whereas the yield technology rate is a so-called bi-flow, i.e., it can assume both positive and negative values leading to a change of flow direction, the land fertility integrator uses uni-flows, i.e., flows that are allowed to flow in the indicated direction only.
</html>", revisions = ""));
      end Land_Fertility;