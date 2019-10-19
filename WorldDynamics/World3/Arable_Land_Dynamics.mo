      block Arable_Land_Dynamics "Arable land dynamics"
        parameter Real arable_land_init(unit = "hectare") = 900000000.0 "Initial arable land";
        parameter Real avg_life_land_norm(unit = "yr") = 1000 "Normal life span of land";
        parameter Real inherent_land_fert(unit = "kg/(hectare.yr)") = 600 "Inherent land fertility";
        parameter Real pot_arable_land_init(unit = "hectare") = 2300000000.0 "Initial potential arable land";
        parameter Real pot_arable_land_tot(unit = "hectare") = 3200000000.0 "Total potential arable land";
        parameter Real social_discount(unit = "1/yr") = 0.07 "Social discount";
        parameter Real t_land_life_time(unit = "yr") = 4000 "Land life time";
        parameter Real urban_ind_land_init(unit = "hectare") = 8200000.0 "Initial urban and industrial land";
        parameter Real urb_ind_land_dev_time(unit = "yr") = 10 "Urban and industrial land development time";
        SystemDynamics.Rates.RRate Land_Devel_Rt "p.289 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-27.0, 0.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = 0)));
        SystemDynamics.Levels.Level2b Arable_Land(x0 = arable_land_init) "p.279 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {35.0, 0.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = 0)));
        SystemDynamics.Rates.RRate Land_Rem_Urb_Ind_Use "p.322 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {106.0, 6.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = 0)));
        SystemDynamics.Rates.RRate Land_Erosion_Rt "p.318 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {65.0, -40.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = 90)));
        SystemDynamics.Sources.Sink sink annotation(
          Placement(visible = true, transformation(origin = {65.0, -70.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -90)));
        SystemDynamics.Levels.Level1b Pot_Arable_Land(x0 = pot_arable_land_init) "p.279 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-82.5489, 0.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = 0)));
        SystemDynamics.Levels.Level1a Urban_Ind_Land(x0 = urban_ind_land_init) "p.322 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {164.0, 6.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Utilities.Land_Devel_Rt Land_Dev_Rt "p.289 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-27.0, -38.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -270)));
        SystemDynamics.WorldDynamics.World3.Utilities.Land_Rem_Urb_Ind_Use Land_Rem_UI_Use(urb_ind_land_dev_time = urb_ind_land_dev_time) "p.322 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {104.0827, -40.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -270)));
        Modelica.Blocks.Math.Division Land_Er_Rt "p.318 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {30.0, -40.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        Modelica.Blocks.Math.Gain Avg_Life_Land(k = avg_life_land_norm) "p.316 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {10.0, -73.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -90)));
        SystemDynamics.Functions.Tabular Dev_Cost_Per_Hect(x_vals = 0.0:0.1:1.0, y_vals = {100000, 7400, 5200, 3500, 2400, 1500, 750, 300, 150, 75, 50}) "p.291 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-78.0, 80.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        Modelica.Blocks.Math.Gain Gain1(k = 1 / pot_arable_land_tot) "p.291 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-130.0, 80.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Utilities.Marg_Prod_Land_Dev Marg_Prod_Land_Dev(social_discount = social_discount) "p.312 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-18.0827, 83.8496}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular Fr_Inp_Al_Land_Dev(x_vals = 0.0:0.25:2.0, y_vals = {0.0, 0.05, 0.15, 0.3, 0.5, 0.7, 0.85, 0.95, 1.0}) "p.311 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {67.0, 78.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        Modelica.Blocks.Math.Division Div1 "p.311 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {30.0, 78.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        Modelica.Blocks.Math.Gain Land_Fr_Cult(k = 1 / pot_arable_land_tot) "p.278 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {35.0, 40.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Prod_2 Urb_Ind_Land_Req "p.321 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {100.0, -110.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular Urb_Ind_Land_PC(x_vals = 0:200:1600, y_vals = {0.005, 0.008, 0.015, 0.025, 0.04, 0.055, 0.07, 0.08, 0.09}) "p.321 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {60.0, -110.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Utilities.S_Land_Life_Mlt_Yield S_Land_Life_Mlt_Yield(t_land_life_time = t_land_life_time) "p.317 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-34.0, -98.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular P_Land_Life_Mlt_Yield_1(y_vals = {1.2, 1.0, 0.63, 0.36, 0.16, 0.055, 0.04, 0.025, 0.015, 0.01, 0.01}, x_vals = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 50}) "p.317 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-100.0, -76.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular P_Land_Life_Mlt_Yield_2(y_vals = {1.2, 1.0, 0.63, 0.36, 0.29, 0.26, 0.24, 0.22, 0.21, 0.2, 0.2}, x_vals = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 50}) "p.318 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-100.0, -104.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        Modelica.Blocks.Math.Gain Gain2(k = 1 / inherent_land_fert) "p.317 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-157.0, -90.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassInPort land_yield(unit = "kg/(hectare.yr)") "Land yield" annotation(
          Placement(visible = true, transformation(origin = {-210.0, 110.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-110.0, 80.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassInPort marg_prod_agr_inp(unit = "kg/dollar") "Development of marginally producing land" annotation(
          Placement(visible = true, transformation(origin = {-210.0, 50.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-110.0, 40.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassInPort population "Population" annotation(
          Placement(visible = true, transformation(origin = {-210.0, -130.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-110.0, -80.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassInPort ind_out_pc "Per capita annual industrial output" annotation(
          Placement(visible = true, transformation(origin = {-210.0, -70.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-110.0, -40.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassInPort tot_agric_invest(unit = "dollar/yr") "Total investment in the agricultural sector" annotation(
          Placement(visible = true, transformation(origin = {-210.0, -10.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-110.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassOutPort arable_land(unit = "hectare") "Arable land" annotation(
          Placement(visible = true, transformation(origin = {210.0, -10.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {110.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassOutPort urban_ind_land(unit = "hectare") "Land occupied by human dwellings and industry" annotation(
          Placement(visible = true, transformation(origin = {210.0, -70.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {110.0, -50.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassOutPort fr_inp_al_land_dev "Fraction of capital invested in agriculture allocated to the devlopment of arable land" annotation(
          Placement(visible = true, transformation(origin = {210.0, 50.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {110.0, 50.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      equation
        connect(Fr_Inp_Al_Land_Dev.y, fr_inp_al_land_dev) annotation(
          Line(visible = true, points = {{78.0, 78.0}, {180.0, 78.0}, {180.0, 50.0}, {210.0, 50.0}}, color = {0, 0, 191}));
        connect(Fr_Inp_Al_Land_Dev.u, Div1.y) annotation(
          Line(visible = true, origin = {50.0, 78.0}, points = {{9.0, 0.0}, {-9.0, 0.0}}, color = {0, 0, 191}));
        connect(Fr_Inp_Al_Land_Dev.y, Land_Dev_Rt.u2) annotation(
          Line(visible = true, points = {{78.0, 78.0}, {100.0, 78.0}, {100.0, 60.0}, {-8.0, 60.0}, {-8.0, -60.0}, {-27.0, -60.0}, {-27.0, -47.0}}, color = {0, 0, 191}));
        connect(Div1.u2, marg_prod_agr_inp) annotation(
          Line(visible = true, points = {{18.0, 72.0}, {-20.0, 72.0}, {-20.0, 50.0}, {-210.0, 50.0}}, color = {0, 0, 191}));
        connect(Marg_Prod_Land_Dev.y, Div1.u1) annotation(
          Line(visible = true, origin = {9.7293, 83.9248}, points = {{-18.812, -0.0752}, {5.2707, -0.0752}, {5.2707, 0.0752}, {8.2707, 0.0752}}, color = {0, 0, 191}));
        connect(Marg_Prod_Land_Dev.u1, land_yield) annotation(
          Line(visible = true, points = {{-27.0827, 87.8496}, {-46.0, 87.8496}, {-46.0, 110.0}, {-210.0, 110.0}}, color = {0, 0, 191}));
        connect(Dev_Cost_Per_Hect.y, Marg_Prod_Land_Dev.u2) annotation(
          Line(visible = true, origin = {-39.062, 79.9248}, points = {{-27.938, 0.0752}, {7.9793, 0.0752}, {7.9793, -0.0752}, {11.9793, -0.0752}}, color = {0, 0, 191}));
        connect(Gain1.y, Dev_Cost_Per_Hect.u) annotation(
          Line(visible = true, origin = {-102.5, 80.0}, points = {{-16.5, 0.0}, {16.5, 0.0}}, color = {0, 0, 191}));
        connect(Dev_Cost_Per_Hect.y, Land_Dev_Rt.u1) annotation(
          Line(visible = true, points = {{-67.0, 80.0}, {-46.0, 80.0}, {-46.0, -60.0}, {-33.0, -60.0}, {-33.0, -47.0}}, color = {0, 0, 191}));
        connect(Gain1.u, Pot_Arable_Land.y) annotation(
          Line(visible = true, points = {{-142.0, 80.0}, {-170.0, 80.0}, {-170.0, 8.25}, {-103.5326, 8.25}, {-95.2989, 8.25}}, color = {0, 0, 191}));
        connect(Land_Fr_Cult.u, Arable_Land.y) annotation(
          Line(visible = true, points = {{23.0, 40.0}, {0.0, 40.0}, {0.0, 8.25}, {22.25, 8.25}}, color = {0, 0, 191}));
        connect(arable_land, Arable_Land.y1) annotation(
          Line(visible = true, points = {{210.0, -10.0}, {190.0, -10.0}, {190.0, 30.0}, {70.0, 30.0}, {70.0, -17.6389}, {46.25, -17.6389}, {46.25, -9.75}}, color = {0, 0, 191}));
        connect(Land_Er_Rt.u1, Arable_Land.y2) annotation(
          Line(visible = true, points = {{18.0, -34.0}, {10.0, -34.0}, {10.0, -18.0223}, {35.0, -18.0223}, {35.0, -9.75}}, color = {0, 0, 191}));
        connect(Land_Rem_Urb_Ind_Use.y, Arable_Land.u2) annotation(
          Line(visible = true, points = {{98.5, 6.0}, {53.8, 6.0}, {51.5, 6.0}}, color = {95, 0, 191}));
        connect(Land_Erosion_Rt.y, Arable_Land.u3) annotation(
          Line(visible = true, points = {{65.0, -47.5}, {65.0, -6.4}, {51.5, -6.0}}, color = {95, 0, 191}));
        connect(Land_Devel_Rt.y1, Arable_Land.u1) annotation(
          Line(visible = true, points = {{-19.5, 0.0}, {-10.0, 0.0}, {-10.0, 0.0}, {18.5, 0.0}}, color = {95, 0, 191}));
        connect(Land_Dev_Rt.y, Land_Devel_Rt.u) annotation(
          Line(visible = true, origin = {-27.0, -22.375}, points = {{0.0, -6.625}, {0.0, 6.625}}, color = {0, 0, 191}));
        connect(Pot_Arable_Land.u1, Land_Devel_Rt.y) annotation(
          Line(visible = true, points = {{-66.0489, 0.0}, {-50.0, 0.0}, {-50.0, 0.0}, {-34.5, 0.0}}, color = {95, 0, 191}));
        connect(P_Land_Life_Mlt_Yield_1.y, S_Land_Life_Mlt_Yield.u1) annotation(
          Line(visible = true, points = {{-89.0, -76.0}, {-64.0, -76.0}, {-64.0, -92.0}, {-64.0, -94.0}, {-60.0, -94.0}, {-43.0, -94.0}}, color = {0, 0, 191}));
        connect(P_Land_Life_Mlt_Yield_2.y, S_Land_Life_Mlt_Yield.u2) annotation(
          Line(visible = true, points = {{-89.0, -104.0}, {-64.0, -104.0}, {-64.0, -102.0}, {-43.0, -102.0}}, color = {0, 0, 191}));
        connect(Gain2.u, land_yield) annotation(
          Line(visible = true, points = {{-169.0, -90.0}, {-186.0, -90.0}, {-186.0, 110.0}, {-210.0, 110.0}}, color = {0, 0, 191}));
        connect(Gain2.y, P_Land_Life_Mlt_Yield_2.u) annotation(
          Line(visible = true, points = {{-146.0, -90.0}, {-130.0, -90.0}, {-130.0, -104.0}, {-108.0, -104.0}}, color = {0, 0, 191}));
        connect(Gain2.y, P_Land_Life_Mlt_Yield_1.u) annotation(
          Line(visible = true, points = {{-146.0, -90.0}, {-130.0, -90.0}, {-130.0, -76.0}, {-108.0, -76.0}}, color = {0, 0, 191}));
        connect(S_Land_Life_Mlt_Yield.y, Avg_Life_Land.u) annotation(
          Line(visible = true, points = {{-25.0, -98.0}, {10.0, -98.0}, {10.0, -61.0}}, color = {0, 0, 191}));
        connect(Urb_Ind_Land_PC.u, ind_out_pc) annotation(
          Line(visible = true, points = {{52.0, -110.0}, {20.0, -110.0}, {20.0, -120.0}, {-190.0, -120.0}, {-190.0, -70.0}, {-210.0, -70.0}}, color = {0, 0, 191}));
        connect(Urb_Ind_Land_PC.y, Urb_Ind_Land_Req.u1) annotation(
          Line(visible = true, origin = {82.0, -110.0}, points = {{-11.0, 0.0}, {11.0, 0.0}}, color = {0, 0, 191}));
        connect(Urb_Ind_Land_Req.u2, population) annotation(
          Line(visible = true, points = {{107.0, -110.0}, {120.0, -110.0}, {120.0, -130.0}, {-210.0, -130.0}}, color = {0, 0, 191}));
        connect(Urb_Ind_Land_Req.y, Land_Rem_UI_Use.u1) annotation(
          Line(visible = true, points = {{100.0, -103.0}, {100.0, -54.4}, {100.0827, -49.0}}, color = {0, 0, 191}));
        connect(sink.MassInPort1, Land_Erosion_Rt.y1) annotation(
          Line(visible = true, points = {{65.0, -59.0}, {65.0, -32.5}}, color = {95, 0, 191}));
        connect(Land_Er_Rt.u2, Avg_Life_Land.y) annotation(
          Line(visible = true, points = {{18.0, -46.0}, {10.0, -46.0}, {10.0, -84.0}}, color = {0, 0, 191}));
        connect(urban_ind_land, Urban_Ind_Land.y2) annotation(
          Line(visible = true, points = {{210.0, -70.0}, {175.25, -70.0}, {175.25, -3.75}}, color = {0, 0, 191}));
        connect(Land_Rem_UI_Use.u2, Urban_Ind_Land.y4) annotation(
          Line(visible = true, points = {{108.0827, -49.0}, {108.0827, -70.0}, {152.75, -70.0}, {152.75, -3.75}}, color = {0, 0, 191}));
        connect(Urban_Ind_Land.u1, Land_Rem_Urb_Ind_Use.y1) annotation(
          Line(visible = true, origin = {130.5, 6.0}, points = {{17.0, 0.0}, {-17.0, 0.0}}, color = {95, 0, 191}));
        connect(Land_Rem_UI_Use.y, Land_Rem_Urb_Ind_Use.u) annotation(
          Line(visible = true, origin = {105.0414, -16.5625}, points = {{-0.9586, -14.4375}, {-0.9586, 3.8125}, {0.9586, 3.8125}, {0.9586, 6.8125}}, color = {0, 0, 191}));
        connect(Land_Er_Rt.y, Land_Erosion_Rt.u) annotation(
          Line(visible = true, points = {{41.0, -40.0}, {80.75, -40.0}}, color = {0, 0, 191}));
        connect(tot_agric_invest, Land_Dev_Rt.u3) annotation(
          Line(visible = true, points = {{-210.0, -10.0}, {-170.0, -10.0}, {-170.0, -50.0}, {-60.0, -50.0}, {-60.0, -70.0}, {-21.0, -70.0}, {-21.0, -47.0}}, color = {0, 0, 191}));
        annotation(
          Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, fillColor = {170, 255, 170}, fillPattern = FillPattern.Solid, lineThickness = 1.0, extent = {{-100.0, -100.0}, {100.0, 100.0}}, radius = 0.5), Text(visible = true, origin = {0.0, 50.0}, fillPattern = FillPattern.Solid, extent = {{-73.6862, -36.6918}, {73.6862, 36.6918}}, textString = "Arable", fontSize = 102.0, fontName = "Arial"), Text(visible = true, origin = {0.0, -50.0}, fillPattern = FillPattern.Solid, extent = {{-87.9194, -20.8986}, {87.9194, 20.8986}}, textString = "Dynamics", fontSize = 102.0, fontName = "Arial"), Text(visible = true, fillPattern = FillPattern.Solid, extent = {{-72.1931, -36.6918}, {72.1931, 36.6918}}, textString = "Land", fontSize = 102.0, fontName = "Arial")}),
          Diagram(coordinateSystem(extent = {{-200.0, -160.0}, {200.0, 140.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{-47.0, 79.0}, {-45.0, 81.0}}), Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{-131.0, -91.0}, {-129.0, -89.0}}), Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{-187.0, 109.0}, {-185.0, 111.0}}), Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{99.0, 77.0}, {101.0, 79.0}})}),
          Documentation(info = "<html>
This model quantifies the land that is being used to produce food, i.e., the arable land.  The model contains three state variables, representing the potential arable land, i.e., land that could be developed to grow crop, but so far hasn't been developed; the arable land that is currently being used for agriculture; and finally, the land that is being used for urban development and industry (including mining).  Some of the potential arable land is getting developed over time, whereas some of the arable land is being lost either to urban development or to erosion. <p>
 
The arable land is measured in units of hectares.
</html>"));
      end Arable_Land_Dynamics;