      model InventoryForresterNormalNoise "Inventory simulation with random orders"
        parameter Real RRRiniTop(unit = "1/wk") = 1000 "Inital value of customer requests at retail";
        parameter Real RRDiniTop(unit = "1/wk") = RRRiniTop "Inital value of requisitions received at distribution";
        parameter Real RRFiniTop(unit = "1/wk") = RRRiniTop "Inital value of requisitions received at factory";
        output Real randomNoise(unit = "1/wk") "Random noise signal";
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
        SystemDynamics.Functions.NoiseNormal NoiseNormal1(mean = 1000) annotation(
          Placement(visible = true, transformation(origin = {5.7239, 30.0}, extent = {{-14.2761, -14.2761}, {14.2761, 14.2761}}, rotation = 0)));
      equation
        connect(Distribution1.rrf, Factory1.rrf) annotation(
          Line(visible = true, points = {{-15.97, 8.41}, {-18.985, 8.41}, {-18.985, 8.41}, {-23.53, 8.41}}, color = {95, 0, 191}));
        connect(NoiseNormal1.y, Retail1.rrr) annotation(
          Line(visible = true, points = {{18.5724, 30.0}, {45.0, 30.0}, {45.0, 8.41}, {36.47, 8.41}}, color = {0, 0, 191}));
        connect(Distribution1.ssd, Retail1.ssd) annotation(
          Line(visible = true, points = {{6.47, -2.81}, {10.735, -2.81}, {10.735, -2.81}, {14.03, -2.81}}, color = {95, 0, 191}));
        connect(Distribution1.uod, Retail1.uod) annotation(
          Line(visible = true, points = {{6.47, 3.31}, {10.235, 3.31}, {10.235, 3.31}, {14.03, 3.31}}, color = {0, 0, 191}));
        connect(Factory1.uof, Distribution1.uof) annotation(
          Line(visible = true, points = {{-23.53, 3.31}, {-19.765, 3.31}, {-19.765, 3.31}, {-15.97, 3.31}}, color = {0, 0, 191}));
        connect(Factory1.ssf, Distribution1.ssf) annotation(
          Line(visible = true, points = {{-23.53, -2.81}, {-19.765, -2.81}, {-19.765, -2.81}, {-15.97, -2.81}}, color = {95, 0, 191}));
        connect(Retail1.dfd, Distribution1.dfd) annotation(
          Line(visible = true, points = {{14.03, -7.91}, {6.47, -7.91}}, color = {0, 0, 191}));
        connect(Retail1.rrd, Distribution1.rrd) annotation(
          Line(visible = true, points = {{14.03, 8.41}, {6.47, 8.41}}, color = {95, 0, 191}));
        connect(Distribution1.dff, Factory1.dff) annotation(
          Line(visible = true, points = {{-15.97, -7.91}, {-23.53, -7.91}}, color = {0, 0, 191}));
        randomNoise = NoiseNormal1.y;
        factoryFlow = Factory1.IAF.u1;
        retailStock = Retail1.IAR.y;
        distributionStock = Distribution1.IAD.y;
        factoryStock = Factory1.IAF.y;
        annotation(
          Icon(coordinateSystem(extent = {{-50.0, -50.0}, {50.0, 50.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, lineColor = {0, 0, 255}, extent = {{1.0, -52.0}, {1.0, -39.0}}, textString = "%name", fontName = "Arial"), Rectangle(visible = true, lineColor = {0, 0, 255}, fillColor = {255, 255, 0}, fillPattern = FillPattern.Solid, extent = {{-40.0, -40.0}, {40.0, 50.0}}), Rectangle(visible = true, lineColor = {0, 0, 255}, fillColor = {127, 255, 0}, fillPattern = FillPattern.Solid, extent = {{-30.0, 23.0}, {30.0, 38.0}}), Rectangle(visible = true, lineColor = {0, 0, 255}, fillColor = {127, 255, 0}, fillPattern = FillPattern.Solid, extent = {{-30.0, -2.0}, {30.0, 13.0}}), Rectangle(visible = true, lineColor = {0, 0, 255}, fillColor = {127, 255, 0}, fillPattern = FillPattern.Solid, extent = {{-30.0, -27.0}, {30.0, -12.0}}), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-25.0, 25.0}, {27.0, 35.0}}, textString = "Factory", fontName = "Arial"), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-25.0, 1.0}, {27.0, 11.0}}, textString = "Distribution", fontName = "Arial"), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-25.0, -24.0}, {27.0, -14.0}}, textString = "Retail", fontName = "Arial"), Line(visible = true, points = {{0.0, 13.0}, {0.0, 23.0}}, color = {0, 0, 255}), Line(visible = true, points = {{0.0, -2.0}, {0.0, -12.0}}, color = {0, 0, 255})}),
          Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics),
          Documentation(info = "<html>
<b>Customer Demand Modeled as Noise</b> <p>
 
Customer demand usually fluctuates in a random fashion.  Therefore, it is modeled in this simulation as normally distributed random noise with a mean value of <b>mean=1000</b> and a standard deviation of <b>stdev=100</b>. The noise is sampled once per week and kept constant for the corresponding week.  The order flow is modeled using the equation:<p>
<font color=red><b>RRR(t) = RRRini + normal(1000,100);</b></font> <p>
 
<hr> <p>
 
Simulate the model across 10 years (520 weeks), and plot on a single graph the incoming orders, the production flow in the factory, and the levels of goods in retail, distribution, and the factory as functions of time: <p>
<img src=\"modelica://SystemDynamics/Resources/Images/Inventory_1.png\"> <p>
 
Choose <font color=red><b>Radau-IIa</b></font> as your integration algorithm.  It handles noise input better than <font color=red><b>DASSL</b></font>. <p>
 
<hr> <p>
</html>", revisions = ""),
          experiment(StopTime = 520),
          experimentSetupOutput);
      end InventoryForresterNormalNoise;