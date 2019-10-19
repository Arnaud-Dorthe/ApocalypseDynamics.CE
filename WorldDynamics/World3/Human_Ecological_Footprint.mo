      block Human_Ecological_Footprint "Ecological footprint"
        SystemDynamics.Interfaces.MassInPort urban_ind_land(unit = "hectare") "Land occupied by human dwellings and industry" annotation(
          Placement(visible = true, transformation(origin = {-110.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-110.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassInPort arable_land(unit = "hectare") "Arable land" annotation(
          Placement(visible = true, transformation(origin = {-110.0, 64.2333}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-110.0, 50.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassInPort ppoll_gen_rt(unit = "1/yr") "Persistent pollution generation rate" annotation(
          Placement(visible = true, transformation(origin = {-110.0, -58.4806}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-110.0, -50.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        Modelica.Blocks.Math.Gain Arable_Land_In_Gha(k = 0.000000001) annotation(
          Placement(visible = true, transformation(origin = {-31.0, 64.2333}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        Modelica.Blocks.Math.Gain Urban_Land_In_Gha(k = 0.000000001) annotation(
          Placement(visible = true, transformation(origin = {-27.1694, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Prod_2 Absorption_Land_In_Gha annotation(
          Placement(visible = true, transformation(origin = {-20.0, -57.775}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Const Gha_Per_Unit_Of_Pollution(k = 0.000000004) annotation(
          Placement(visible = true, transformation(origin = {68.0, -68.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Utilities.HEF_Human_Ecological_Footprint HEF_Human_Ecological_Footprint annotation(
          Placement(visible = true, transformation(origin = {20.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassOutPort hef_human_ecological_footprint(unit = "hectare") "Ecological footprint" annotation(
          Placement(visible = true, transformation(origin = {110.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {110.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      equation
        connect(Gha_Per_Unit_Of_Pollution.y, Absorption_Land_In_Gha.u2) annotation(
          Line(visible = true, origin = {34.7556, -45.43}, points = {{33.2444, -15.57}, {33.2444, 12.43}, {-10.7667, 12.43}, {-10.7667, -12.345}, {-47.7556, -12.345}}, color = {0, 0, 191}));
        connect(Absorption_Land_In_Gha.y, HEF_Human_Ecological_Footprint.u3) annotation(
          Line(visible = true, points = {{-20.0, -50.775}, {-20.0, -40.0}, {0.0, -40.0}, {0.0, -6.0}, {11.0, -6.0}}, color = {0, 0, 191}));
        connect(Absorption_Land_In_Gha.u1, ppoll_gen_rt) annotation(
          Line(visible = true, origin = {-82.6375, -58.1278}, points = {{55.6375, 0.3528}, {-14.1375, 0.3528}, {-14.1375, -0.3528}, {-27.3625, -0.3528}}, color = {0, 0, 191}));
        connect(Urban_Land_In_Gha.y, HEF_Human_Ecological_Footprint.u2) annotation(
          Line(visible = true, origin = {-2.5847, 0.0}, points = {{-13.5847, 0.0}, {13.5847, 0.0}}, color = {0, 0, 191}));
        connect(Urban_Land_In_Gha.u, urban_ind_land) annotation(
          Line(visible = true, origin = {-74.5847, 0.0}, points = {{35.4153, 0.0}, {-35.4153, 0.0}}, color = {0, 0, 191}));
        connect(Arable_Land_In_Gha.y, HEF_Human_Ecological_Footprint.u1) annotation(
          Line(visible = true, origin = {80.0, 3.8806}, points = {{-100.0, 60.3527}, {-80.0, 60.0}, {-80.0, 2.0}, {-69.0, 2.1194}}, color = {0, 0, 191}));
        connect(arable_land, Arable_Land_In_Gha.u) annotation(
          Line(visible = true, origin = {-76.5, 64.2333}, points = {{-33.5, 0.0}, {33.5, 0.0}}, color = {0, 0, 191}));
        connect(HEF_Human_Ecological_Footprint.y, hef_human_ecological_footprint) annotation(
          Line(points = {{-40.5, 0.0}, {40.5, 0.0}}, color = {0, 0, 191}, visible = true, origin = {69.5, 0.0}));
        annotation(
          Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, fillColor = {170, 255, 170}, fillPattern = FillPattern.Solid, lineThickness = 1.0, extent = {{-100.0, -100.0}, {100.0, 100.0}}, radius = 0.5), Text(visible = true, origin = {0.0, 50.0}, fillPattern = FillPattern.Solid, extent = {{-78.6862, -24.4985}, {78.6862, 24.4985}}, textString = "Human", fontSize = 102.0, fontName = "Arial"), Text(visible = true, origin = {1.7338, -49.1014}, fillPattern = FillPattern.Solid, extent = {{-96.4561, -20.8986}, {96.4561, 20.8986}}, textString = "Footprint", fontSize = 102.0, fontName = "Arial"), Text(visible = true, fillPattern = FillPattern.Solid, extent = {{-88.0175, -25.4584}, {88.0175, 25.4584}}, textString = "Ecological", fontSize = 102.0, fontName = "Arial")}),
          Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics),
          Documentation(info = "<html>
The <a href=\"http://www.footprintnetwork.org/gfn_sub.php?content=footprint_overview\">ecological footprint</a> is a concept developed by <a href=\"http://www.footprintnetwork.org/gfn_sub.php?content=whoweare\">Mathis Wackernagel</a> and his co-workers.  It attempts to quantify the percentage of the planet's carrying capacity being used up by humanity at any given point in time. Wackernagel showed that, since the 1980s, humanity is spending more resources per time unit than the planet can regenerate in a sustainable fashion. <p>
 
The human ecological footprint is measured in hectares per person.
</html>"));
      end Human_Ecological_Footprint;