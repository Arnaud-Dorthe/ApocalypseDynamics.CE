      block Human_Welfare_Index "Human welfare index"
        SystemDynamics.Interfaces.MassInPort life_expectancy(unit = "yr") "Average life expectancy of human population" annotation(
          Placement(visible = true, transformation(origin = {-210.0, 60.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-110.0, 50.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassInPort ind_out_pc(unit = "dollar/yr") "Per capita annual industrial output" annotation(
          Placement(visible = true, transformation(origin = {-210.0, -80.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-110.0, -50.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular Life_Expectancy_Index(x_vals = {0, 25, 35, 45, 55, 65, 75, 85, 95}, y_vals = {0, 0, 0.16, 0.33, 0.5, 0.67, 0.84, 1, 1}) annotation(
          Placement(visible = true, transformation(origin = {-140.5, 60.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular GDP_Per_Capita(x_vals = 0:200:1000, y_vals = {120, 600, 1200, 1800, 2500, 3200}) annotation(
          Placement(visible = true, transformation(origin = {-140.5, -80.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular Education_Index(x_vals = 0:1000:7000, y_vals = {0, 0.81, 0.88, 0.92, 0.95, 0.98, 0.99, 1}) annotation(
          Placement(visible = true, transformation(origin = {-40.5, -10.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Utilities.GDP_Index GDP_Index annotation(
          Placement(visible = true, transformation(origin = {-48.1039, -80.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Utilities.HWI_Human_Welfare_Index HWI_Human_Welfare_Index annotation(
          Placement(visible = true, transformation(origin = {43.7138, -10.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassOutPort hwi_human_welfare_index "Human welfare index" annotation(
          Placement(visible = true, transformation(origin = {210.0, -10.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {110.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      equation
        connect(Education_Index.y, HWI_Human_Welfare_Index.u2) annotation(
          Line(visible = true, points = {{-29.5, -10.0}, {3.625, -10.0}, {3.625, -10.0}, {34.7138, -10.0}}, color = {0, 0, 191}));
        connect(GDP_Per_Capita.y, Education_Index.u) annotation(
          Line(visible = true, points = {{-129.5, -80.0}, {-90.0, -80.0}, {-90.0, -10.0}, {-48.5, -10.0}}, color = {0, 0, 191}));
        connect(GDP_Index.u, GDP_Per_Capita.y) annotation(
          Line(visible = true, origin = {-93.302, -80.0}, points = {{36.1981, 0.0}, {-36.198, 0.0}}, color = {0, 0, 191}));
        connect(GDP_Per_Capita.u, ind_out_pc) annotation(
          Line(visible = true, origin = {-179.25, -80.0}, points = {{30.75, 0.0}, {-30.75, 0.0}}, color = {0, 0, 191}));
        connect(Life_Expectancy_Index.y, HWI_Human_Welfare_Index.u1) annotation(
          Line(visible = true, points = {{-129.5, 60.0}, {0.0, 60.0}, {0.0, -4.0}, {34.7138, -4.0}}, color = {0, 0, 191}));
        connect(Life_Expectancy_Index.u, life_expectancy) annotation(
          Line(visible = true, origin = {-179.25, 60.0}, points = {{30.75, 0.0}, {-30.75, 0.0}}, color = {0, 0, 191}));
        connect(GDP_Index.y, HWI_Human_Welfare_Index.u3) annotation(
          Line(points = {{-39.1039, -80.0}, {0.0, -80.0}, {0.0, -16.0}, {34.7138, -16.0}}, color = {0, 0, 191}, visible = true));
        connect(HWI_Human_Welfare_Index.y, hwi_human_welfare_index) annotation(
          Line(points = {{80.5, -10.0}, {210.0, -10.0}}, color = {0, 0, 191}, visible = true));
        annotation(
          Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, fillColor = {170, 255, 170}, fillPattern = FillPattern.Solid, lineThickness = 1.0, extent = {{-100.0, -100.0}, {100.0, 100.0}}, radius = 0.5), Text(visible = true, origin = {0.0, 50.0}, fillPattern = FillPattern.Solid, extent = {{-63.6862, -26.9167}, {63.6862, 26.9167}}, textString = "Human", fontSize = 102.0, fontName = "Arial"), Text(visible = true, origin = {0.0, -50.0}, fillPattern = FillPattern.Solid, extent = {{-62.9121, -20.8986}, {62.9121, 20.8986}}, textString = "Index", fontSize = 102.0, fontName = "Arial"), Text(visible = true, fillPattern = FillPattern.Solid, extent = {{-62.5202, -26.0486}, {62.5202, 26.0486}}, textString = "Welfare", fontSize = 102.0, fontName = "Arial")}),
          Diagram(coordinateSystem(extent = {{-200.0, -160.0}, {200.0, 140.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{-91.0, -81.0}, {-89.0, -79.0}})}),
          Documentation(info = "<html>
The <a href=\"http://links.jstor.org/sici?sici=0004-5608(198812)78%3A4%3C580%3AWVIHWA%3E2.0.CO%3B2-A\">human welfare index</a> is a measure of how well humans are living on average.  It is similar in concept to the <b>quality of life</b> variable introduced by Forrester in his <font color=red><b>WORLD2</b></font> model.  Yet, the human welfare index has been better standardized, and therefore, has replaced the former <b>quality of life</b> variable in the enhanced <font color=red><b>WORLD3</b></font> model. <p>
 
The human welfare index is dimensionless.
</html>"));
      end Human_Welfare_Index;