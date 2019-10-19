  package PopulationDynamics "Ecological models"
    extends Modelica.Icons.Example;

    package LarchBudMoth "Model of larch bud moth population dynamics"
      extends Modelica.Icons.Example annotation(
        Documentation(info = "<html>
The larch bud moth model describes the population dynamics of the larch bud moth insect in the upper Engiadina valley of Switzerland. <p>
 
<hr> <p>
 
<b>References:</b> <p>
 
<ol>
<li> Cellier, F.E. (1991), <a href=\"http://www.amazon.com/Continuous-System-Modeling-Fran%C3%A7ois-Cellier/dp/0387975020\">Continuous System Modeling</a>, Springer-Verlag, New York, ISBN: 0-387-97502-0, 755p.
<li> Fischlin, A. and W. Baltensweiler (1979), \"Systems Analysis of the Larch Bud Moth System.  Part I: The Larch - Larch Bud Moth Relationship,\" <i>Mitteilungen der Schweizerischen Entomologischen Gesellschaft</i>, <b>52</b>, pp.273-289.
</ol> <p>
 
<hr> <p>
</html>"),
        preferedView = "info");

      block Starvation "Starvation function"
        extends Interfaces.Nonlin_2;
        output Real foliage;
        output Real food_demand;
        output Real starvation;
      equation
        foliage = u1;
        food_demand = u2;
        starvation = exp(-foliage / food_demand);
        y = starvation;
        annotation(
          Documentation(info = "<html>
Model of starvation function.
</html>"));
      end Starvation;

      block Defoliation "Defoliation function"
        extends Interfaces.Nonlin_3;
        output Real foliage;
        output Real food_demand;
        output Real starvation;
        output Real defoliation;
      equation
        foliage = u1;
        food_demand = u2;
        starvation = u3;
        defoliation = (1.0 - starvation) * food_demand / foliage;
        y = defoliation;
        annotation(
          Documentation(info = "<html>
Model of defoliation function.
</html>"));
      end Defoliation;

      model Grecr "Raw fiber content function"
        extends Interfaces.Nonlin_2;
        output Real defoliation "First input";
        output Real rawfiber "Second input";
        output Real zraw "Auxiliary variable";
        output Real grecr1 "Auxiliary variable";
        output Real grecr2 "Auxiliary variable";
        output Real grecr3 "Auxiliary variable";
        output Real grecr4 "Auxiliary variable";
        output Real grecr "Output variable";
      equation
        defoliation = u1;
        rawfiber = u2;
        zraw = 0.425 + sqrt((18.0 - rawfiber) / max([(rawfiber - 11.99) ^ 2, 0.01]));
        grecr1 = if zraw > rawfiber - 11.99 then 11.99 / rawfiber else 1.0 - zraw / rawfiber;
        grecr2 = if rawfiber > 11.99 then grecr1 else 1.0;
        grecr3 = 1.0 + (defoliation - 0.4) * (18.0 - rawfiber) / (0.4 * rawfiber);
        grecr4 = 18.0 / rawfiber;
        grecr = if defoliation < 0.4 then grecr2 else if defoliation < 0.8 then grecr3 else grecr4;
        y = grecr;
        annotation(
          Documentation(info = "<html>
This function models the change in raw fiber content as a function of defoliation.
</html>"));
      end Grecr;

      block Logarithm "Logarithmic transformation"
        extends Interfaces.Nonlin_1;
      equation
        y = Modelica.Math.log10(u);
        annotation(
          Documentation(info = "<html>
Logarithmic transformation.
</html>"));
      end Logarithm;

      model LBM "Larch bud moth population dynamics model"
        parameter Real wintermortality = 0.5728 "Percentage of eggs dying during the winter";
        parameter Modelica.SIunits.Mass biomass = 91.3 "Dry needle biomass per tree";
        parameter Integer nbr_trees = 511147 "Number of trees";
        parameter Integer egg0 = 4765975 "Initial number of eggs";
        parameter Real rawfiber0 = 15.0 "Initial rawfiber";
        output Real LogDensitySim "Simulated logarithmic larvae density";
        output Real LogDensityMeas "Measured logarithmic larvae density";
        SystemDynamics.Sources.Source Source1 annotation(
          Placement(visible = true, transformation(origin = {-160.0, 160.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Rates.Rate_1 NewEggs annotation(
          Placement(visible = true, transformation(origin = {-110.0, 160.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.Levels.DiscreteLevel Eggs(x0 = egg0) annotation(
          Placement(visible = true, transformation(origin = {-50.0, 160.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.Rates.Rate_1 OldEggs annotation(
          Placement(visible = true, transformation(origin = {10.0, 160.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.Sources.Sink Sink1 annotation(
          Placement(visible = true, transformation(origin = {60.0, 160.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Gain Hatching(k = 1.0 - wintermortality) annotation(
          Placement(visible = true, transformation(origin = {-10.0, 90.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.Levels.DiscreteLevel Rawfiber(x0 = rawfiber0) annotation(
          Placement(visible = true, transformation(origin = {-10.0, -50.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.Rates.Rate_1 NewFiber annotation(
          Placement(visible = true, transformation(origin = {-70.0, -50.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.Sources.Source Source2 annotation(
          Placement(visible = true, transformation(origin = {-110.0, -50.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Rates.Rate_1 OldFiber annotation(
          Placement(visible = true, transformation(origin = {52.0, -50.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.Sources.Sink Sink2 annotation(
          Placement(visible = true, transformation(origin = {90.0, -50.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Functions.Linear Incoincidence(m = 0.05112, b = -0.17932) annotation(
          Placement(visible = true, transformation(origin = {-15.0, 25.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = 0)));
        SystemDynamics.Functions.Linear Coincidence(m = -1.0, b = 1.0) annotation(
          Placement(visible = true, transformation(origin = {25.0, 25.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Prod_2 Prod_2_1 annotation(
          Placement(visible = true, transformation(origin = {34.0, 66.0}, extent = {{-16.0, -16.0}, {16.0, 16.0}}, rotation = -90)));
        SystemDynamics.Functions.Linear Weakening(m = 0.124017, b = -1.435284) annotation(
          Placement(visible = true, transformation(origin = {35.0, -11.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = 0)));
        SystemDynamics.Functions.Linear Physiology(m = -1.0, b = 1.0) annotation(
          Placement(visible = true, transformation(origin = {77.0, -11.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = 0)));
        SystemDynamics.Functions.Linear TreeFoliage(m = -2.25933, b = 67.38939) annotation(
          Placement(visible = true, transformation(origin = {-15.0, -113.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Prod_2 Prod_2_2 annotation(
          Placement(visible = true, transformation(origin = {20.0, -135.0}, extent = {{-16.0, -15.0}, {16.0, 15.0}}, rotation = -90)));
        SystemDynamics.Auxiliary.Const NbrTrees(k = nbr_trees) annotation(
          Placement(visible = true, transformation(origin = {20.0, -170.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.PopulationDynamics.LarchBudMoth.Starvation Starvation1 annotation(
          Placement(visible = true, transformation(origin = {70.0, -130.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Gain FoodDemand(k = 0.005472) annotation(
          Placement(visible = true, transformation(origin = {94.0, 25.0}, extent = {{-16.0, -15.0}, {16.0, 15.0}}, rotation = 0)));
        SystemDynamics.Functions.Linear FoodSupply(m = -1.0, b = 1.0) annotation(
          Placement(visible = true, transformation(origin = {115.0, -130.0}, extent = {{-15.0, -16.0}, {15.0, 16.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Prod_3 Prod_3_1 annotation(
          Placement(visible = true, transformation(origin = {145.0, -11.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = -450)));
        SystemDynamics.Auxiliary.Gain SexRatio(k = 0.44) annotation(
          Placement(visible = true, transformation(origin = {114.0, 120.0}, extent = {{20.0, -20.0}, {-20.0, 20.0}}, rotation = 0)));
        SystemDynamics.Functions.Linear Fecundity(m = -18.475457, b = 356.72636) annotation(
          Placement(visible = true, transformation(origin = {-85.0, -113.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Prod_2 Prod_2_3 annotation(
          Placement(visible = true, transformation(origin = {-146.0, 85.0}, extent = {{-16.0, -15.0}, {16.0, 15.0}}, rotation = -90)));
        SystemDynamics.PopulationDynamics.LarchBudMoth.Defoliation Defoliation1 annotation(
          Placement(visible = true, transformation(origin = {90.0, -190.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.PopulationDynamics.LarchBudMoth.Grecr Grecr1 annotation(
          Placement(visible = true, transformation(origin = {150.0, -190.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Prod_2 Prod_2_4 annotation(
          Placement(visible = true, transformation(origin = {-130.0, -191.0}, extent = {{16.0, -15.0}, {-16.0, 15.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Gain LarvaeDensity(k = 1.0 / (biomass * nbr_trees)) annotation(
          Placement(visible = true, transformation(origin = {192.0, 66.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.PopulationDynamics.LarchBudMoth.Logarithm Logarithm1 annotation(
          Placement(visible = true, transformation(origin = {233.0, 66.0}, extent = {{-15.0, -16.0}, {15.0, 16.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular Measurement(x_vals = 1949:1978, y_vals = {0.018, 0.082, 0.444, 4.174, 68.797, 331.76, 126.541, 21.28, 2.246, 0.085, 0.08, 0.371, 1.638, 22.878, 248.817, 184.272, 3.116, 0.019, 0.002, 0.059, 0.197, 1.068, 10.569, 173.932, 249.612, 176.023, 4.749, 0.014, 0.008, 0.056}) annotation(
          Placement(visible = true, transformation(origin = {192.0265, -50.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        Logarithm Logarithm2 annotation(
          Placement(visible = true, transformation(origin = {241.0, -50.0}, extent = {{-15.0, -16.0}, {15.0, 16.0}}, rotation = 0)));
      equation
        connect(Measurement.y, Logarithm2.u) annotation(
          Line(visible = true, origin = {220.7633, -50.0}, points = {{-6.7367, 0.0}, {6.7367, 0.0}}, color = {0, 0, 191}));
        connect(NbrTrees.y, Prod_2_2.u2) annotation(
          Line(visible = true, points = {{20.0, -156.0}, {20.0, -146.2}}, color = {0, 0, 191}));
        connect(Starvation1.u1, Prod_2_2.y) annotation(
          Line(visible = true, points = {{52.0, -122.0}, {40.0, -122.0}, {40.0, -135.0}, {30.5, -135.0}}, color = {0, 0, 191}));
        connect(Defoliation1.u1, Prod_2_2.y) annotation(
          Line(visible = true, points = {{72.0, -178.0}, {40.0, -178.0}, {40.0, -135.0}, {30.5, -135.0}}, color = {0, 0, 191}));
        connect(Prod_2_2.u1, TreeFoliage.y) annotation(
          Line(visible = true, points = {{20.0, -123.8}, {20.0, -113.0}, {-1.5, -113.0}}, color = {0, 0, 191}));
        connect(Prod_3_1.y, SexRatio.u) annotation(
          Line(visible = true, points = {{155.5, -11.0}, {164.0, -11.0}, {164.0, 120.0}, {128.0, 120.0}}, color = {0, 0, 191}));
        connect(LarvaeDensity.u, Prod_3_1.u1) annotation(
          Line(visible = true, points = {{178.0, 66.0}, {145.0, 66.0}, {145.0, -0.5}}, color = {0, 0, 191}));
        connect(Physiology.y, Prod_3_1.u2) annotation(
          Line(visible = true, points = {{90.5, -11.0}, {111.25, -11.0}, {111.25, -11.0}, {134.5, -11.0}}, color = {0, 0, 191}));
        connect(FoodSupply.y, Prod_3_1.u3) annotation(
          Line(visible = true, points = {{128.5, -130.0}, {145.0, -130.0}, {145.0, -21.5}}, color = {0, 0, 191}));
        connect(Prod_2_1.u1, Hatching.y) annotation(
          Line(visible = true, points = {{34.0, 77.2}, {34.0, 90.0}, {4.0, 90.0}}, color = {0, 0, 191}));
        connect(LarvaeDensity.u, Prod_2_1.y) annotation(
          Line(visible = true, points = {{178.0, 66.0}, {45.2, 66.0}}, color = {0, 0, 191}));
        connect(FoodDemand.u, Prod_2_1.y) annotation(
          Line(visible = true, points = {{82.8, 25.0}, {60.0, 25.0}, {60.0, 66.0}, {45.2, 66.0}}, color = {0, 0, 191}));
        connect(Coincidence.y, Prod_2_1.u2) annotation(
          Line(visible = true, points = {{38.5, 25.0}, {50.0, 25.0}, {50.0, 46.0}, {34.0, 46.0}, {34.0, 54.8}}, color = {0, 0, 191}));
        connect(Fecundity.y, Prod_2_3.u2) annotation(
          Line(visible = true, points = {{-71.5, -113.0}, {-60.0, -113.0}, {-60.0, -160.0}, {-146.0, -160.0}, {-146.0, 73.8}}, color = {0, 0, 191}));
        connect(Prod_2_3.u1, SexRatio.y) annotation(
          Line(visible = true, points = {{-146.0, 96.2}, {-146.0, 120.0}, {100.0, 120.0}}, color = {0, 0, 191}));
        connect(Prod_2_3.y, NewEggs.u) annotation(
          Line(visible = true, points = {{-135.5, 85.0}, {-110.0, 85.0}, {-110.0, 139.0}}, color = {0, 0, 191}));
        connect(LarvaeDensity.y, Logarithm1.u) annotation(
          Line(visible = true, points = {{206.0, 66.0}, {219.5, 66.0}}, color = {0, 0, 191}));
        connect(Incoincidence.y, Coincidence.u) annotation(
          Line(visible = true, points = {{-1.5, 25.0}, {4.25, 25.0}, {4.25, 25.0}, {11.5, 25.0}}, color = {0, 0, 191}));
        connect(Incoincidence.u, Rawfiber.y1) annotation(
          Line(visible = true, points = {{-28.5, 25.0}, {-40.0, 25.0}, {-40.0, -39.0}, {-27.0, -39.0}}, color = {0, 0, 191}));
        connect(Weakening.u, Rawfiber.y5) annotation(
          Line(visible = true, points = {{21.5, -11.0}, {12.0, -11.0}, {12.0, -39.0}, {7.0, -39.0}}, color = {0, 0, 191}));
        connect(Weakening.y, Physiology.u) annotation(
          Line(visible = true, points = {{48.5, -11.0}, {55.25, -11.0}, {55.25, -11.0}, {63.5, -11.0}}, color = {0, 0, 191}));
        connect(FoodDemand.y, Starvation1.u2) annotation(
          Line(visible = true, points = {{105.2, 25.0}, {120.0, 25.0}, {120.0, -100.0}, {46.0, -100.0}, {46.0, -138.0}, {52.0, -138.0}}, color = {0, 0, 191}));
        connect(Defoliation1.u2, Starvation1.u2) annotation(
          Line(visible = true, points = {{72.0, -190.0}, {46.0, -190.0}, {46.0, -138.0}, {52.0, -138.0}}, color = {0, 0, 191}));
        connect(Defoliation1.u3, Starvation1.y) annotation(
          Line(visible = true, points = {{72.0, -202.0}, {60.0, -202.0}, {60.0, -160.0}, {94.0, -160.0}, {94.0, -130.0}, {88.0, -130.0}}, color = {0, 0, 191}));
        connect(Starvation1.y, FoodSupply.u) annotation(
          Line(visible = true, points = {{88.0, -130.0}, {101.5, -130.0}}, color = {0, 0, 191}));
        connect(Defoliation1.y, Grecr1.u1) annotation(
          Line(visible = true, points = {{108.0, -190.0}, {120.0, -190.0}, {120.0, -182.0}, {132.0, -182.0}}, color = {0, 0, 191}));
        connect(Grecr1.y, Prod_2_4.u2) annotation(
          Line(visible = true, points = {{168.0, -190.0}, {190.0, -190.0}, {190.0, -222.0}, {-160.0, -222.0}, {-160.0, -191.0}, {-141.2, -191.0}}, color = {0, 0, 191}));
        connect(Grecr1.u2, Rawfiber.y2) annotation(
          Line(visible = true, points = {{132.0, -198.0}, {120.0, -198.0}, {120.0, -216.0}, {-50.0, -216.0}, {-50.0, -84.0}, {-25.0, -84.0}, {-25.0, -63.0}}, color = {0, 0, 191}));
        connect(Prod_2_4.u1, Grecr1.u2) annotation(
          Line(visible = true, points = {{-118.8, -191.0}, {-50.0, -191.0}, {-50.0, -216.0}, {120.0, -216.0}, {120.0, -198.0}, {132.0, -198.0}}, color = {0, 0, 191}));
        connect(Fecundity.u, Rawfiber.y2) annotation(
          Line(visible = true, points = {{-98.5, -113.0}, {-110.0, -113.0}, {-110.0, -84.0}, {-25.0, -84.0}, {-25.0, -63.0}}, color = {0, 0, 191}));
        connect(TreeFoliage.u, Rawfiber.y3) annotation(
          Line(visible = true, points = {{-28.5, -113.0}, {-40.0, -113.0}, {-40.0, -90.0}, {-10.0, -90.0}, {-10.0, -63.0}}, color = {0, 0, 191}));
        connect(Prod_2_4.y, NewFiber.u) annotation(
          Line(visible = true, points = {{-130.0, -180.5}, {-130.0, -78.0}, {-70.0, -78.0}, {-70.0, -71.0}}, color = {0, 0, 191}));
        connect(OldFiber.u, Rawfiber.y4) annotation(
          Line(visible = true, points = {{52.0, -71.0}, {52.0, -78.0}, {5.0, -78.0}, {5.0, -63.0}}, color = {0, 0, 191}));
        connect(OldFiber.y1, Sink2.MassInPort1) annotation(
          Line(visible = true, points = {{62.0, -50.0}, {70.0, -50.0}, {70.0, -50.0}, {79.0, -50.0}}, color = {191, 0, 191}));
        connect(Rawfiber.u2, OldFiber.y) annotation(
          Line(visible = true, points = {{12.0, -50.0}, {42.0, -50.0}}, color = {191, 0, 191}));
        connect(NewFiber.y1, Rawfiber.u1) annotation(
          Line(visible = true, points = {{-60.0, -50.0}, {-32.0, -50.0}}, color = {191, 0, 191}));
        connect(Source2.MassInPort1, NewFiber.y) annotation(
          Line(visible = true, points = {{-99.0, -50.0}, {-80.0, -50.0}}, color = {191, 0, 191}));
        connect(OldEggs.y1, Sink1.MassInPort1) annotation(
          Line(visible = true, points = {{20.0, 160.0}, {49.0, 160.0}}, color = {191, 0, 191}));
        connect(Eggs.u2, OldEggs.y) annotation(
          Line(visible = true, points = {{-28.0, 160.0}, {0.0, 160.0}}, color = {191, 0, 191}));
        connect(Source1.MassInPort1, NewEggs.y) annotation(
          Line(visible = true, points = {{-149.0, 160.0}, {-120.0, 160.0}}, color = {191, 0, 191}));
        connect(NewEggs.y1, Eggs.u1) annotation(
          Line(visible = true, points = {{-100.0, 160.0}, {-72.0, 160.0}}, color = {191, 0, 191}));
        connect(OldEggs.u, Eggs.y4) annotation(
          Line(visible = true, points = {{10.0, 139.0}, {10.0, 130.0}, {-35.0, 130.0}, {-35.0, 147.0}}, color = {0, 0, 191}));
        connect(Hatching.u, Eggs.y3) annotation(
          Line(visible = true, points = {{-24.0, 90.0}, {-50.0, 90.0}, {-50.0, 147.0}}, color = {0, 0, 191}));
        LogDensitySim = Logarithm1.y;
        Measurement.u = time;
        LogDensityMeas = Logarithm2.y;
        annotation(
          Icon(coordinateSystem(extent = {{-100.0, -100.0}, {140.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, fillColor = {160, 160, 160}, fillPattern = FillPattern.Solid, extent = {{-100.0, -100.0}, {140.0, 100.0}}), Text(visible = true, lineColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{-82.0, 16.0}, {124.0, 76.0}}, textString = "Larch bud moth", fontName = "Arial"), Text(visible = true, origin = {-0.51, -14.0}, lineColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{-53.6054, -16.0}, {100.51, 8.0}}, textString = "dynamics of the larch bud moth", fontName = "Arial"), Text(visible = true, origin = {-9.8174, -11.9208}, lineColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{-60.1826, 0.0}, {124.664, 30.0}}, textString = "The model describes the population", fontName = "Arial"), Text(visible = true, origin = {14.4661, -16.0}, lineColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{-21.1707, -34.0}, {40.8293, -14.0}}, textString = "in Switzerland", fontName = "Arial")}),
          Diagram(coordinateSystem(extent = {{-200.0, -240.0}, {280.0, 200.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{58.0, 64.0}, {62.0, 68.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{38.0, -137.0}, {42.0, -133.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{44.0, -140.0}, {48.0, -136.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{92.0, -132.0}, {96.0, -128.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{-52.0, -86.0}, {-48.0, -82.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{-52.0, -193.0}, {-48.0, -189.0}}), Text(visible = true, lineColor = {0, 0, 255}, fillColor = {128, 128, 128}, extent = {{12.0, 92.0}, {60.0, 102.0}}, textString = "small Larvae", fontName = "Arial"), Text(visible = true, lineColor = {0, 0, 255}, fillColor = {128, 128, 128}, extent = {{80.0, 68.0}, {128.0, 78.0}}, textString = "large Larvae", fontName = "Arial"), Text(visible = true, lineColor = {0, 0, 255}, fillColor = {128, 128, 128}, extent = {{126.0, 124.0}, {174.0, 134.0}}, textString = "Insects", fontName = "Arial"), Text(visible = true, lineColor = {0, 0, 255}, fillColor = {128, 128, 128}, extent = {{24.0, 122.0}, {72.0, 132.0}}, textString = "Females", fontName = "Arial"), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{143.0, 64.0}, {147.0, 68.0}})}),
          experiment(StartTime = 1949, StopTime = 1978),
          experimentSetupOutput,
          Documentation(info = "<html>
The larch bud moth model describes the population dynamics of the larch bud moth insect in the upper Engiadina valley of Switzerland. <p>
 
<hr> <p>
 
<b>References:</b> <p>
 
<ol>
<li> Cellier, F.E. (1991), <a href=\"http://www.amazon.com/Continuous-System-Modeling-Fran%C3%A7ois-Cellier/dp/0387975020\">Continuous System Modeling</a>, Springer-Verlag, New York, ISBN: 0-387-97502-0, 755p.
<li> Fischlin, A. and W. Baltensweiler (1979), \"Systems Analysis of the Larch Bud Moth System.  Part I: The Larch - Larch Bud Moth Relationship,\" <i>Mitteilungen der Schweizerischen Entomologischen Gesellschaft</i>, <b>52</b>, pp.273-289.
</ol> <p>
 
<hr> <p>
 
Simulate the model across 29 time units (years) and plot the simulated and the measured data together against the calendar years. <p>
<img src=\"modelica://SystemDynamics/Resources/Images/LarchBudMoth_1.png\"> <p>
 
<hr> <p>
</html>", revisions = ""));
      end LBM;
    end LarchBudMoth;
    annotation(
      preferedView = "info",
      Documentation(info = "<html>
One research area, where the System Dynamics methodology has been used intensively and with much success, is in the description of the <font color=red><b>population dynamics</b></font> of interacting species. <p>
 
This package is designed to contain examples of such <font color=red><b>population dynamics</b></font> models. <p>
 
<b>References:</b> <p>
 
<ol>
<li> Cellier, F.E. (1991), <a href=\"http://www.amazon.com/Continuous-System-Modeling-Fran%C3%A7ois-Cellier/dp/0387975020\">Continuous System Modeling</a>, Springer-Verlag, New York, ISBN: 0-387-97502-0, 755p.
<li> Odum, E.P. and G.W. Barrett (2004), <a href=\"http://www.amazon.com/Fundamentals-Ecology-Eugene-Odum/dp/0534420664\">Fundamentals of Ecology</a>, 5<sup>th</sup> Edition, Brooks Cole Publishing, 624 p.
<li> Odum, E.P. (1997), <a href=\"http://www.amazon.com/Ecology-Bridge-Between-Science-Society/dp/0878936300\">Ecology: A Bridge between Science and Society</a>, 3<sup>rd</sup> Revised Edition, Sinauer Associates, 330 p.
</ol> <p>
 
<hr> <p>
</html>"));
  end PopulationDynamics;