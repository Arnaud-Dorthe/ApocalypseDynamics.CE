      model Retail "Retail model"
        parameter Real AIR = 8 "Gain factor for inventory in retail";
        parameter Real DCR(unit = "wk") = 3 "Delay clerical";
        parameter Real DHR(unit = "wk") = 1 "Delay in handling at retail";
        parameter Real DIR(unit = "wk") = 4 "Delay in inventory (and pipeline) adjustment";
        parameter Real DMR(unit = "wk") = 0.5 "Mail delay";
        parameter Real DRR(unit = "wk") = 8 "Delay in smoothing requisitions";
        parameter Real DTR(unit = "wk") = 1 "Transportation delay";
        parameter Real DUR(unit = "wk") = 0.4 "Delay due to unfillable orders";
        parameter Real RRRini(unit = "1/wk") = 1000 "Initial requests at retail";
        final parameter Real RSRini = RRRini;
        final parameter Real IARini = AIR * RSRini;
        final parameter Real UORini = RSRini * (DHR + DUR);
        SystemDynamics.Levels.Level IAR(x0 = IARini) "Produced goods in retail" annotation(
          Placement(visible = true, transformation(origin = {30.0, -30.0}, extent = {{-16.0, -16.0}, {16.0, 16.0}}, rotation = 0)));
        SystemDynamics.Rates.Rate_1 SSR "Goods leaving retail" annotation(
          Placement(visible = true, transformation(origin = {70.0, -30.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = 0)));
        SystemDynamics.IndustrialDynamics.Inventory.Utilities.SSD_d SSR_d "Delivery rate at retail" annotation(
          Placement(visible = true, transformation(origin = {70.0, -63.0331}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -270)));
        SystemDynamics.Rates.Rate_1 PDR "Orders leaving distribution" annotation(
          Placement(visible = true, transformation(origin = {-20.0, 100.0}, extent = {{15.0, -15.0}, {-15.0, 15.0}}, rotation = 0)));
        SystemDynamics.Sources.Source Source1 annotation(
          Placement(visible = true, transformation(origin = {10.0, 100.0}, extent = {{10.0, -10.0}, {-10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Levels.Level UOR(x0 = UORini) "Unfilled orders" annotation(
          Placement(visible = true, transformation(origin = {75.0, 80.0}, extent = {{15.0, -16.0}, {-15.0, 16.0}}, rotation = 0)));
        SystemDynamics.Rates.Rate_1 ODR "Orders filled due to delivery" annotation(
          Placement(visible = true, transformation(origin = {40.0, 80.0}, extent = {{15.0, -15.0}, {-15.0, 15.0}}, rotation = 0)));
        SystemDynamics.Sources.Sink Sink1 annotation(
          Placement(visible = true, transformation(origin = {10.0, 80.0}, extent = {{10.0, -10.0}, {-10.0, 10.0}}, rotation = 0)));
        SystemDynamics.IndustrialDynamics.Inventory.Utilities.PPD1 PDR1(DID = DIR) "Manufacturing demand at retail" annotation(
          Placement(visible = true, transformation(origin = {-20.0, 70.0}, extent = {{10.0, -10.0}, {-10.0, 10.0}}, rotation = 270)));
        SystemDynamics.IndustrialDynamics.Inventory.Utilities.PPD2 PDR2 "Partial manufacturing adjustment for distribution" annotation(
          Placement(visible = true, transformation(origin = {0.0, 14.7855}, extent = {{-10.0, 10.0}, {10.0, -10.0}}, rotation = 180)));
        SystemDynamics.Auxiliary.Gain UNR(k = DHR + DUR) "Desired unfilled orders" annotation(
          Placement(visible = true, transformation(origin = {34.0, 37.0}, extent = {{27.0, 13.0}, {-27.0, -13.0}}, rotation = 0)));
        SystemDynamics.IndustrialDynamics.Inventory.Utilities.LAD LAR "Actual delays in order processing" annotation(
          Placement(visible = true, transformation(origin = {-40.0, 31.5165}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.IndustrialDynamics.Inventory.Utilities.LDD LDR(DCD = DCR, DMD = DMR, DTD = DTR) "Desired delay in order processing" annotation(
          Placement(visible = true, transformation(origin = {42.4112, 13.6183}, extent = {{-10.0, 10.0}, {10.0, -10.0}}, rotation = 180)));
        SystemDynamics.Auxiliary.Gain IDR(k = AIR) "Desired produced goods in retail" annotation(
          Placement(visible = true, transformation(origin = {34.0, -5.0}, extent = {{-15.0, -10.0}, {15.0, 10.0}}, rotation = -180)));
        SystemDynamics.IndustrialDynamics.Inventory.Utilities.DFD DFR(DHD = DHR, DUD = DUR) "Desired delay in filling orders" annotation(
          Placement(visible = true, transformation(origin = {-12.451, -94.9387}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        Modelica.Blocks.Math.Division STR "Desired order filling rate" annotation(
          Placement(visible = true, transformation(origin = {14.5, -90.5}, extent = {{-7.5, -7.5}, {7.5, 7.5}}, rotation = 0)));
        SystemDynamics.Functions.DELAY1 RSR_delayed(averaging_time(unit = "wk") = DRR, delay_init = RSRini * DRR) "Delayed new orders" annotation(
          Placement(visible = true, transformation(origin = {79.0, 10.0}, extent = {{14.0, -10.0}, {-14.0, 10.0}}, rotation = 0)));
        SystemDynamics.Functions.DELAY3 Transporation_Delay(averaging_time(unit = "wk") = DTR, delay_init = RRRini * DTR) "Transporation_Delay" annotation(
          Placement(visible = true, transformation(origin = {-65.0, -30.0}, extent = {{-15.0, -10.0}, {15.0, 10.0}}, rotation = 0)));
        SystemDynamics.Functions.DELAY3 Order_Delay(averaging_time(unit = "wk") = DCR, delay_init = RRRini * DCR) "Order_Delay" annotation(
          Placement(visible = true, transformation(origin = {-52.0, 100.0}, extent = {{15.0, 10.0}, {-15.0, -10.0}}, rotation = 0)));
        SystemDynamics.Functions.DELAY3 Mail_Delay(averaging_time(unit = "wk") = DMR, delay_init = RRRini * DMR) "Mail_Delay" annotation(
          Placement(visible = true, transformation(origin = {-92.0, 100.0}, extent = {{15.0, 10.0}, {-15.0, -10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassOutPort rrd(unit = "1/wk") "New order demands" annotation(
          Placement(visible = true, transformation(origin = {-110.0, 80.0}, extent = {{10.0, -10.0}, {-10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-110.0, 80.0}, extent = {{10.0, -10.0}, {-10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassInPort ssd(unit = "1/wk") "Manufactured goods arriving at retail" annotation(
          Placement(visible = true, transformation(origin = {-110.0, -30.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-110.0, -30.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassInPort uod "Unfilled orders" annotation(
          Placement(visible = true, transformation(origin = {-110.0, 30.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-110.0, 30.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassInPort dfd(unit = "wk") "Desired delay in filling orders" annotation(
          Placement(visible = true, transformation(origin = {-110.0, -80.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-110.0, -80.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassInPort rrr(unit = "1/wk") "New order demands" annotation(
          Placement(visible = true, transformation(origin = {110.0, 80.0}, extent = {{10.0, -10.0}, {-10.0, 10.0}}, rotation = 0), iconTransformation(origin = {110.0, 80.0}, extent = {{10.0, -10.0}, {-10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassOutPort ssr(unit = "1/wk") "Goods leaving retail" annotation(
          Placement(visible = true, transformation(origin = {110.0, -30.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {110.0, -30.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      equation
        connect(SSR_d.u2, STR.y) annotation(
          Line(visible = true, points = {{74.0, -72.0331}, {74.0, -90.5}, {22.75, -90.5}}, color = {0, 0, 191}));
        connect(SSR_d.y, ODR.u) annotation(
          Line(visible = true, points = {{70.0, -54.0331}, {70.0, -50.0}, {120.0, -50.0}, {120.0, 60.0}, {40.0, 60.0}, {40.0, 64.25}}, color = {0, 0, 191}));
        connect(SSR_d.u1, IAR.y2) annotation(
          Line(visible = true, points = {{66.0, -72.0331}, {66.0, -80.0}, {42.0, -80.0}, {42.0, -40.4}}, color = {0, 0, 191}));
        connect(SSR.u, SSR_d.y) annotation(
          Line(visible = true, points = {{70.0, -45.75}, {70.0, -54.0331}}, color = {0, 0, 191}));
        connect(PDR2.y, PDR1.u1) annotation(
          Line(visible = true, points = {{-9.0, 14.7855}, {-14.0, 15.0}, {-14.0, 61.0}}, color = {0, 0, 191}));
        connect(IDR.y, PDR2.u3) annotation(
          Line(visible = true, points = {{23.5, -5.0}, {20.0, -5.0}, {20.0, 13.0}, {9.0, 12.7855}}, color = {0, 0, 191}));
        connect(LDR.y, PDR2.u1) annotation(
          Line(visible = true, points = {{33.4112, 13.6183}, {25.0, 14.0}, {25.0, 21.0}, {9.0, 20.7855}}, color = {0, 0, 191}));
        connect(PDR2.u2, LAR.y) annotation(
          Line(visible = true, points = {{9.0, 16.7855}, {13.0, 17.0}, {13.0, 32.0}, {-31.0, 31.5165}}, color = {0, 0, 191}));
        connect(PDR2.u4, IAR.y) annotation(
          Line(visible = true, points = {{9.0, 8.7855}, {13.0, 9.0}, {13.0, -21.2}, {16.4, -21.2}}, color = {0, 0, 191}));
        connect(LDR.u1, RSR_delayed.massOutPort) annotation(
          Line(visible = true, points = {{51.4112, 17.6183}, {60.0, 18.0}, {60.0, 10.0}, {63.6, 10.0}}, color = {0, 0, 191}));
        connect(dfd, LDR.u2) annotation(
          Line(visible = true, points = {{-110.0, -80.0}, {-90.0, -80.0}, {-90.0, -110.0}, {90.0, -110.0}, {90.0, -10.0}, {55.0, -10.0}, {55.0, 10.0}, {51.4112, 9.6183}}, color = {0, 0, 191}));
        connect(LAR.u2, Mail_Delay.state) annotation(
          Line(visible = true, points = {{-49.0, 33.5165}, {-92.0, 34.0}, {-92.0, 89.0}}, color = {0, 0, 191}));
        connect(LAR.u1, Order_Delay.state) annotation(
          Line(visible = true, points = {{-49.0, 37.5165}, {-85.0, 38.0}, {-85.0, 50.0}, {-52.0, 50.0}, {-52.0, 89.0}}, color = {0, 0, 191}));
        connect(Transporation_Delay.state, LAR.u4) annotation(
          Line(visible = true, points = {{-65.0, -19.0}, {-65.0, -6.0}, {-85.0, -6.0}, {-85.0, 26.0}, {-49.0, 25.5165}}, color = {0, 0, 191}));
        connect(uod, LAR.u3) annotation(
          Line(visible = true, points = {{-110.0, 30.0}, {-49.0, 29.5165}}, color = {0, 0, 191}));
        connect(PDR1.u4, rrr) annotation(
          Line(visible = true, points = {{-26.0, 61.0}, {-26.0, 55.0}, {-120.0, 55.0}, {-120.0, 116.0}, {97.0, 116.0}, {97.0, 80.0}, {110.0, 80.0}}, color = {0, 0, 191}));
        connect(PDR1.u4, RSR_delayed.massInPort) annotation(
          Line(visible = true, points = {{-26.0, 61.0}, {-26.0, 55.0}, {-120.0, 55.0}, {-120.0, 116.0}, {97.0, 116.0}, {97.0, 10.0}, {94.4, 10.0}}, color = {0, 0, 191}));
        connect(UNR.y, PDR1.u3) annotation(
          Line(visible = true, origin = {-9.6333, 45.0}, points = {{24.7333, -8.0}, {-12.3667, -8.0}, {-12.3667, 16.0}}, color = {0, 0, 191}));
        connect(PDR1.u2, UOR.y2) annotation(
          Line(visible = true, points = {{-18.0, 61.0}, {-18.0, 55.0}, {63.75, 55.0}, {63.75, 69.6}}, color = {0, 0, 191}));
        connect(PDR1.y, PDR.u) annotation(
          Line(visible = true, origin = {-20.0, 81.625}, points = {{0.0, -2.625}, {0.0, 2.625}}, color = {0, 0, 191}));
        connect(STR.u2, DFR.y) annotation(
          Line(visible = true, points = {{5.5, -95.0}, {-3.451, -94.9387}}, color = {0, 0, 191}));
        connect(IDR.y, DFR.u2) annotation(
          Line(visible = true, points = {{23.5, -5.0}, {-35.0, -5.0}, {-35.0, -99.0}, {-21.451, -98.9387}}, color = {0, 0, 191}));
        connect(DFR.u1, IAR.y4) annotation(
          Line(visible = true, points = {{-21.451, -90.9387}, {-30.0, -91.0}, {-30.0, -50.0}, {18.0, -50.0}, {18.0, -40.4}}, color = {0, 0, 191}));
        connect(ssr, SSR.y1) annotation(
          Line(visible = true, points = {{110.0, -30.0}, {77.5, -30.0}}, color = {95, 0, 191}));
        connect(rrr, UOR.u1) annotation(
          Line(visible = true, points = {{110.0, 80.0}, {91.5, 80.0}}, color = {95, 0, 191}));
        connect(Mail_Delay.massOutPort, rrd) annotation(
          Line(visible = true, points = {{-108.5, 100.0}, {-118.0, 100.0}, {-118.0, 70.0}, {-95.0, 70.0}, {-95.0, 80.0}, {-110.0, 80.0}}, color = {95, 0, 191}));
        connect(Mail_Delay.massInPort, Order_Delay.massOutPort) annotation(
          Line(visible = true, points = {{-75.5, 100.0}, {-68.5, 100.0}}, color = {95, 0, 191}));
        connect(PDR.y1, Order_Delay.massInPort) annotation(
          Line(visible = true, points = {{-27.5, 100.0}, {-35.5, 100.0}}, color = {95, 0, 191}));
        connect(Transporation_Delay.massOutPort, IAR.u1) annotation(
          Line(visible = true, points = {{-48.5, -30.0}, {12.4, -30.0}}, color = {95, 0, 191}));
        connect(Transporation_Delay.massInPort, ssd) annotation(
          Line(visible = true, points = {{-81.5, -30.0}, {-110.0, -30.0}}, color = {95, 0, 191}));
        connect(UNR.u, RSR_delayed.massOutPort) annotation(
          Line(visible = true, points = {{52.9, 37.0}, {60.0, 37.0}, {60.0, 10.0}, {63.6, 10.0}}, color = {0, 0, 191}));
        connect(IDR.u, RSR_delayed.massOutPort) annotation(
          Line(visible = true, points = {{44.5, -5.0}, {60.0, -5.0}, {60.0, 10.0}, {63.6, 10.0}}, color = {0, 0, 191}));
        connect(STR.u1, UOR.y1) annotation(
          Line(visible = true, points = {{5.5, -86.0}, {0.0, -86.0}, {0.0, -60.0}, {-125.0, -60.0}, {-125.0, 120.0}, {55.0, 120.0}, {55.0, 88.8}, {62.25, 88.8}}, color = {0, 0, 191}));
        connect(ODR.y1, Sink1.MassInPort1) annotation(
          Line(visible = true, points = {{32.5, 80.0}, {21.0, 80.0}}, color = {95, 0, 191}));
        connect(UOR.u2, ODR.y) annotation(
          Line(visible = true, points = {{58.5, 80.0}, {47.5, 80.0}}, color = {95, 0, 191}));
        connect(Source1.MassInPort1, PDR.y) annotation(
          Line(visible = true, points = {{-1.0, 100.0}, {-12.5, 100.0}}, color = {95, 0, 191}));
        connect(SSR.y, IAR.u2) annotation(
          Line(visible = true, points = {{62.5, -30.0}, {47.6, -30.0}}, color = {95, 0, 191}));
        annotation(
          Icon(coordinateSystem(extent = {{-125.0, -125.0}, {125.0, 125.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, lineColor = {0, 0, 255}, extent = {{-0.0, 65.0}, {0.0, 101.0}}, textString = "%name", fontName = "Arial"), Rectangle(visible = true, lineColor = {0, 0, 255}, extent = {{-100.0, -100.0}, {100.0, 100.0}}), Polygon(visible = true, lineColor = {0, 0, 255}, fillColor = {191, 223, 159}, fillPattern = FillPattern.Solid, points = {{-49.0, 20.0}, {-10.0, 20.0}, {10.0, 10.0}, {-34.0, 10.0}, {-34.0, -24.0}, {0.0, -24.0}, {0.0, -60.0}, {-50.0, -60.0}, {-50.0, 20.0}, {-49.0, 20.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {255, 255, 0}, fillPattern = FillPattern.Solid, extent = {{-22.0, -7.0}, {-13.0, 2.0}}), Polygon(visible = true, lineColor = {0, 0, 255}, fillColor = {255, 255, 0}, fillPattern = FillPattern.Solid, points = {{-24.0, -24.0}, {-11.0, -24.0}, {-11.0, -11.0}, {-18.0, -8.0}, {-23.0, -11.0}, {-23.0, -24.0}, {-24.0, -24.0}}), Line(visible = true, points = {{-18.0, -12.0}, {-9.0, -19.0}, {-3.0, -16.0}}, color = {0, 0, 255}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {127, 191, 255}, fillPattern = FillPattern.Solid, extent = {{14.0, -15.0}, {23.0, -6.0}}), Polygon(visible = true, lineColor = {0, 0, 255}, fillColor = {127, 191, 255}, fillPattern = FillPattern.Solid, points = {{14.0, -32.0}, {25.0, -32.0}, {25.0, -19.0}, {18.0, -16.0}, {13.0, -19.0}, {13.0, -32.0}, {14.0, -32.0}}), Line(visible = true, points = {{18.0, -20.0}, {10.0, -24.0}, {4.0, -20.0}}, color = {0, 0, 255}), Polygon(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 255, 255}, fillPattern = FillPattern.Solid, points = {{13.0, -33.0}, {25.0, -33.0}, {25.0, -60.0}, {21.0, -60.0}, {18.0, -39.0}, {12.0, -60.0}, {9.0, -60.0}, {13.0, -33.0}, {13.0, -33.0}})}),
          Diagram(coordinateSystem(extent = {{-125.0, -125.0}, {125.0, 125.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{69.0, -51.0}, {71.0, -49.0}}), Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{96.0, 79.0}, {98.0, 81.0}}), Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{59.0, 17.0}, {61.0, 19.0}}), Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{59.0, 9.0}, {61.0, 11.0}}), Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{19.0, -6.0}, {21.0, -4.0}})}),
          Documentation(info = "<html>
This model describes the retail of produced goods.  Goods that are being sold are represented by the mass-flow model in the lower part of the graph, whereas the orders for these goods are represented by the mass-flow models in the upper part of the graph.  The signal-flow model represents the control of the flow of goods based on the information obtained from their order status. <p>
 
The retail model is the same model as the distribution model except for the parameter values used.
</html>"));
      end Retail;