  package IndustrialDynamics "Factory models"
    extends Modelica.Icons.Example;

    package Inventory "Inventory model"
      extends Modelica.Icons.Example;

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

      model InventoryForresterSinOneYearCapacity "Inventory simulation with sinusoidal orders"
        parameter Real RRRiniTop(unit = "1/wk") = 1000 "Inital value of customer requests at retail";
        parameter Real RRDiniTop(unit = "1/wk") = RRRiniTop "Inital value of requisitions received at distribution";
        parameter Real RRFiniTop(unit = "1/wk") = RRRiniTop "Inital value of requisitions received at factory";
        output Real orders(unit = "1/wk") "Sinusoidal orders";
        output Real factoryFlow(unit = "1/wk") "Manufacturing flow at factory";
        output Real retailStock "Stock of goods in retail";
        output Real distributionStock "Stock of goods in distribution";
        output Real factoryStock "Stock of goods in factory";
        SystemDynamics.IndustrialDynamics.Inventory.Factory Factory1(RRFini = RRFiniTop, ALF = 1200) annotation(
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
          Line(visible = true, points = {{-15.97, -2.81}, {-17.86, -2.81}, {-17.86, -2.81}, {-19.75, -2.81}, {-19.75, -2.81}, {-23.53, -2.81}}, color = {95, 0, 191}));
        connect(Distribution1.uof, Factory1.uof) annotation(
          Line(visible = true, points = {{-15.97, 3.31}, {-17.86, 3.31}, {-17.86, 3.31}, {-19.75, 3.31}, {-19.75, 3.31}, {-23.53, 3.31}}, color = {0, 0, 191}));
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
 
The third simulation involves seasonal fluctuation of customers with a capacity limit of 1200 items/week in the factory.  The customer demand remains always below the manufacturing capacity limit; nevertheless, the manufacturing site must operate at its capacity limit for certain time periods, while at other times, it runs at 20% of its capacity only. <p>
 
<hr> <p>
 
Simulate the model across 120 weeks, and plot on one graph the incoming orders and the production flow in the factory and on a second graph the levels of goods in retail, distribution, and the factory as functions of time: <p>
<img src=\"modelica://SystemDynamics/Resources/Images/Inventory_3.png\"> <p>
 
