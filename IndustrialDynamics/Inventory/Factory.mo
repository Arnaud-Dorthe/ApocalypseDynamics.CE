      model Factory "Factory model"
        parameter Real AIF = 4 "Gain factor for inventory in factory";
        parameter Real ALF(unit = "1/wk") = 1000000.0 "Manufacturing capacity limit at factory";
        parameter Real DCF(unit = "wk") = 1 "Delay clerical";
        parameter Real DHF(unit = "wk") = 1 "Delay in handling";
        parameter Real DIF(unit = "wk") = 4 "Delay in inventory (and pipeline) adjustment";
        parameter Real DPF(unit = "wk") = 6 "Delay in production lead time at factory";
        parameter Real DRF(unit = "wk") = 8 "Delay in smoothing requisitions";
        parameter Real DUF(unit = "wk") = 1 "Delay due to unfillable orders";
        parameter Real RRFini(unit = "1/wk") = 1000 "initial requests at retail";
        final parameter Real RSFini = RRFini;
        final parameter Real IAFini = AIF * RSFini;
        final parameter Real UOFini = RSFini * (DHF + DUF);
        SystemDynamics.Sources.Source Source1 annotation(
          Placement(visible = true, transformation(origin = {-100.0, -40.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Rates.Rate_1 MDF "New orders arriving" annotation(
          Placement(visible = true, transformation(origin = {-75.0, -40.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = 0)));
        SystemDynamics.IndustrialDynamics.Inventory.Utilities.MDF_d MDF_d(ALF = ALF) "Manufacturing rate at factory" annotation(
          Placement(visible = true, transformation(origin = {-75.095, -75.095}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -270)));
        SystemDynamics.Levels.Level IAF(x0 = IAFini) "Produced goods in factory" annotation(
          Placement(visible = true, transformation(origin = {30.5, -40.0}, extent = {{-15.5, -16.0}, {15.5, 16.0}}, rotation = 0)));
        SystemDynamics.Rates.Rate_1 SSF "Goods leaving factory" annotation(
          Placement(visible = true, transformation(origin = {75.0, -40.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = 0)));
        SystemDynamics.IndustrialDynamics.Inventory.Utilities.SSF_d SSF_d "Delivery rate at factory" annotation(
          Placement(visible = true, transformation(origin = {75.095, -73.652}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -270)));
        SystemDynamics.Interfaces.MassOutPort ssf(unit = "1/wk") "Manufactured goods leaving factory" annotation(
          Placement(visible = true, transformation(origin = {110.0, -30.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {110.0, -30.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassInPort rrf(unit = "1/wk") "New order demands" annotation(
          Placement(visible = true, transformation(origin = {110.0, 80.0}, extent = {{10.0, -10.0}, {-10.0, 10.0}}, rotation = 0), iconTransformation(origin = {110.0, 80.0}, extent = {{10.0, -10.0}, {-10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Levels.Level UOF(x0 = UOFini) "Unfilled orders" annotation(
          Placement(visible = true, transformation(origin = {65.0, 90.0}, extent = {{15.0, -16.0}, {-15.0, 16.0}}, rotation = 0)));
        SystemDynamics.Rates.Rate_1 OFD "Orders filled due to delivery" annotation(
          Placement(visible = true, transformation(origin = {25.0, 90.0}, extent = {{15.0, -15.0}, {-15.0, 15.0}}, rotation = 0)));
        SystemDynamics.Sources.Sink Sink1 annotation(
          Placement(visible = true, transformation(origin = {-10.0, 90.0}, extent = {{10.0, -10.0}, {-10.0, 10.0}}, rotation = 0)));
        SystemDynamics.IndustrialDynamics.Inventory.Utilities.MWF MWF(DIF = DIF) "Manufacturing demand at factory" annotation(
          Placement(visible = true, transformation(origin = {-100.0, -10.0}, extent = {{-10.0, 10.0}, {10.0, -10.0}}, rotation = 180)));
        SystemDynamics.IndustrialDynamics.Inventory.Utilities.MWF1 MWF1 "Partial manufacturing adjustment for factory" annotation(
          Placement(visible = true, transformation(origin = {-80.0, 20.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -90)));
        SystemDynamics.Auxiliary.Gain UNF(k = DHF + DUF) "Desired unfilled orders" annotation(
          Placement(visible = true, transformation(origin = {16.0, -4.0}, extent = {{27.0, 13.0}, {-27.0, -13.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Gain IDF(k = AIF) "Desired produced goods in factory" annotation(
          Placement(visible = true, transformation(origin = {-1.0, 50.0}, extent = {{-15.0, -10.0}, {15.0, 10.0}}, rotation = -180)));
        Modelica.Blocks.Math.Add LAF "Actual delays in order processing" annotation(
          Placement(visible = true, transformation(origin = {-40.25, 18.75}, extent = {{-8.75, -7.75}, {8.75, 7.75}}, rotation = -270)));
        SystemDynamics.Auxiliary.Gain LDF(k = DCF + DPF) "Desired delays in order processing" annotation(
          Placement(visible = true, transformation(origin = {16.0, 25.0}, extent = {{27.0, 13.0}, {-27.0, -13.0}}, rotation = 0)));
        SystemDynamics.IndustrialDynamics.Inventory.Utilities.DFF DFF(DHF = DHF, DUF = DUF) "Desired delay in filling orders" annotation(
          Placement(visible = true, transformation(origin = {44.3566, -110.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        Modelica.Blocks.Math.Division STF "Desired order filling rate" annotation(
          Placement(visible = true, transformation(origin = {70.5, -105.5}, extent = {{-7.5, -7.5}, {7.5, 7.5}}, rotation = 0)));
        SystemDynamics.Interfaces.MassOutPort uof "Unfilled orders" annotation(
          Placement(visible = true, transformation(origin = {110.0, 30.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {110.0, 30.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassOutPort dff(unit = "wk") "Desired delay in filling orders" annotation(
          Placement(visible = true, transformation(origin = {110.0, -80.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {110.0, -80.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Functions.DELAY1 SRF_delayed(averaging_time(unit = "wk") = DRF, delay_init = RSFini * DRF) "Delayed new orders" annotation(
          Placement(visible = true, transformation(origin = {70.0, 25.0}, extent = {{14.0, -10.0}, {-14.0, 10.0}}, rotation = 0)));
        SystemDynamics.Functions.DELAY3 Order_Delay(averaging_time(unit = "wk") = DCF, delay_init = RRFini * DCF) "Delay of processing order due to capacity constraints in factory" annotation(
          Placement(visible = true, transformation(origin = {-45.5, -40.0}, extent = {{-14.5, -10.0}, {14.5, 10.0}}, rotation = 0)));
        SystemDynamics.Functions.DELAY3 Production_Delay(averaging_time(unit = "wk") = DPF, delay_init = RRFini * DPF) "Delay in processing order due to time needed for production" annotation(
          Placement(visible = true, transformation(origin = {-8.5, -40.0}, extent = {{-14.5, -10.0}, {14.5, 10.0}}, rotation = 0)));
      equation
        connect(Production_Delay.state, LAF.u2) annotation(
          Line(visible = true, points = {{-8.5, -29.0}, {-8.0, -29.0}, {-8.0, -25.0}, {-35.6, -25.0}, {-35.6, 8.25}}, color = {0, 0, 191}));
        connect(STF.y, SSF_d.u2) annotation(
          Line(visible = true, points = {{78.75, -105.5}, {85.0, -105.5}, {85.0, -90.0}, {79.0, -90.0}, {79.095, -82.652}}, color = {0, 0, 191}));
        connect(SSF_d.u1, IAF.y2) annotation(
          Line(visible = true, points = {{71.095, -82.652}, {71.0, -90.0}, {42.0, -90.0}, {42.0, -50.4}, {42.125, -50.4}}, color = {0, 0, 191}));
        connect(SSF_d.y, OFD.u) annotation(
          Line(visible = true, points = {{75.095, -64.652}, {75.0, -60.0}, {120.0, -60.0}, {120.0, 110.0}, {-25.0, 110.0}, {-25.0, 70.0}, {25.0, 70.0}, {25.0, 74.25}}, color = {0, 0, 191}));
        connect(SSF_d.y, SSF.u) annotation(
          Line(visible = true, points = {{75.095, -64.652}, {75.0, -55.75}}, color = {0, 0, 191}));
        connect(DFF.y, dff) annotation(
          Line(visible = true, points = {{53.0, -110.0}, {57.0, -110.0}, {57.0, -120.0}, {90.0, -120.0}, {90.0, -80.0}, {110.0, -80.0}}, color = {0, 0, 191}));
        connect(STF.u2, DFF.y) annotation(
          Line(visible = true, points = {{61.5, -110.0}, {53.0, -110.0}}, color = {0, 0, 191}));
        connect(IDF.y, DFF.u2) annotation(
          Line(visible = true, points = {{-11.5, 50.0}, {-125.0, 50.0}, {-125.0, -114.0}, {35.0, -114.0}}, color = {0, 0, 191}));
        connect(DFF.u1, IAF.y3) annotation(
          Line(visible = true, points = {{35.0, -106.0}, {30.5, -106.0}, {30.5, -50.4}}, color = {0, 0, 191}));
        connect(MWF.y, MDF_d.u) annotation(
          Line(visible = true, points = {{-109.0, -10.0}, {-115.0, -10.0}, {-115.0, -90.0}, {-75.0, -90.0}, {-75.095, -84.095}}, color = {0, 0, 191}));
        connect(MDF_d.y, MDF.u) annotation(
          Line(visible = true, points = {{-75.095, -66.095}, {-75.0, -55.75}}, color = {0, 0, 191}));
        connect(LDF.y, MWF1.u1) annotation(
          Line(visible = true, points = {{-2.9, 25.0}, {-20.0, 25.0}, {-20.0, 35.0}, {-74.0, 35.0}, {-74.0, 29.0}}, color = {0, 0, 191}));
        connect(MWF1.u3, IDF.y) annotation(
          Line(visible = true, origin = {-58.5, 43.0}, points = {{-23.5, -14.0}, {-23.5, 7.0}, {47.0, 7.0}}, color = {0, 0, 191}));
        connect(LAF.y, MWF1.u2) annotation(
          Line(visible = true, points = {{-40.25, 28.375}, {-40.25, 45.0}, {-78.0, 45.0}, {-78.0, 29.0}}, color = {0, 0, 191}));
        connect(MWF1.u4, IAF.y4) annotation(
          Line(visible = true, points = {{-86.0, 29.0}, {-86.0, 35.0}, {-120.0, 35.0}, {-120.0, -95.0}, {18.875, -95.0}, {18.875, -50.4}}, color = {0, 0, 191}));
        connect(MWF1.y, MWF.u1) annotation(
          Line(visible = true, origin = {-83.6667, 1.0}, points = {{3.6667, 10.0}, {3.6667, -5.0}, {-7.3333, -5.0}}, color = {0, 0, 191}));
        connect(MWF.u4, SRF_delayed.massInPort) annotation(
          Line(visible = true, points = {{-91.0, -16.0}, {90.0, -16.0}, {90.0, 25.0}, {85.4, 25.0}}, color = {0, 0, 191}));
        connect(UNF.y, MWF.u3) annotation(
          Line(visible = true, points = {{-2.9, -4.0}, {-55.0, -4.0}, {-55.0, -12.0}, {-91.0, -12.0}}, color = {0, 0, 191}));
        connect(MWF.u2, UOF.y2) annotation(
          Line(visible = true, points = {{-91.0, -8.0}, {-60.0, -8.0}, {-60.0, 65.0}, {54.0, 65.0}, {54.0, 79.6}, {53.75, 79.6}}, color = {0, 0, 191}));
        connect(MWF.u4, rrf) annotation(
          Line(visible = true, points = {{-91.0, -16.0}, {90.0, -16.0}, {90.0, 80.0}, {110.0, 80.0}}, color = {0, 0, 191}));
        connect(Order_Delay.state, LAF.u1) annotation(
          Line(visible = true, points = {{-45.5, -29.0}, {-44.9, 8.25}}, color = {0, 0, 191}));
        connect(MDF.y1, Order_Delay.massInPort) annotation(
          Line(visible = true, points = {{-67.5, -40.0}, {-61.45, -40.0}}, color = {95, 0, 191}));
        connect(Order_Delay.massOutPort, Production_Delay.massInPort) annotation(
          Line(visible = true, points = {{-29.55, -40.0}, {-24.45, -40.0}}, color = {95, 0, 191}));
        connect(Production_Delay.massOutPort, IAF.u1) annotation(
          Line(visible = true, points = {{7.45, -40.0}, {13.45, -40.0}}, color = {95, 0, 191}));
        connect(IDF.u, SRF_delayed.massOutPort) annotation(
          Line(visible = true, points = {{9.5, 50.0}, {45.0, 50.0}, {45.0, 25.0}, {54.6, 25.0}}, color = {0, 0, 191}));
        connect(UNF.u, SRF_delayed.massOutPort) annotation(
          Line(visible = true, points = {{34.9, -4.0}, {45.0, -4.0}, {45.0, 25.0}, {54.6, 25.0}}, color = {0, 0, 191}));
        connect(LDF.u, SRF_delayed.massOutPort) annotation(
          Line(visible = true, points = {{34.9, 25.0}, {54.6, 25.0}}, color = {0, 0, 191}));
        connect(UOF.u1, rrf) annotation(
          Line(visible = true, points = {{81.5, 90.0}, {90.0, 90.0}, {90.0, 80.0}, {110.0, 80.0}}, color = {95, 0, 191}));
        connect(uof, UOF.y4) annotation(
          Line(visible = true, points = {{110.0, 30.0}, {95.0, 30.0}, {95.0, 60.0}, {76.25, 60.0}, {76.25, 79.6}}, color = {0, 0, 191}));
        connect(SSF.y1, ssf) annotation(
          Line(visible = true, points = {{82.5, -40.0}, {90.0, -40.0}, {90.0, -30.0}, {110.0, -30.0}}, color = {95, 0, 191}));
        connect(STF.u1, UOF.y3) annotation(
          Line(visible = true, points = {{61.5, -101.0}, {50.0, -101.0}, {50.0, 60.0}, {65.0, 60.0}, {65.0, 79.6}}, color = {0, 0, 191}));
        connect(Sink1.MassInPort1, OFD.y1) annotation(
          Line(visible = true, points = {{1.0, 90.0}, {17.5, 90.0}}, color = {95, 0, 191}));
        connect(OFD.y, UOF.u2) annotation(
          Line(visible = true, points = {{32.5, 90.0}, {48.5, 90.0}}, color = {95, 0, 191}));
        connect(IAF.u2, SSF.y) annotation(
          Line(visible = true, points = {{47.55, -40.0}, {67.5, -40.0}}, color = {95, 0, 191}));
        connect(Source1.MassInPort1, MDF.y) annotation(
          Line(visible = true, points = {{-89.0, -40.0}, {-82.5, -40.0}}, color = {95, 0, 191}));
        annotation(
          Icon(coordinateSystem(extent = {{-125.0, -125.0}, {125.0, 125.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, lineColor = {0, 0, 255}, extent = {{-100.0, -100.0}, {100.0, 100.0}}), Polygon(visible = true, lineColor = {0, 0, 255}, fillColor = {159, 223, 159}, fillPattern = FillPattern.Solid, points = {{-70.0, 0.0}, {-70.0, -60.0}, {80.0, -60.0}, {80.0, 0.0}, {60.0, 20.0}, {50.0, 0.0}, {30.0, 20.0}, {20.0, 0.0}, {0.0, 20.0}, {-10.0, 0.0}, {-30.0, 20.0}, {-40.0, 0.0}, {-60.0, 20.0}, {-70.0, 0.0}, {-70.0, 0.0}}), Polygon(visible = true, lineColor = {0, 0, 255}, fillColor = {159, 223, 159}, fillPattern = FillPattern.Solid, points = {{-50.0, 10.0}, {-40.0, 0.0}, {-34.0, 12.0}, {-34.0, 70.0}, {-50.0, 70.0}, {-50.0, 10.0}}), Rectangle(visible = true, lineColor = {0, 0, 255}, fillColor = {255, 255, 0}, fillPattern = FillPattern.Solid, extent = {{-41.0, -60.0}, {-20.0, -29.0}}), Rectangle(visible = true, lineColor = {0, 0, 255}, fillColor = {255, 255, 0}, fillPattern = FillPattern.Solid, extent = {{-6.0, -20.0}, {14.0, -9.0}}), Rectangle(visible = true, lineColor = {0, 0, 255}, fillColor = {255, 255, 0}, fillPattern = FillPattern.Solid, extent = {{35.0, -20.0}, {55.0, -9.0}}), Rectangle(visible = true, lineColor = {0, 0, 255}, fillColor = {255, 255, 0}, fillPattern = FillPattern.Solid, extent = {{-5.0, -48.0}, {15.0, -37.0}}), Rectangle(visible = true, lineColor = {0, 0, 255}, fillColor = {255, 255, 0}, fillPattern = FillPattern.Solid, extent = {{-46.0, -19.0}, {-26.0, -8.0}}), Rectangle(visible = true, lineColor = {0, 0, 255}, fillColor = {255, 255, 0}, fillPattern = FillPattern.Solid, extent = {{35.0, -48.0}, {55.0, -37.0}}), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-0.0, 65.0}, {0.0, 101.0}}, textString = "%name", fontName = "Arial")}),
          Diagram(coordinateSystem(extent = {{-125.0, -125.0}, {125.0, 125.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{74.0, -61.0}, {76.0, -59.0}}), Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{89.0, 79.0}, {91.0, 81.0}}), Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{89.0, 24.0}, {91.0, 26.0}}), Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{44.0, 24.0}, {46.0, 26.0}}), Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{-83.0, 49.0}, {-81.0, 51.0}}), Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{56.0, -111.0}, {58.0, -109.0}})}),
          Documentation(info = "<html>
This model describes the factory floor.  Goods under production are represented by the mass-flow model in the lower part of the graph, whereas incoming orders for these goods are represented by the mass-flow model in the upper-right part of the graph.  The signal-flow model represents the control of the production of new items based on the information obtained from the incoming orders.
</html>"));
      end Factory;