      model Distribution "Distribution model"
        parameter Real AID = 6 "Gain factor for inventory in distribution";
        parameter Real DCD(unit = "wk") = 2 "Delay clerical";
        parameter Real DHD(unit = "wk") = 1 "Delay in handling";
        parameter Real DID(unit = "wk") = 4 "Delay in inventory (and pipeline) adjustment";
        parameter Real DMD(unit = "wk") = 0.5 "Mail delay";
        parameter Real DRD(unit = "wk") = 8 "Delay in smoothing requisitions";
        parameter Real DUD(unit = "wk") = 0.6 "Delay due to unfillable orders";
        parameter Real DTD(unit = "wk") = 2 "Transportation delay";
        parameter Real RRDini(unit = "1/wk") = 1000 "Initial requests at retail";
        final parameter Real RSDini = RRDini;
        final parameter Real IADini = AID * RSDini;
        final parameter Real UODini = RSDini * (DHD + DUD);
        SystemDynamics.Interfaces.MassOutPort rrf(unit = "1/wk") "New order demands" annotation(
          Placement(visible = true, transformation(origin = {-110.0, 80.0}, extent = {{10.0, -10.0}, {-10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-110.0, 80.0}, extent = {{10.0, -10.0}, {-10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassInPort ssf(unit = "1/wk") "Manufactured goods leaving factory" annotation(
          Placement(visible = true, transformation(origin = {-110.0, -30.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-110.0, -30.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassInPort uof "Unfilled orders" annotation(
          Placement(visible = true, transformation(origin = {-110.0, 30.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-110.0, 30.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassInPort dff(unit = "wk") "Desired delay in filling orders" annotation(
          Placement(visible = true, transformation(origin = {-110.0, -80.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-110.0, -80.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Levels.Level IAD(x0 = IADini) "Produced goods in distribution" annotation(
          Placement(visible = true, transformation(origin = {30.0, -30.0}, extent = {{-16.0, -16.0}, {16.0, 16.0}}, rotation = 0)));
        SystemDynamics.Rates.Rate_1 SSD "Goods leaving distribution" annotation(
          Placement(visible = true, transformation(origin = {70.0, -30.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassOutPort ssd(unit = "1/wk") "Goods leaving distribution" annotation(
          Placement(visible = true, transformation(origin = {110.0, -30.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {110.0, -30.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.IndustrialDynamics.Inventory.Utilities.SSD_d SSD_d "Delivery rate at distribution" annotation(
          Placement(visible = true, transformation(origin = {70.0, -63.0331}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -270)));
        SystemDynamics.Rates.Rate_1 PPD "Orders leaving distribution" annotation(
          Placement(visible = true, transformation(origin = {-20.0, 100.0}, extent = {{15.0, -15.0}, {-15.0, 15.0}}, rotation = 0)));
        SystemDynamics.Sources.Source Source1 annotation(
          Placement(visible = true, transformation(origin = {10.0, 100.0}, extent = {{10.0, -10.0}, {-10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassInPort rrd(unit = "1/wk") "New order demands" annotation(
          Placement(visible = true, transformation(origin = {110.0, 80.0}, extent = {{10.0, -10.0}, {-10.0, 10.0}}, rotation = 0), iconTransformation(origin = {110.0, 80.0}, extent = {{10.0, -10.0}, {-10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Levels.Level UOD(x0 = UODini) "Unfilled orders" annotation(
          Placement(visible = true, transformation(origin = {75.0, 80.0}, extent = {{15.0, -16.0}, {-15.0, 16.0}}, rotation = 0)));
        SystemDynamics.Rates.Rate_1 ODD "Orders filled due to delivery" annotation(
          Placement(visible = true, transformation(origin = {40.0, 80.0}, extent = {{15.0, -15.0}, {-15.0, 15.0}}, rotation = 0)));
        SystemDynamics.Sources.Sink Sink1 annotation(
          Placement(visible = true, transformation(origin = {10.0, 80.0}, extent = {{10.0, -10.0}, {-10.0, 10.0}}, rotation = 0)));
        SystemDynamics.IndustrialDynamics.Inventory.Utilities.PPD1 PPD1(DID = DID) "Manufacturing demand at distribution" annotation(
          Placement(visible = true, transformation(origin = {-20.0, 70.0}, extent = {{10.0, -10.0}, {-10.0, 10.0}}, rotation = 270)));
        SystemDynamics.IndustrialDynamics.Inventory.Utilities.PPD2 PPD2 "Partial manufacturing adjustment for distribution" annotation(
          Placement(visible = true, transformation(origin = {-0.0, 15.1746}, extent = {{10.0, -10.0}, {-10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Gain UND(k = DHD + DUD) "Desired unfilled orders" annotation(
          Placement(visible = true, transformation(origin = {34.0, 37.0}, extent = {{27.0, 13.0}, {-27.0, -13.0}}, rotation = 0)));
        SystemDynamics.IndustrialDynamics.Inventory.Utilities.LAD LAD "Actual delays in order processing" annotation(
          Placement(visible = true, transformation(origin = {-70.0, 31.9455}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.IndustrialDynamics.Inventory.Utilities.LDD LDD(DCD = DCD, DMD = DMD, DTD = DTD) "Desired delay in order processing" annotation(
          Placement(visible = true, transformation(origin = {40.0, 14.0074}, extent = {{10.0, -10.0}, {-10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Gain IDD(k = AID) "Desired produced goods in distribution" annotation(
          Placement(visible = true, transformation(origin = {34.0, -5.0}, extent = {{-15.0, -10.0}, {15.0, 10.0}}, rotation = -180)));
        SystemDynamics.IndustrialDynamics.Inventory.Utilities.DFD DFD(DHD = DHD, DUD = DUD) "Desired delay in filling orders" annotation(
          Placement(visible = true, transformation(origin = {-14.3597, -95.3278}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        Modelica.Blocks.Math.Division STD "Desired order filling rate" annotation(
          Placement(visible = true, transformation(origin = {14.5, -90.5}, extent = {{-7.5, -7.5}, {7.5, 7.5}}, rotation = 0)));
        SystemDynamics.Interfaces.MassOutPort uod "Unfilled orders" annotation(
          Placement(visible = true, transformation(origin = {110.0, 30.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {110.0, 30.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassOutPort dfd(unit = "wk") "Desired delay in filling orders" annotation(
          Placement(visible = true, transformation(origin = {110.0, -80.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {110.0, -80.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Functions.DELAY1 RSD_delayed(averaging_time(unit = "wk") = DRD, delay_init = RSDini * DRD) "Delayed new orders" annotation(
          Placement(visible = true, transformation(origin = {79.0, 10.0}, extent = {{14.0, -10.0}, {-14.0, 10.0}}, rotation = 0)));
        SystemDynamics.Functions.DELAY3 Transporation_Delay(averaging_time(unit = "wk") = DTD, delay_init = RRDini * DTD) "Transporation_Delay" annotation(
          Placement(visible = true, transformation(origin = {-65.0, -30.0}, extent = {{-15.0, -10.0}, {15.0, 10.0}}, rotation = 0)));
        SystemDynamics.Functions.DELAY3 Order_Delay(averaging_time(unit = "wk") = DCD, delay_init = RRDini * DCD) "Order_Delay" annotation(
          Placement(visible = true, transformation(origin = {-52.0, 100.0}, extent = {{15.0, 10.0}, {-15.0, -10.0}}, rotation = 0)));
        SystemDynamics.Functions.DELAY3 Mail_Delay(averaging_time(unit = "wk") = DMD, delay_init = RRDini * DMD) "Mail_Delay" annotation(
          Placement(visible = true, transformation(origin = {-92.0, 100.0}, extent = {{15.0, 10.0}, {-15.0, -10.0}}, rotation = 0)));
      equation
        connect(DFD.y, dfd) annotation(
          Line(visible = true, points = {{-5.3597, -95.3278}, {0.0, -95.0}, {0.0, -115.0}, {95.0, -115.0}, {95.0, -80.0}, {110.0, -80.0}}, color = {0, 0, 191}));
        connect(STD.u2, DFD.y) annotation(
          Line(visible = true, points = {{5.5, -95.0}, {-5.3597, -95.3278}}, color = {0, 0, 191}));
        connect(IDD.y, DFD.u2) annotation(
          Line(visible = true, points = {{23.5, -5.0}, {-35.0, -5.0}, {-35.0, -99.0}, {-23.3597, -99.3278}}, color = {0, 0, 191}));
        connect(DFD.u1, IAD.y4) annotation(
          Line(visible = true, points = {{-23.3597, -91.3278}, {-30.0, -91.0}, {-30.0, -50.0}, {18.0, -50.0}, {18.0, -40.4}}, color = {0, 0, 191}));
        connect(SSD_d.u2, STD.y) annotation(
          Line(visible = true, points = {{74.0, -72.0331}, {74.0, -90.5}, {22.75, -90.5}}, color = {0, 0, 191}));
        connect(SSD_d.y, ODD.u) annotation(
          Line(visible = true, points = {{70.0, -54.0331}, {70.0, -50.0}, {120.0, -50.0}, {120.0, 60.0}, {40.0, 60.0}, {40.0, 64.25}}, color = {0, 0, 191}));
        connect(SSD_d.u1, IAD.y2) annotation(
          Line(visible = true, points = {{66.0, -72.0331}, {66.0, -80.0}, {42.0, -80.0}, {42.0, -40.4}}, color = {0, 0, 191}));
        connect(SSD.u, SSD_d.y) annotation(
          Line(visible = true, points = {{70.0, -45.75}, {70.0, -54.0331}}, color = {0, 0, 191}));
        connect(LDD.u1, RSD_delayed.massOutPort) annotation(
          Line(visible = true, points = {{49.0, 18.0074}, {60.0, 18.0}, {60.0, 10.0}, {63.6, 10.0}}, color = {0, 0, 191}));
        connect(dff, LDD.u2) annotation(
          Line(visible = true, points = {{-110.0, -80.0}, {-90.0, -80.0}, {-90.0, -110.0}, {90.0, -110.0}, {90.0, -10.0}, {55.0, -10.0}, {55.0, 10.0}, {49.0, 10.0074}}, color = {0, 0, 191}));
        connect(LDD.y, PPD2.u1) annotation(
          Line(visible = true, points = {{31.0, 14.0074}, {25.0, 14.0}, {25.0, 21.0}, {9.0, 21.1746}}, color = {0, 0, 191}));
        connect(PPD2.y, PPD1.u1) annotation(
          Line(visible = true, points = {{-9.0, 15.1746}, {-14.0, 15.0}, {-14.0, 61.0}}, color = {0, 0, 191}));
        connect(IDD.y, PPD2.u3) annotation(
          Line(visible = true, points = {{23.5, -5.0}, {20.0, -5.0}, {20.0, 13.0}, {9.0, 13.1746}}, color = {0, 0, 191}));
        connect(PPD2.u2, LAD.y) annotation(
          Line(visible = true, points = {{9.0, 17.1746}, {13.0, 17.0}, {13.0, 32.0}, {-61.0, 31.9455}}, color = {0, 0, 191}));
        connect(PPD2.u4, IAD.y) annotation(
          Line(visible = true, points = {{9.0, 9.1746}, {13.0, 9.0}, {13.0, -21.2}, {16.4, -21.2}}, color = {0, 0, 191}));
        connect(PPD1.u4, RSD_delayed.massInPort) annotation(
          Line(visible = true, points = {{-26.0, 61.0}, {-26.0, 55.0}, {-120.0, 55.0}, {-120.0, 116.0}, {97.0, 116.0}, {97.0, 10.0}, {94.4, 10.0}}, color = {0, 0, 191}));
        connect(UND.y, PPD1.u3) annotation(
          Line(visible = true, points = {{15.1, 37.0}, {-22.0, 37.0}, {-22.0, 61.0}}, color = {0, 0, 191}));
        connect(PPD1.u2, UOD.y2) annotation(
          Line(visible = true, points = {{-18.0, 61.0}, {-18.0, 55.0}, {63.75, 55.0}, {63.75, 69.6}}, color = {0, 0, 191}));
        connect(PPD1.u4, rrd) annotation(
          Line(visible = true, points = {{-26.0, 61.0}, {-26.0, 55.0}, {-120.0, 55.0}, {-120.0, 116.0}, {97.0, 116.0}, {97.0, 80.0}, {110.0, 80.0}}, color = {0, 0, 191}));
        connect(PPD1.y, PPD.u) annotation(
          Line(visible = true, origin = {-20.0, 81.625}, points = {{0.0, -2.625}, {0.0, 2.625}}, color = {0, 0, 191}));
        connect(LAD.u2, Mail_Delay.state) annotation(
          Line(visible = true, points = {{-79.0, 33.9455}, {-92.0, 34.0}, {-92.0, 89.0}}, color = {0, 0, 191}));
        connect(LAD.u1, Order_Delay.state) annotation(
          Line(visible = true, points = {{-79.0, 37.9455}, {-85.0, 38.0}, {-85.0, 50.0}, {-52.0, 50.0}, {-52.0, 89.0}}, color = {0, 0, 191}));
        connect(Transporation_Delay.state, LAD.u4) annotation(
          Line(visible = true, points = {{-65.0, -19.0}, {-65.0, -6.0}, {-85.0, -6.0}, {-85.0, 26.0}, {-79.0, 25.9455}}, color = {0, 0, 191}));
        connect(uof, LAD.u3) annotation(
          Line(visible = true, points = {{-110.0, 30.0}, {-79.0, 29.9455}}, color = {0, 0, 191}));
        connect(Mail_Delay.massOutPort, rrf) annotation(
          Line(visible = true, points = {{-108.5, 100.0}, {-118.0, 100.0}, {-118.0, 70.0}, {-95.0, 70.0}, {-95.0, 80.0}, {-110.0, 80.0}}, color = {95, 0, 191}));
        connect(Mail_Delay.massInPort, Order_Delay.massOutPort) annotation(
          Line(visible = true, points = {{-75.5, 100.0}, {-68.5, 100.0}}, color = {95, 0, 191}));
        connect(PPD.y1, Order_Delay.massInPort) annotation(
          Line(visible = true, points = {{-27.5, 100.0}, {-35.5, 100.0}}, color = {95, 0, 191}));
        connect(Transporation_Delay.massOutPort, IAD.u1) annotation(
          Line(visible = true, points = {{-48.5, -30.0}, {12.4, -30.0}}, color = {95, 0, 191}));
        connect(Transporation_Delay.massInPort, ssf) annotation(
          Line(visible = true, points = {{-81.5, -30.0}, {-110.0, -30.0}}, color = {95, 0, 191}));
        connect(UND.u, RSD_delayed.massOutPort) annotation(
          Line(visible = true, points = {{52.9, 37.0}, {60.0, 37.0}, {60.0, 10.0}, {63.6, 10.0}}, color = {0, 0, 191}));
        connect(IDD.u, RSD_delayed.massOutPort) annotation(
          Line(visible = true, points = {{44.5, -5.0}, {60.0, -5.0}, {60.0, 10.0}, {63.6, 10.0}}, color = {0, 0, 191}));
        connect(uod, UOD.y4) annotation(
          Line(visible = true, points = {{110.0, 30.0}, {86.25, 30.0}, {86.25, 69.6}}, color = {0, 0, 191}));
        connect(STD.u1, UOD.y1) annotation(
          Line(visible = true, points = {{5.5, -86.0}, {0.0, -86.0}, {0.0, -60.0}, {-125.0, -60.0}, {-125.0, 120.0}, {55.0, 120.0}, {55.0, 88.8}, {62.25, 88.8}}, color = {0, 0, 191}));
        connect(UOD.u1, rrd) annotation(
          Line(visible = true, points = {{91.5, 80.0}, {110.0, 80.0}}, color = {95, 0, 191}));
        connect(ODD.y1, Sink1.MassInPort1) annotation(
          Line(visible = true, points = {{32.5, 80.0}, {21.0, 80.0}}, color = {95, 0, 191}));
        connect(UOD.u2, ODD.y) annotation(
          Line(visible = true, points = {{58.5, 80.0}, {47.5, 80.0}}, color = {95, 0, 191}));
        connect(Source1.MassInPort1, PPD.y) annotation(
          Line(visible = true, points = {{-1.0, 100.0}, {-12.5, 100.0}}, color = {95, 0, 191}));
        connect(SSD.y1, ssd) annotation(
          Line(visible = true, points = {{77.5, -30.0}, {110.0, -30.0}}, color = {95, 0, 191}));
        connect(SSD.y, IAD.u2) annotation(
          Line(visible = true, points = {{62.5, -30.0}, {47.6, -30.0}}, color = {95, 0, 191}));
        annotation(
          Icon(coordinateSystem(extent = {{-125.0, -125.0}, {125.0, 125.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, lineColor = {0, 0, 255}, extent = {{-100.0, -100.0}, {100.0, 100.0}}), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-0.0, 65.0}, {0.0, 101.0}}, textString = "%name", fontName = "Arial"), Polygon(visible = true, lineColor = {0, 0, 255}, fillColor = {191, 223, 159}, fillPattern = FillPattern.Solid, points = {{-70.0, -60.0}, {70.0, -60.0}, {70.0, 0.0}, {0.0, 20.0}, {-70.0, 0.0}, {-70.0, -60.0}}), Rectangle(visible = true, lineColor = {0, 0, 255}, fillColor = {255, 255, 0}, fillPattern = FillPattern.Solid, extent = {{-48.0, -60.0}, {-26.0, -32.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {255, 255, 0}, fillPattern = FillPattern.Solid, extent = {{-6.0, -2.0}, {8.0, 11.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{0.0, -80.0}, {10.0, -70.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {192, 192, 192}, fillPattern = FillPattern.Solid, extent = {{3.0, -77.0}, {8.0, -73.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{40.0, -80.0}, {50.0, -70.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {192, 192, 192}, fillPattern = FillPattern.Solid, extent = {{43.0, -77.0}, {48.0, -73.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{11.0, -80.0}, {21.0, -70.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {192, 192, 192}, fillPattern = FillPattern.Solid, extent = {{14.0, -77.0}, {19.0, -73.0}}), Polygon(visible = true, lineColor = {0, 0, 255}, fillColor = {160, 160, 160}, fillPattern = FillPattern.Solid, points = {{5.0, -63.0}, {-5.0, -63.0}, {-5.0, -68.0}, {20.0, -68.0}, {24.0, -74.0}, {38.0, -74.0}, {41.0, -69.0}, {49.0, -69.0}, {52.0, -74.0}, {55.0, -74.0}, {55.0, -63.0}, {42.0, -61.0}, {40.0, -54.0}, {32.0, -54.0}, {32.0, -63.0}, {5.0, -63.0}})}),
          Diagram(coordinateSystem(extent = {{-125.0, -125.0}, {125.0, 125.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{69.0, -51.0}, {71.0, -49.0}}), Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{96.0, 79.0}, {98.0, 81.0}}), Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{59.0, 17.0}, {61.0, 19.0}}), Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{59.0, 9.0}, {61.0, 11.0}}), Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{19.0, -6.0}, {21.0, -4.0}}), Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{-1.0, -96.0}, {1.0, -94.0}})}),
          Documentation(info = "<html>
This model describes the distribution network of produced goods.  Goods that are being distributed are represented by the mass-flow model in the lower part of the graph, whereas the orders for these goods are represented by the mass-flow models in the upper part of the graph.  The signal-flow model represents the control of the flow of goods based on the information obtained from their order status.
</html>"));
      end Distribution;