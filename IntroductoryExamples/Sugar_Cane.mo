    model Sugar_Cane "Model of osmosis process in sugar cane"
      output Real Water_conc_in "Water concentration inside sugar cane";
      output Real Water_conc_out "Water concentration outside sugar cane";
      output Real Sucr_conc_in "Sugar concentration inside sugar cane";
      output Real Sucr_conc_out "Sugar concentration outside sugar cane";
      output Real Vol_in "Volume inside sugar cane";
      output Real Vol_out "Volume outside sugar cane";
      SystemDynamics.Sources.Source Source1 annotation(
        Placement(visible = true, transformation(origin = {128.0, 120.0}, extent = {{10.0, -10.0}, {-10.0, 10.0}}, rotation = 0)));
      SystemDynamics.Rates.Rate_1 Sucr_Gen annotation(
        Placement(visible = true, transformation(origin = {99.0, 120.0}, extent = {{15.0, -16.0}, {-15.0, 16.0}}, rotation = 0)));
      SystemDynamics.Auxiliary.Const C1(k = 0) annotation(
        Placement(visible = true, transformation(origin = {99.0, 79.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = 0)));
      SystemDynamics.Levels.Level Sucrose_Inside(x0 = 1) annotation(
        Placement(visible = true, transformation(origin = {58.0, 120.0}, extent = {{20.0, -20.0}, {-20.0, 20.0}}, rotation = 0)));
      SystemDynamics.Sources.Sink Sink1 annotation(
        Placement(visible = true, transformation(origin = {-112.0, 120.0}, extent = {{10.0, -10.0}, {-10.0, 10.0}}, rotation = 0)));
      SystemDynamics.Rates.Rate_1 Sucr_Depl annotation(
        Placement(visible = true, transformation(origin = {-85.0, 120.0}, extent = {{15.0, -16.0}, {-15.0, 16.0}}, rotation = 0)));
      SystemDynamics.Levels.Level Sucrose_Outside(x0 = 0) annotation(
        Placement(visible = true, transformation(origin = {-42.0, 120.0}, extent = {{20.0, -20.0}, {-20.0, 20.0}}, rotation = 0)));
      SystemDynamics.Rates.Rate_1 Diffusion annotation(
        Placement(visible = true, transformation(origin = {9.0, 120.0}, extent = {{15.0, -16.0}, {-15.0, 16.0}}, rotation = 0)));
      SystemDynamics.Auxiliary.Const C2(k = 0) annotation(
        Placement(visible = true, transformation(origin = {-85.0, 79.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = 0)));
      SystemDynamics.Sources.Source Source2 annotation(
        Placement(visible = true, transformation(origin = {-112.0, -80.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      SystemDynamics.Rates.Rate_1 Water_Gen annotation(
        Placement(visible = true, transformation(origin = {-81.0, -80.0}, extent = {{-15.0, -16.0}, {15.0, 16.0}}, rotation = 0)));
      SystemDynamics.Auxiliary.Const C3(k = 0) annotation(
        Placement(visible = true, transformation(origin = {-81.0, -121.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = 0)));
      SystemDynamics.Levels.Level Water_Outside(x0 = 4) annotation(
        Placement(visible = true, transformation(origin = {-42.0, -80.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
      SystemDynamics.Rates.Rate_1 Osmosis annotation(
        Placement(visible = true, transformation(origin = {7.0, -80.0}, extent = {{-15.0, -16.0}, {15.0, 16.0}}, rotation = 0)));
      SystemDynamics.Levels.Level Water_Inside(x0 = 1) annotation(
        Placement(visible = true, transformation(origin = {58.0, -80.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
      SystemDynamics.Rates.Rate_1 Water_Depl annotation(
        Placement(visible = true, transformation(origin = {97.0, -80.0}, extent = {{-15.0, -16.0}, {15.0, 16.0}}, rotation = 0)));
      SystemDynamics.Sources.Sink Sink2 annotation(
        Placement(visible = true, transformation(origin = {128.0, -80.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      SystemDynamics.Auxiliary.Const C4(k = 0) annotation(
        Placement(visible = true, transformation(origin = {97.0, -123.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = 0)));
      Modelica.Blocks.Math.Add Vol_Outside annotation(
        Placement(visible = true, transformation(origin = {-112.0, 20.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      Modelica.Blocks.Math.Add Vol_Inside annotation(
        Placement(visible = true, transformation(origin = {128.0, 20.0}, extent = {{10.0, -10.0}, {-10.0, 10.0}}, rotation = 0)));
      Modelica.Blocks.Math.Division Sucr_Conc_Out annotation(
        Placement(visible = true, transformation(origin = {-72.0, 40.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      Modelica.Blocks.Math.Division Water_Conc_Out annotation(
        Placement(visible = true, transformation(origin = {-72.0, 0.0}, extent = {{-10.0, 10.0}, {10.0, -10.0}}, rotation = 0)));
      Modelica.Blocks.Math.Division Sucr_Conc_In annotation(
        Placement(visible = true, transformation(origin = {88.0, 40.0}, extent = {{10.0, -10.0}, {-10.0, 10.0}}, rotation = 0)));
      Modelica.Blocks.Math.Division Water_Conc_In annotation(
        Placement(visible = true, transformation(origin = {88.0, 0.0}, extent = {{10.0, 10.0}, {-10.0, -10.0}}, rotation = 0)));
      SystemDynamics.Auxiliary.Const Perm_H2O(k = 0.5) annotation(
        Placement(visible = true, transformation(origin = {37.0, -139.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = 0)));
      Modelica.Blocks.Math.Add Water_Grad(k2 = -1) annotation(
        Placement(visible = true, transformation(origin = {8.0, -40.0}, extent = {{10.0, -10.0}, {-10.0, 10.0}}, rotation = 0)));
      SystemDynamics.Auxiliary.Prod_2 Prod_2_1 annotation(
        Placement(visible = true, transformation(origin = {7.0, -117.0}, extent = {{-15.0, -13.0}, {15.0, 13.0}}, rotation = 0)));
      Modelica.Blocks.Math.Add Sucr_Grad(k2 = -1) annotation(
        Placement(visible = true, transformation(origin = {8.0, 34.0}, extent = {{10.0, -10.0}, {-10.0, 10.0}}, rotation = 0)));
      SystemDynamics.Auxiliary.Prod_2 Prod_2_2 annotation(
        Placement(visible = true, transformation(origin = {-11.0, 71.0}, extent = {{-15.0, -13.0}, {15.0, 13.0}}, rotation = 0)));
      SystemDynamics.Auxiliary.Gain Perm_Sucr(k = 0.02) annotation(
        Placement(visible = true, transformation(origin = {25.0, 71.0}, extent = {{15.0, -15.0}, {-15.0, 15.0}}, rotation = 0)));
    equation
      connect(C4.y, Water_Depl.u) annotation(
        Line(visible = true, points = {{97.0, -112.5}, {97.0, -105.25}, {97.0, -105.25}, {97.0, -96.8}}, color = {0, 0, 191}));
      connect(C2.y, Sucr_Depl.u) annotation(
        Line(visible = true, points = {{-85.0, 89.5}, {-85.0, 96.75}, {-85.0, 96.75}, {-85.0, 103.2}}, color = {0, 0, 191}));
      connect(Vol_Inside.u2, Water_Inside.y2) annotation(
        Line(visible = true, points = {{140.0, 14.0}, {150.0, 14.0}, {150.0, -140.0}, {73.0, -140.0}, {73.0, -93.0}}, color = {0, 0, 191}));
      connect(Vol_Outside.u2, Water_Outside.y4) annotation(
        Line(visible = true, points = {{-124.0, 14.0}, {-130.0, 14.0}, {-130.0, -140.0}, {-57.0, -140.0}, {-57.0, -93.0}}, color = {0, 0, 191}));
      connect(Vol_Outside.u1, Sucrose_Outside.y1) annotation(
        Line(visible = true, points = {{-124.0, 26.0}, {-130.0, 26.0}, {-130.0, 140.0}, {-68.0, 140.0}, {-68.0, 131.0}, {-59.0, 131.0}}, color = {0, 0, 191}));
      connect(Vol_Inside.u1, Sucrose_Inside.y) annotation(
        Line(visible = true, points = {{140.0, 26.0}, {150.0, 26.0}, {150.0, 140.0}, {80.0, 140.0}, {80.0, 131.0}, {75.0, 131.0}}, color = {0, 0, 191}));
      connect(Sucr_Conc_Out.u1, Sucrose_Outside.y2) annotation(
        Line(visible = true, points = {{-84.0, 46.0}, {-94.0, 46.0}, {-94.0, 60.0}, {-57.0, 60.0}, {-57.0, 107.0}}, color = {0, 0, 191}));
      connect(Vol_Outside.y, Water_Conc_Out.u2) annotation(
        Line(visible = true, points = {{-101.0, 20.0}, {-94.0, 20.0}, {-94.0, 6.0}, {-84.0, 6.0}}, color = {0, 0, 191}));
      connect(Vol_Outside.y, Sucr_Conc_Out.u2) annotation(
        Line(visible = true, points = {{-101.0, 20.0}, {-94.0, 20.0}, {-94.0, 34.0}, {-84.0, 34.0}}, color = {0, 0, 191}));
      connect(Sucr_Conc_Out.y, Sucr_Grad.u2) annotation(
        Line(visible = true, points = {{-61.0, 40.0}, {-40.0, 40.0}, {-40.0, 10.0}, {32.0, 10.0}, {32.0, 28.0}, {20.0, 28.0}}, color = {0, 0, 191}));
      connect(Prod_2_2.y, Diffusion.u) annotation(
        Line(visible = true, points = {{-11.0, 80.1}, {-11.0, 90.0}, {9.0, 90.0}, {9.0, 103.2}}, color = {0, 0, 191}));
      connect(C1.y, Sucr_Gen.u) annotation(
        Line(visible = true, points = {{99.0, 89.5}, {99.0, 95.75}, {99.0, 95.75}, {99.0, 103.2}}, color = {0, 0, 191}));
      connect(Sucr_Conc_In.u1, Sucrose_Inside.y4) annotation(
        Line(visible = true, points = {{100.0, 46.0}, {110.0, 46.0}, {110.0, 60.0}, {73.0, 60.0}, {73.0, 107.0}}, color = {0, 0, 191}));
      connect(Sucr_Conc_In.y, Sucr_Grad.u1) annotation(
        Line(visible = true, points = {{77.0, 40.0}, {20.0, 40.0}}, color = {0, 0, 191}));
      connect(Sucr_Grad.y, Prod_2_2.u1) annotation(
        Line(visible = true, points = {{-3.0, 34.0}, {-30.0, 34.0}, {-30.0, 71.0}, {-21.5, 71.0}}, color = {0, 0, 191}));
      connect(Perm_Sucr.y, Prod_2_2.u2) annotation(
        Line(visible = true, points = {{14.5, 71.0}, {8.25, 71.0}, {8.25, 71.0}, {-0.5, 71.0}}, color = {0, 0, 191}));
      connect(Vol_Inside.y, Perm_Sucr.u) annotation(
        Line(visible = true, points = {{117.0, 20.0}, {60.0, 20.0}, {60.0, 71.0}, {35.5, 71.0}}, color = {0, 0, 191}));
      connect(Vol_Inside.y, Sucr_Conc_In.u2) annotation(
        Line(visible = true, points = {{117.0, 20.0}, {110.0, 20.0}, {110.0, 34.0}, {100.0, 34.0}}, color = {0, 0, 191}));
      connect(Vol_Inside.y, Water_Conc_In.u2) annotation(
        Line(visible = true, points = {{117.0, 20.0}, {110.0, 20.0}, {110.0, 6.0}, {100.0, 6.0}}, color = {0, 0, 191}));
      connect(Water_Conc_In.u1, Water_Inside.y1) annotation(
        Line(visible = true, points = {{100.0, -6.0}, {110.0, -6.0}, {110.0, -50.0}, {80.0, -50.0}, {80.0, -69.0}, {75.0, -69.0}}, color = {0, 0, 191}));
      connect(Water_Conc_In.y, Water_Grad.u2) annotation(
        Line(visible = true, points = {{77.0, 0.0}, {40.0, 0.0}, {40.0, -46.0}, {20.0, -46.0}}, color = {0, 0, 191}));
      connect(Water_Conc_Out.u1, Water_Outside.y) annotation(
        Line(visible = true, points = {{-84.0, -6.0}, {-94.0, -6.0}, {-94.0, -50.0}, {-66.0, -50.0}, {-66.0, -69.0}, {-59.0, -69.0}}, color = {0, 0, 191}));
      connect(Water_Conc_Out.y, Water_Grad.u1) annotation(
        Line(visible = true, points = {{-61.0, 0.0}, {30.0, 0.0}, {30.0, -34.0}, {20.0, -34.0}}, color = {0, 0, 191}));
      connect(Water_Grad.y, Prod_2_1.u1) annotation(
        Line(visible = true, points = {{-3.0, -40.0}, {-10.0, -40.0}, {-10.0, -117.0}, {-3.5, -117.0}}, color = {0, 0, 191}));
      connect(Perm_H2O.y, Prod_2_1.u2) annotation(
        Line(visible = true, points = {{37.0, -128.5}, {37.0, -117.0}, {17.5, -117.0}}, color = {0, 0, 191}));
      connect(Prod_2_1.y, Osmosis.u) annotation(
        Line(visible = true, points = {{7.0, -107.9}, {7.0, -102.95}, {7.0, -102.95}, {7.0, -96.8}}, color = {0, 0, 191}));
      connect(C3.y, Water_Gen.u) annotation(
        Line(visible = true, points = {{-81.0, -110.5}, {-81.0, -104.25}, {-81.0, -104.25}, {-81.0, -96.8}}, color = {0, 0, 191}));
      connect(Source2.MassInPort1, Water_Gen.y) annotation(
        Line(visible = true, points = {{-101.0, -80.0}, {-88.5, -80.0}}, color = {191, 0, 191}));
      connect(Water_Gen.y1, Water_Outside.u1) annotation(
        Line(visible = true, points = {{-73.5, -80.0}, {-64.0, -80.0}}, color = {191, 0, 191}));
      connect(Water_Outside.u2, Osmosis.y) annotation(
        Line(visible = true, points = {{-20.0, -80.0}, {-0.5, -80.0}}, color = {191, 0, 191}));
      connect(Osmosis.y1, Water_Inside.u1) annotation(
        Line(visible = true, points = {{14.5, -80.0}, {36.0, -80.0}}, color = {191, 0, 191}));
      connect(Water_Inside.u2, Water_Depl.y) annotation(
        Line(visible = true, points = {{80.0, -80.0}, {89.5, -80.0}}, color = {191, 0, 191}));
      connect(Water_Depl.y1, Sink2.MassInPort1) annotation(
        Line(visible = true, points = {{104.5, -80.0}, {117.0, -80.0}}, color = {191, 0, 191}));
      connect(Source1.MassInPort1, Sucr_Gen.y) annotation(
        Line(visible = true, points = {{117.0, 120.0}, {106.5, 120.0}}, color = {191, 0, 191}));
      connect(Sucr_Gen.y1, Sucrose_Inside.u1) annotation(
        Line(visible = true, points = {{91.5, 120.0}, {80.0, 120.0}}, color = {191, 0, 191}));
      connect(Sucrose_Inside.u2, Diffusion.y) annotation(
        Line(visible = true, points = {{36.0, 120.0}, {16.5, 120.0}}, color = {191, 0, 191}));
      connect(Diffusion.y1, Sucrose_Outside.u1) annotation(
        Line(visible = true, points = {{1.5, 120.0}, {-20.0, 120.0}}, color = {191, 0, 191}));
      connect(Sucrose_Outside.u2, Sucr_Depl.y) annotation(
        Line(visible = true, points = {{-64.0, 120.0}, {-77.5, 120.0}}, color = {191, 0, 191}));
      connect(Sucr_Depl.y1, Sink1.MassInPort1) annotation(
        Line(visible = true, points = {{-92.5, 120.0}, {-101.0, 120.0}}, color = {191, 0, 191}));
      Water_conc_in = Water_Conc_In.y;
      Water_conc_out = Water_Conc_Out.y;
      Sucr_conc_in = Sucr_Conc_In.y;
      Sucr_conc_out = Sucr_Conc_Out.y;
      Vol_in = Vol_Inside.y;
      Vol_out = Vol_Outside.y;
      annotation(
        Icon(coordinateSystem(extent = {{-140.0, -160.0}, {160.0, 160.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, lineColor = {0, 0, 255}, fillColor = {191, 95, 0}, fillPattern = FillPattern.VerticalCylinder, extent = {{-20.0, -80.0}, {20.0, 100.0}}), Line(visible = true, points = {{-10.0, 50.0}, {-10.0, -8.0}}, color = {0, 0, 255}), Line(visible = true, points = {{-4.0, 30.0}, {-4.0, -28.0}}, color = {0, 0, 255}), Line(visible = true, points = {{10.0, 74.0}, {10.0, 16.0}}, color = {0, 0, 255}), Line(visible = true, points = {{6.0, -2.0}, {6.0, -60.0}}, color = {0, 0, 255}), Rectangle(visible = true, lineColor = {0, 0, 255}, fillColor = {160, 160, 160}, fillPattern = FillPattern.Backward, extent = {{-120.0, -100.0}, {140.0, -80.0}}), Rectangle(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-120.0, -80.0}, {-20.0, 40.0}}), Rectangle(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 255, 255}, fillPattern = FillPattern.Solid, extent = {{20.0, -80.0}, {140.0, 40.0}}), Line(visible = true, points = {{-92.0, 20.0}, {-70.0, 20.0}}, color = {0, 0, 255}), Line(visible = true, points = {{-78.0, 10.0}, {-56.0, 10.0}}, color = {0, 0, 255}), Line(visible = true, points = {{-100.0, -38.0}, {-78.0, -38.0}}, color = {0, 0, 255}), Line(visible = true, points = {{-62.0, -32.0}, {-40.0, -32.0}}, color = {0, 0, 255}), Line(visible = true, points = {{-106.0, -8.0}, {-84.0, -8.0}}, color = {0, 0, 255}), Line(visible = true, points = {{40.0, 14.0}, {62.0, 14.0}}, color = {0, 0, 255}), Line(visible = true, points = {{92.0, -44.0}, {114.0, -44.0}}, color = {0, 0, 255}), Line(visible = true, points = {{40.0, -58.0}, {62.0, -58.0}}, color = {0, 0, 255}), Line(visible = true, points = {{60.0, -38.0}, {82.0, -38.0}}, color = {0, 0, 255}), Line(visible = true, points = {{62.0, -4.0}, {84.0, -4.0}}, color = {0, 0, 255})}),
        Diagram(coordinateSystem(extent = {{-140.0, -160.0}, {160.0, 160.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{-96.0, 18.0}, {-92.0, 22.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{108.0, 18.0}, {112.0, 22.0}})}),
        experiment(StopTime = 20),
        experimentSetupOutput,
        Documentation(info = "<html>
The sugar cane model describes the processes of diffusion and osmosis in a sugar cane plant.  The model was adapted from the STELLA manual. <p>
 
<hr> <p>
 
<b>References:</b> <p>
 
<ol>
<li> Richmond, B., S. Peterson, and P. Vescuso (1987), <i>An Academic User's Guide to STELLA</i>, High Performance Systems, Inc., Lyme, N.H.
</ol> <p>
 
<hr> <p>
 
Simulate the model across 20 time units and plot on three separate graphs the two water concentrations (inside and outside), the two sugar concentrations, and the two volumes: <p>
<img src=\"modelica://SystemDynamics/Resources/Images/Sugar_Cane_1.png\"> <p>
<img src=\"modelica://SystemDynamics/Resources/Images/Sugar_Cane_2.png\"> <p>
<img src=\"modelica://SystemDynamics/Resources/Images/Sugar_Cane_3.png\">
</html>", revisions = ""));
    end Sugar_Cane;