<hr> <p>
</html>", revisions = ""));
      end InventoryForresterSinOneYearCapacity;

      model InventoryForresterStep "Inventory simulation with sinusoidal orders"
        parameter Real RRRiniTop(unit = "1/wk") = 1000 "Inital value of customer requests at retail";
        parameter Real RRDiniTop(unit = "1/wk") = RRRiniTop "Inital value of requisitions received at distribution";
        parameter Real RRFiniTop(unit = "1/wk") = RRRiniTop "Inital value of requisitions received at factory";
        output Real orders(unit = "1/wk") "Sinusoidal orders";
        output Real factoryFlow(unit = "1/wk") "Manufacturing flow at factory";
        output Real retailStock "Stock of goods in retail";
        output Real distributionStock "Stock of goods in distribution";
        output Real factoryStock "Stock of goods in factory";
        SystemDynamics.IndustrialDynamics.Inventory.Factory Factory1(RRFini = RRFiniTop, ALF = 1000 * RRFiniTop) annotation(
          Placement(visible = true, transformation(origin = {-34.75, 0.25}, extent = {{-12.75, -12.75}, {12.75, 12.75}}, rotation = 0)));
        SystemDynamics.IndustrialDynamics.Inventory.Distribution Distribution1(RRDini = RRDiniTop) annotation(
          Placement(visible = true, transformation(origin = {-4.75, 0.25}, extent = {{-12.75, -12.75}, {12.75, 12.75}}, rotation = 0)));
        SystemDynamics.IndustrialDynamics.Inventory.Retail Retail1(RRRini = RRRiniTop) annotation(
          Placement(visible = true, transformation(origin = {25.25, 0.25}, extent = {{-12.75, -12.75}, {12.75, 12.75}}, rotation = 0)));
        Modelica.Blocks.Sources.Step Orders(height = 100, offset = RRRiniTop, startTime = 10) annotation(
          Placement(visible = true, transformation(origin = {0.0, 30.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      equation
        connect(Orders.y, Retail1.rrr) annotation(
          Line(visible = true, points = {{11.0, 30.0}, {45.0, 30.0}, {45.0, 8.41}, {36.47, 8.41}}, color = {0, 0, 191}));
        connect(Retail1.ssd, Distribution1.ssd) annotation(
          Line(visible = true, points = {{14.03, -2.81}, {10.515, -2.81}, {10.515, -2.81}, {6.47, -2.81}}, color = {95, 0, 191}));
        connect(Retail1.uod, Distribution1.uod) annotation(
          Line(visible = true, points = {{14.03, 3.31}, {10.015, 3.31}, {10.015, 3.31}, {6.47, 3.31}}, color = {0, 0, 191}));
        connect(Distribution1.ssf, Factory1.ssf) annotation(
          Line(visible = true, points = {{-15.97, -2.81}, {-17.86, -2.81}, {-17.86, -2.81}, {-19.75, -2.81}, {-19.75, -2.81}, {-23.53, -2.81}}, color = {95, 0, 191}));
        connect(Distribution1.uof, Factory1.uof) annotation(
          Line(visible = true, points = {{-15.97, 3.31}, {-17.86, 3.31}, {-17.86, 3.31}, {-19.75, 3.31}, {-19.75, 3.31}, {-23.53, 3.31}}, color = {0, 0, 191}));
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
          experiment(StopTime = 90, Algorithm = "dassl"),
          Icon(coordinateSystem(extent = {{-50.0, -50.0}, {50.0, 50.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, lineColor = {0, 0, 255}, extent = {{1.0, -52.0}, {1.0, -39.0}}, textString = "%name", fontName = "Arial"), Rectangle(visible = true, lineColor = {0, 0, 255}, fillColor = {255, 255, 0}, fillPattern = FillPattern.Solid, extent = {{-40.0, -40.0}, {40.0, 50.0}}), Rectangle(visible = true, lineColor = {0, 0, 255}, fillColor = {127, 255, 0}, fillPattern = FillPattern.Solid, extent = {{-30.0, 23.0}, {30.0, 38.0}}), Rectangle(visible = true, lineColor = {0, 0, 255}, fillColor = {127, 255, 0}, fillPattern = FillPattern.Solid, extent = {{-30.0, -2.0}, {30.0, 13.0}}), Rectangle(visible = true, lineColor = {0, 0, 255}, fillColor = {127, 255, 0}, fillPattern = FillPattern.Solid, extent = {{-30.0, -27.0}, {30.0, -12.0}}), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-25.0, 25.0}, {27.0, 35.0}}, textString = "Factory", fontName = "Arial"), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-25.0, 1.0}, {27.0, 11.0}}, textString = "Distribution", fontName = "Arial"), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-25.0, -24.0}, {27.0, -14.0}}, textString = "Retail", fontName = "Arial"), Line(visible = true, points = {{0.0, 13.0}, {0.0, 23.0}}, color = {0, 0, 255}), Line(visible = true, points = {{0.0, -2.0}, {0.0, -12.0}}, color = {0, 0, 255})}),
          Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics),
          experimentSetupOutput,
          Documentation(info = "<html>
<b>Customer Demand Step</b> <p>
 
The fourth simulation involves a step in the incoming orders: <p>
<font color=red><b>RRR(t) = RRRini + if time > 10 then RRRoffset else 0;</b></font> <p>
 
<hr> <p>
 
Simulate the model across 90 weeks, and plot on one graph the incoming orders and the production flow in the factory and on a second graph the levels of goods in retail, distribution, and the factory as functions of time: <p>
<img src=\"modelica://SystemDynamics/Resources/Images/Inventory_4.png\"> <p>
 
<hr> <p>
</html>", revisions = ""));
      end InventoryForresterStep;

      package Utilities "Utility models of Forrester's inventory model"
        extends Modelica.Icons.Library;

        block DFD "Desired delay in filling orders"
          extends Interfaces.Nonlin_2;
          parameter Real DHD(unit = "wk") = 1 "Delay in handling";
          parameter Real DUD(unit = "wk") = 1 "Delay due to unfillable orders";
          output Real IAD "Actual produced goods in distribution";
          output Real IDD "Desired produced goods in distribution";
          output Real dfd(unit = "wk") "Desired delay in filling orders";
        equation
          IAD = u1;
          IDD = u2;
          dfd = DHD + DUD * IDD / IAD;
          y = dfd;
        end DFD;

        block DFF "Desired delay in filling orders"
          extends Interfaces.Nonlin_2;
          parameter Real DHF(unit = "wk") = 1 "Delay in handling";
          parameter Real DUF(unit = "wk") = 1 "Delay due to unfillable orders";
          output Real IAF "Actual produced goods in factory";
          output Real IDF "Desired produced goods in factory";
          output Real dff(unit = "wk") "Desired delay in filling orders";
        equation
          IAF = u1;
          IDF = u2;
          dff = DHF + DUF * IDF / IAF;
          y = dff;
        end DFF;

        block LAD "Actual delay in order processing"
          extends Interfaces.Nonlin_4;
          output Real CPD "Items delayed in order";
          output Real PMD "Items delayed in mail";
          output Real UOF "Unfilled orders";
          output Real MTD "Items delayed in transportation";
          output Real lad "Items delayed in order processing";
        equation
          CPD = u1;
          PMD = u2;
          UOF = u3;
          MTD = u4;
          lad = CPD + PMD + UOF + MTD;
          y = lad;
        end LAD;

        block LDD "Desired delay in order processing"
          extends Interfaces.Nonlin_2;
          parameter Real DCD(unit = "wk") = 2 "Clerical delay";
          parameter Real DMD(unit = "wk") = 0.5 "Mail delay";
          parameter Real DTD(unit = "wk") = 2 "Transportation delay";
          output Real RSD(unit = "1/wk") "Delayed new orders";
          output Real DFF(unit = "wk") "Desired delay in filling orders";
          output Real ldd "Desired delay in order processing";
        equation
          RSD = u1;
          DFF = u2;
          ldd = RSD * (DCD + DMD + DFF + DTD);
          y = ldd;
        end LDD;

        block MDF_d "Manufacturing rate at factory"
          extends Interfaces.Nonlin_1;
          parameter Real ALF(unit = "1/wk") = 1000000.0 "Manufacturing capacity limit at factory";
          output Real MWF(unit = "1/wk") "Manufacturing demand at factory";
          output Real MDF(unit = "1/wk") "Manufacturing rate at factory";
        equation
          MWF = u;
          MDF = if ALF >= MWF then MWF else ALF;
          y = MDF;
        end MDF_d;

        block MWF "Manufacturing demand at factory"
          extends Interfaces.Nonlin_4;
          parameter Real DIF(unit = "wk") = 4 "Delay in inventory (and pipeline) adjustment";
          output Real mwf1 "Partial manufacturing adjustment for factory";
          output Real UOF "Actual unfilled orders";
          output Real UNF "Desired unfilled orders";
          output Real RRF(unit = "1/wk") "New orders arriving";
          output Real mwf(unit = "1/wk") "Manufacturing demand at factory";
        equation
          mwf1 = u1;
          UOF = u2;
          UNF = u3;
          RRF = u4;
          mwf = RRF + 1 / DIF * (mwf1 + UOF - UNF);
          y = mwf;
        end MWF;

        block MWF1 "Partial manufacturing adjustment for factory"
          extends Interfaces.Nonlin_4;
          output Real LDF "Desired delays in order processing";
          output Real LAF "Actual delays in order processing";
          output Real IDF "Desired produced goods in factory";
          output Real IAF "Actual produced goods in factory";
          output Real mwf1 "Partial manufacturing adjustment for factory";
        equation
          LDF = u1;
          LAF = u2;
          IDF = u3;
          IAF = u4;
          mwf1 = LDF - LAF + IDF - IAF;
          y = mwf1;
        end MWF1;

        block PPD1 "Manufacturing demand at distribution"
          extends Interfaces.Nonlin_4;
          parameter Real DID(unit = "wk") = 4 "Delay in inventory (and pipeline) adjustment";
          output Real ppd2 "Partial manufacturing adjustment for distribution";
          output Real UOD "Actual unfilled orders";
          output Real UND "Desired unfilled orders";
          output Real RRD(unit = "1/wk") "New orders arriving";
          output Real ppd1(unit = "1/wk") "Manufacturing demand at distribution";
        equation
          ppd2 = u1;
          UOD = u2;
          UND = u3;
          RRD = u4;
          ppd1 = RRD + 1 / DID * (ppd2 + UOD - UND);
          y = ppd1;
        end PPD1;

        block PPD2 "Partial manufacturing adjustment for distribution"
          extends Interfaces.Nonlin_4;
          output Real LDD "Desired delays in order processing";
          output Real LAD "Actual delays in order processing";
          output Real IDD "Desired produced goods in distribution";
          output Real IAD "Actual produced goods in distribution";
          output Real ppd2 "Partial manufacturing adjustment for distribution";
        equation
          LDD = u1;
          LAD = u2;
          IDD = u3;
          IAD = u4;
          ppd2 = LDD - LAD + IDD - IAD;
          y = ppd2;
        end PPD2;

        block SSD_d "Delivery rate at distribution"
          extends Interfaces.Nonlin_2;
          output Real IAD(unit = "1/wk") "Available distribution capacity at distribution";
          output Real STD(unit = "1/wk") "Desired order filling rate";
          output Real SSD(unit = "1/wk") "Delivery rate at distribution";
        equation
          IAD = u1;
          STD = u2;
          SSD = if IAD > STD then STD else IAD;
          y = SSD;
        end SSD_d;

        block SSF_d "Delivery rate at factory"
          extends Interfaces.Nonlin_2;
          output Real IAF(unit = "1/wk") "Available distribution capacity at factory";
          output Real STF(unit = "1/wk") "Desired order filling rate";
          output Real SSF(unit = "1/wk") "Delivery rate at factory";
        equation
          IAF = u1;
          STF = u2;
          SSF = if IAF > STF then STF else IAF;
          y = SSF;
        end SSF_d;
        annotation(
          preferedView = "info",
          Documentation(info = "<html>
Utility models of Forrester's inventory model.
</html>"));
      end Utilities;
      annotation(
        preferedView = "info",
        Documentation(info = "<html>
In Forrester (1961), a factory-distribution-retail inventory system is discussed in depth, modeled with the System Dynamics notation. At the time, the models had to be constructed using textual representations (<font color=red><b>Dynamo</b></font>). This very system is re-implemented here graphically using the <font color=red><b>SystemDynamics</b></font> library of <font color=red><b>Modelica</b></font>, and the same simulations are carried out as are given in the book by Forrester. Effects of amplification, delays, and information feedback are demonstrated in the simulations. Among other things, it is shown, how small changes in retail sales can lead to large swings in factory production. <p>
 
The model is not introduced in detail at this place.  The interested reader is referred to Forrester (1961). Roughly, the system is divided into a retail, a distribution, and a factory part, each containing inventories for the goods (consumer goods, such as refrigerators, for example) and a corresponding logic for ordering or producing items to be sold to customers. The only input to the system is customer orders RRR (Requisitions Received at Retail), and the internal variables of the system (levels and rates) are to be investigated when customer demand fluctuates. <p>
 
<b>References:</b> <p>
 
<ol>
<li> Forrester, J.W. (1961), <a href=\"http://www.amazon.com/Forrester-Industrial-Dynamics-Jay-W/dp/0262060035\">Industrial Dynamics</a>, M.I.T. Press, 479p.
</ol> <p>
 
<hr> <p>
</html>"));
    end Inventory;
    annotation(
      preferedView = "info",
      Documentation(info = "<html>
The oldest research area, where the System Dynamics methodology has been employed, is in the description of <font color=red><b>industrial dynamics</b></font>.  In fact, this is the application area for which the methodology had originally been developed by <a href=\"http://en.wikipedia.org/wiki/Jay_Wright_Forrester\">Jay Forrester</a>. <p>
 
This package is designed to contain examples of such <font color=red><b>industrial dynamics</b></font> models. <p>
 
<b>References:</b> <p>
 
<ol>
<li> Forrester, J.W. (1961), <a href=\"http://www.amazon.com/Forrester-Industrial-Dynamics-Jay-W/dp/0262060035\">Industrial Dynamics</a>, M.I.T. Press, 479p.
<li> Hammer, M, and J. Champy (1994), <a href=\"http://www.amazon.com/Reengineering-Corporation-Manifesto-Business-Revolution/dp/0066621127\">Reengineering the Corporation: A Manifesto for Business Revolution</a>, Harper Business, New York, 257p.
</ol> <p>
 
<hr> <p>
</html>"));
  end IndustrialDynamics;