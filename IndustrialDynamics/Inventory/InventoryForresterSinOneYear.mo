      model InventoryForresterSinOneYear "Inventory simulation with sinusoidal orders"
        parameter Real RRRiniTop(unit = "1/wk") = 1000 "Inital value of customer requests at retail";
        parameter Real RRDiniTop(unit = "1/wk") = RRRiniTop "Inital value of requisitions received at distribution";
        parameter Real RRFiniTop(unit = "1/wk") = RRRiniTop "Inital value of requisitions received at factory";
        output Real orders(unit = "1/wk") "Sinusoidal orders";
        output Real factoryFlow(unit = "1/wk") "Manufacturing flow at factory";
        output Real retailStock "Stock of goods in retail";
        output Real distributionStock "Stock of goods in distribution";
        output Real factoryStock "Stock of goods in factory";
        SystemDynamics.IndustrialDynamics.Inventory.Factory Factory1(ALF = 1000 * RRFiniTop, RRFini = RRFiniTop) annotation(
          Placement(visible = true, transformation(origin = {-34.75, 0.25}, extent = {{-12.75, -12.75}, {12.75, 12.75}}, rotation = 0)));
        SystemDynamics.IndustrialDynamics.Inventory.Distribution Distribution1(RRDini = RRDiniTop) annotation(
          Placement(visible = true, transformation(origin = {-4.75, 0.25}, extent = {{-12.75, -12.75}, {12.75, 12.75}}, rotation = 0)));
        SystemDynamics.IndustrialDynamics.Inventory.Retail Retail1(RRRini = RRRiniTop) annotation(
          Placement(visible = true, transformation(origin = {25.25, 0.25}, extent = {{-12.75, -12.75}, {12.75, 12.75}}, rotation = 0)));
        Modelica.Blocks.Sources.Sine Orders(amplitude = 100, freqHz = 1 / 52, offset = 1000) annotation(
          Placement(visible = true, transformation(origin = {0.0, 30.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      equation
        connect(Orders.y, Retail1.rrr) annotation(
          Line(visible = true, points = {{11.0, 30.0}, {45.0, 30.0}, {45.0, 8.41}, {36.47, 8.41}}, color = {0, 0, 191}));
        connect(Retail1.ssd, Distribution1.ssd) annotation(
          Line(visible = true, points = {{14.03, -2.81}, {10.515, -2.81}, {10.515, -2.81}, {6.47, -2.81}}, color = {95, 0, 191}));
        connect(Retail1.uod, Distribution1.uod) annotation(
          Line(visible = true, points = {{14.03, 3.31}, {10.015, 3.31}, {10.015, 3.31}, {6.47, 3.31}}, color = {0, 0, 191}));
        connect(Distribution1.ssf, Factory1.ssf) annotation(
          Line(visible = true, points = {{-15.97, -2.81}, {-19.485, -2.81}, {-19.485, -2.81}, {-23.53, -2.81}}, color = {95, 0, 191}));
        connect(Distribution1.uof, Factory1.uof) annotation(
          Line(visible = true, points = {{-15.97, 3.31}, {-19.485, 3.31}, {-19.485, 3.31}, {-23.53, 3.31}}, color = {0, 0, 191}));
        connect(Distribution1.rrf, Factory1.rrf) annotation(
          Line(visible = true, points = {{-15.97, 8.41}, {-23.53, 8.41}}, color = {95, 0, 191}));
        connect(Retail1.dfd, Distribution1.dfd) annotation(
          Line(visible = true, points = {{14.03, -7.91}, {6.47, -7.91}}, color = {0, 0, 191}));
        connect(Retail1.rrd, Distribution1.rrd) annotation(
          Line(visible = true, points = {{14.03, 8.41}, {6.47, 8.41}}, color = {95, 0, 191}));
        connect(Distribution1.dff, Factory1.dff) annotation(
          Line(visible = true, points = {{-15.97, -7.91}, {-23.53, -7.91}}, color = {0, 0, 191}));
        orders = Orders.y;
        factoryFlow = Factory1.IAF.u1;
        retailStock = Retail1.IAR.y;
        distributionStock = Distribution1.IAD.y;
        factoryStock = Factory1.IAF.y;
        annotation(
          Icon(coordinateSystem(extent = {{-50.0, -50.0}, {50.0, 50.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, lineColor = {0, 0, 255}, extent = {{1.0, -52.0}, {1.0, -39.0}}, textString = "%name", fontName = "Arial"), Rectangle(visible = true, lineColor = {0, 0, 255}, fillColor = {255, 255, 0}, fillPattern = FillPattern.Solid, extent = {{-40.0, -40.0}, {40.0, 50.0}}), Rectangle(visible = true, lineColor = {0, 0, 255}, fillColor = {127, 255, 0}, fillPattern = FillPattern.Solid, extent = {{-30.0, 23.0}, {30.0, 38.0}}), Rectangle(visible = true, lineColor = {0, 0, 255}, fillColor = {127, 255, 0}, fillPattern = FillPattern.Solid, extent = {{-30.0, -2.0}, {30.0, 13.0}}), Rectangle(visible = true, lineColor = {0, 0, 255}, fillColor = {127, 255, 0}, fillPattern = FillPattern.Solid, extent = {{-30.0, -27.0}, {30.0, -12.0}}), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-25.0, 25.0}, {27.0, 35.0}}, textString = "Factory", fontName = "Arial"), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-25.0, 1.0}, {27.0, 11.0}}, textString = "Distribution", fontName = "Arial"), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-25.0, -24.0}, {27.0, -14.0}}, textString = "Retail", fontName = "Arial"), Line(visible = true, points = {{0.0, 13.0}, {0.0, 23.0}}, color = {0, 0, 255}), Line(visible = true, points = {{0.0, -2.0}, {0.0, -12.0}}, color = {0, 0, 255})}),
          Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics),
          experiment(StopTime = 120, Algorithm = "dassl"),
          experimentSetupOutput,
          Documentation(info = "<html>
<b>Seasonally Fluctuating Customer Demand</b> <p>
 
The second simulation involves seasonal fluctuation of customers:<p>
<font color=red><b>RRR(t) = RRRini + 100*sin(2*pi*time/52);</b></font> <p>
 
<hr> <p>
 
Simulate the model across 120 weeks, and plot on one graph the incoming orders and the production flow in the factory and on a second graph the levels of goods in retail, distribution, and the factory as functions of time: <p>
<img src=\"modelica://SystemDynamics/Resources/Images/Inventory_2.png\"/> <p>
 
<hr> <p>
</html>", revisions = ""));
      end InventoryForresterSinOneYear;