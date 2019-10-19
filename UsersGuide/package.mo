  package UsersGuide "User's Guide"
    extends Modelica.Icons.Info;

    package Overview "Overview of Library"
      extends Modelica.Icons.Info;

      class Introduction "An Introduction to System Dynamics"
        extends Modelica.Icons.Info;
        annotation(
          Documentation(info = "<html>
<p><span style=\"color: #008000; font-size: large;\"><strong>System Dynamics</strong></span> is a modeling methodology designed by <a href=\"http://en.wikipedia.org/wiki/Jay_Wright_Forrester\">Jay Forrester</a> in the 1960s and 1970s for modeling and simulating mass and information flows of continuous-time systems in the soft sciences.</p>
<p>It is a low-level modeling methodology.  The software behind this library is not more complex than that behind the Block library.  Thus, the value of this library is not so much in the software modules themselves as it is in the application examples.</p>
<p><span style=\"color: #008000; font-size: large;\"><strong>System Dynamics</strong></span> is important, because this modeling methodology is widely used by researchers in the life and social sciences.</p>
<p>The methodology is built around the concepts of Levels and Rates.  <strong>Levels</strong> are quantities that can be accumulated, whereas <strong>Rates</strong> are the quantities that control the increase and/or decrease of the Levels.</p>
<p>Typical examples of Levels and Rates are given in the graph below:</p>
<p><img src=\"modelica://SystemDynamics/Resources/Images/SD_Fig8.png\" alt=\"\" /></p>
<p>System Dynamics modelers are generally quite \"generous\" (sloppy) in the use of concepts.  This becomes clear when looking at the entries in the above table.</p>
<p>The Levels can be computed from the Rates by a simple differential equation:</p>
<p><img src=\"modelica://SystemDynamics/Resources/Images/SD_Fig10.png\" alt=\"\" /></p>
<p>The Rates are being controlled by a so-called laundry list, a set of influencing factors that control the rates.  Below is a table that provides a possible laundry list for the human birth rate in a population dynamics study:</p>
<p><img src=\"modelica://SystemDynamics/Resources/Images/SD_Fig9.png\" alt=\"\" /></p>
<p>There are usually many ways to model systems from soft sciences, i.e., different sets of variables constituting a laundry list may lead to quite similar simulation results in the end.</p>
<p>The Rates are usually determined by static non-linear functions of several variables, namely those listed in the laundry list:</p>
<p><img src=\"modelica://SystemDynamics/Resources/Images/SD_Fig11.png\" alt=\"\" /></p>
<p>Since it is too complicated to identify such a complicated function of multiple arguments, the System Dynamics methodology usually simplifies the functional relationship by assuming a multiplicative relationship between the different input variables:</p>
<p><img src=\"modelica://SystemDynamics/Resources/Images/SD_Fig12.png\" alt=\"\" /></p>
<p>The individual non-linear functions are now functions of a single argument.  They are usually identified from statistical information and are specified in the model as tabular functions.</p>
<p>A simple example of a System Dynamics model is shown below:</p>
<p><img src=\"modelica://SystemDynamics/Resources/Images/SD_Fig7.png\" alt=\"\" /></p>
<p>This example describes the savings of a person.  The savings (a variable that can be accumulated, i.e., a Level) is controlled by income and expenses (Rate variables).  There are several categories of income (salary and interest), whereby the interest is proportional to the savings.  There are also several categories of expenses, namely bank fees, taxes, utility bills, and cost-of-living expenses.  The bank fees are also proportional to the savings.  If the parameters are set correctly, the modeler can observe whether his or her savings will grow over time, or whether they will get depleted.  Mass flows are represented by lilac connections, whereas information flows are depicted in blue.  The two lilac clouds represent sources and sinks of masses.  These are dummy models in our library.  They were only provided to maintain the look-and-feel of the System Dynamics methodology.</p>
<p>Originally, System Dynamics models were usually encoded in <span style=\"color: red;\"><strong>Dynamo</strong></span>, a very simple alphanumeric modeling/simulation language that was in fact already outdated (in comparison with other modeling/simulation environments) at the time it was created.</p>
<p>With the advent of the Macintosh computer in the mid-eighties, <span style=\"color: red;\"><strong>Dynamo</strong></span> was rapidly replaced by <span style=\"color: red;\"><strong>STELLA</strong></span>, a graphical tool designed for representing System Dynamics models.</p>
<p>Although <span style=\"color: red;\"><strong>STELLA</strong></span> offers a graphical user interface, the tool has its drawbacks.  It is still a very simple environment.  It is not truly hierarchical, and worst of all, it doesn't offer means for <em>documenting</em> models.  Yet documentation is very important, especially in soft sciences.  What precisely does a particular variable mean?  How is it measured?  What measurement units are being used?  For an electrical resistor or a mechanical inertia, the answer to these questions may be obvious, but this is not the case for many of the soft-science models.</p>
<p>The <span style=\"color: red;\"><strong>SystemDynamics</strong></span> Modelica library offers some of the touch and feel of the <span style=\"color: red;\"><strong>STELLA</strong></span> software, while providing the modeler with the full power and flexibility of the <span style=\"color: red;\"><strong>Modelica</strong></span> environment.  Integration of the <span style=\"color: red;\"><strong>SystemDynamics</strong></span> Modelica library with other available <span style=\"color: red;\"><strong>Modelica</strong></span> libraries allows broadening the applications of the System Dynamics modeling paradigm to engineering domains. The multi-formalism and multi-domain capabilities of <span style=\"color: red;\"><strong>Modelica</strong></span> can be exploited to create models of complex and large socio-technical systems that have not been feasible using earlier implementations of the System Dynamics modeling methodology.
</p></html>", revisions = ""));
      end Introduction;

      class Industry "Industrial Dynamics"
        extends Modelica.Icons.Info;
        annotation(
          Documentation(info = "<html>
This is the oldest application area of System Dynamics.  In fact, the System Dynamics methodology had been originally invented by <a href=\"http://en.wikipedia.org/wiki/Jay_Wright_Forrester\">Jay Forrester</a> to describe processes of factory automation. <p>

Although this is the original application of the methodology, it is not commonly used today for such purposes.  Most people nowadays prefer a different world view for the description of factory automation processes, namely that of a <font color=red><b>process-oriented discrete event simulation</b></font>, as this world view allows us to study better phenomena such as <font color=red><b>deadlock</b></font> and <font color=red><b>starvation</b></font> in a system. <p>

Typical tools for such purposes would include <font color=red><b>ARENA</b></font>, and there exists also a <font color=red><b>Modelica</b></font> implementation of that tool and modeling methodology, called the <font color=red><b>ARENALib</b></font>. <p>

<hr> <p>

<b>References:</b> <p>

<ol>
<li> Kelton, W.D., R.P. Sadowski, and D.T. Sturrock (2003), <a href=\"http://www.amazon.com/Simulation-Arena-CD-Rom-David-Kelton/dp/0072919817\">Simulation with Arena</a>, 3<sup>rd</sup> Edition, McGraw-Hill, 672 p.
<li> Prat, V.S., A.Urqu�a, and S. Dormido (2006), <a href=\"http://www.modelica.org/events/modelica2006/Proceedings/sessions/Session5c2.pdf\">ARENALib: A Modelica Library for Discrete-Event System
Simulation</a>, <i>Proc. 6<sup>th</sup> Modelica Conference</i>, Vienna, Austria, pp.539-548.
</ol> <p>
</html>", revisions = ""));
      end Industry;

      class Population "Population Dynamics"
        extends Modelica.Icons.Info;
        annotation(
          Documentation(info = "<html>
The System Dynamics methodology is frequently being used for the description of complex interactions between different biological species.  This application area, which forms part of the ecological sciences, is usually referred to as <font color=red><b>population dynamics</b></font>. <p>

This is still one of the most popular application areas of the System Dynamics methodology with thousands of publications describing different aspects of the dynamics of ecosystems.
</html>", revisions = ""));
      end Population;

      class City "Urban Dynamics"
        extends Modelica.Icons.Info;
        annotation(
          Documentation(info = "<html>
<font color=red><b>Urban Dynamics</b></font> describes an application area that is located somewhere in between <font color=red><b>World Dynamics</b></font> and <font color=red><b>Industrial Dynamics</b></font>.  It includes application areas such as the studying of traffic flows in an inner city or along a freeway. <p>

Most people today prefer a different world view for the description of traffic flows in the inner city, namely that of a <font color=red><b>process-oriented discrete event simulation</b></font>, as this world view allows us to study better phenomena such as <font color=red><b>deadlock</b></font> and <font color=red><b>starvation</b></font> in a system. <p>

Typical tools for such purposes would include <font color=red><b>ARENA</b></font>, and there exists also a <font color=red><b>Modelica</b></font> implementation of that tool and modeling methodology, called the <font color=red><b>ARENALib</b></font>. <p>

Yet, for the study of traffic flow along a freeway, the System Dynamics approach might still be the preferred way of dealing with such problems. <p>

Whereas the discrete event world view follows an individual car through the system from one traffic light and intersection to the next, the System Dynamics world view discusses the problem at a slightly more aggregated level using traffic volume as its levels and traffic densities as its rates. <p>

The <font color=red><b>Modelica</b></font> implementations of the two methodologies would allow us to intersect discrete-event traffic models of an urban area with System-Dynamics traffic models of its surroundings.  This application represents current research and has not much been tackled so far. <p>

<hr> <p>

<b>References:</b> <p>

<ol>
<li> Kelton, W.D., R.P. Sadowski, and D.T. Sturrock (2003), <a href=\"http://www.amazon.com/Simulation-Arena-CD-Rom-David-Kelton/dp/0072919817\">Simulation with Arena</a>, 3<sup>rd</sup> Edition, McGraw-Hill, 672 p.
<li> Prat, V.S., A.Urqu�a, and S. Dormido (2006), <a href=\"http://www.modelica.org/events/modelica2006/Proceedings/sessions/Session5c2.pdf\">ARENALib: A Modelica Library for Discrete-Event System
Simulation</a>, <i>Proc. 6<sup>th</sup> Modelica Conference</i>, Vienna, Austria, pp.539-548.
</ol> <p>
</html>"));
      end City;

      class World "World Dynamics"
        extends Modelica.Icons.Info;
        annotation(
          Documentation(info = "<html>
One of the most important applications of the System Dynamics methodology are the set of world models that were developed primarily by the M.I.T. group around Profs. <a href=\"http://en.wikipedia.org/wiki/Jay_Wright_Forrester\">Jay Forrester</a> and <a href=\"http://en.wikipedia.org/wiki/Dennis_Meadows\">Dennis Meadows</a>. <p>

Beside from the (meanwhile classical) world models, this view point would include models of climate dynamics, such as models of the emission of greenhouse gases into the atmosphere; models of the melting of our glaciers accompanied by a rise of the waters of our seas; models of the spreading of pollutants through the atmosphere; models of the salination of our soil; and finally, models of the depletion of resources, such as sweet water for drinking and irrigation. <p>

This work, which started in the early 1970s, has recently gained renewed importance with the highly publicized discussion of <font color=red><b>Peak Oil</b></font> and <font color=red><b>Global Warming</b></font>.
</html>", revisions = ""));
      end World;

      class Literature "Literature"
        extends Modelica.Icons.Info;
        annotation(
          Documentation(info = "<html>
<b>References:</b> <p>

<ol>
<li> Cellier, F.E. (1991), <a href=\"http://www.amazon.com/Continuous-System-Modeling-Fran%C3%A7ois-Cellier/dp/0387975020\">Continuous System Modeling</a>, Springer-Verlag, New York, ISBN: 0-387-97502-0, 755p.
<li> Fisher, D.M. (2007), <a href=\"http://www.iseesystems.com/store/ModelingBook/default.aspx\">Modeling Dynamic Systems: Lessons for a First Course</a>, 2<sup>nd</sup> Edition, ISEE Systems.
<li> Forrester, J.W. (1961), <a href=\"http://www.amazon.com/Forrester-Industrial-Dynamics-Jay-W/dp/0262060035\">Industrial Dynamics</a>, M.I.T. Press, 479p.
<li> Forrester, J.W. (1969), <a href=\"http://www.amazon.com/Urban-Dynamics-Jay-Wright-Forrester/dp/0262060264\">Urban Dynamics</a>, M.I.T. Press, 285p.
<li> Forrester, J.W. (1971), <a href=\"http://www.amazon.com/Principles-Systems-Jay-Wright-Forrester/dp/1883823412/ref=pd_sim_b_1_img/103-2487145-1208659\">Principles of Systems</a>, Pegasus Communications, 387p.
<li> Forrester, J.W. (1971), <a href=\"http://www.amazon.com/World-Dynamics-Jay-W-Forrester/dp/1883823382/ref=ed_oe_h/103-2487145-1208659\">World Dynamics</a>, Pegasus Communications, 160p.
<li> Hammer, M, and J. Champy (1994), <a href=\"http://www.amazon.com/Reengineering-Corporation-Manifesto-Business-Revolution/dp/0066621127\">Reengineering the Corporation: A Manifesto for Business Revolution</a>, Harper Business, New York, 257p.
<li> Kirkwood, C.W. (1998), <a href=\"http://www.public.asu.edu/~kirkwood/sysdyn/SDIntro/SDIntro.htm\">System Dynamics Methods: A Quick Introduction</a>, College of Business Administration, Arizona State University, Tempe, AZ, 117p.
<li> Lebel, J.D. (1982), \"System Dynamics,\" in: <a href=\"http://www.amazon.com/Progress-Modelling-Simulation-F-Cellier/dp/0121647803\">Progress in Modelling and Simulation</a> (F.E. Cellier, Ed.), Academic Press, London, pp. 119-158.
<li> Meadows, D.H., D.L. Meadows, J. Randers, and W.W. Behrens III (1972), <i>Limits to Growth: A Report for the Club of Rome's Project on the Predicament of Mankind</i>, Universe Books, New York, 205p.
<li> Meadows, D.H., D.L. Meadows, and J. Randers (1992), <i>Beyond the Limits</i>, Chelsea Green, 300p.
<li> Meadows, D.H., J. Randers, and D.L. Meadows (2004), <a href=\"http://www.amazon.com/Limits-Growth-Donella-H-Meadows/dp/193149858X\">Limits to Growth: The 30-Year Update</a>, Chelsea Green, 368p.
<li> Odum, E.P. and G.W. Barrett (2004), <a href=\"http://www.amazon.com/Fundamentals-Ecology-Eugene-Odum/dp/0534420664\">Fundamentals of Ecology</a>, 5<sup>th</sup> Edition, Brooks Cole Publishing, 624 p.
<li> Odum, E.P. (1997), <a href=\"http://www.amazon.com/Ecology-Bridge-Between-Science-Society/dp/0878936300\">Ecology: A Bridge between Science and Society</a>, 3<sup>rd</sup> Revised Edition, Sinauer Associates, 330 p.
<li> Odum, H.T. (1971), <a href=\"http://www.amazon.com/Environment-Society-Environmental-Science-Technology/dp/047165275X\">Environment, Power, and Society</a>, John Wiley & Sons, 331 p.
<li> Odum, H.T. (1995), <a href=\"http://www.amazon.com/Environmental-Accounting-Emergy-Decision-Making/dp/0471114421\">Environmental Accounting: Emergy and Environmental Decision Making</a> John Wiley, 384 p.
<li> Odum, H.T. and E.C. Odum (2000), <a href=\"http://www.amazon.com/Modeling-all-Scales-Introduction-Simulation/dp/0125241704\">Modeling for all Scales: An Introduction to System Simulation</a>, Academic Press, 480 p.
<li> Richmond, B. (1997), <a href=\"http://www.iseesystems.com/store/ProductDescription.aspx?Type=PRODUCT&ID=693\">An Introduction to Systems Thinking</a>, STELLA Edition, ISEE Systems.
<li> Richmond, B., S. Peterson, and P. Vescuso (1987), <a href=\"http://www.amazon.com/ACADEMIC-USERS-GUIDE-STELLA/dp/B000RRMJHS/ref=sr_1_6/103-2487145-1208659?ie=UTF8&s=books&qid=1188791651&sr=1-6\">An Academic User's Guide to STELLA</a>, High Performance Systems, Inc., Lyme, N.H.
</ol> <p>
</html>"));
      end Literature;
      annotation(
        Documentation(info = "<html>
This overview contains the following sections: <p>

<ol>
<li><a href=\"Modelica://SystemDynamics.UsersGuide.Overview.Introduction\">An Introduction to System Dynamics</a>
<li><a href=\"Modelica://SystemDynamics.UsersGuide.Overview.Industry\">Industrial Dynamics</a>
<li><a href=\"Modelica://SystemDynamics.UsersGuide.Overview.Population\">Population Dynamics</a>
<li><a href=\"Modelica://SystemDynamics.UsersGuide.Overview.City\">Urban Dynamics</a>
<li><a href=\"Modelica://SystemDynamics.UsersGuide.Overview.World\">World Dynamics</a>
<li><a href=\"Modelica://SystemDynamics.UsersGuide.Overview.Literature\">Literature</a>
</ol>
</html>"));
    end Overview;

    package Versions "Release Notes"
      extends Modelica.Icons.Info;

      class Version_1_0 "old -> Version 1.0 (April 9, 2002)"
        extends Modelica.Icons.Info;
        annotation(
          Documentation(info = "<html>
<font color=red><b>SystemDynamics 1.0</b></font> constituted the first official release
of the <font color=red><b>SystemDynamics</b></font> library. That version was created by Stefan Fabricius in 2002, at a time when Stefan worked as a Ph.D. student at ETH Zurich.  After his graduation in 2003, Stefan decided to work in industry.  His current address is: <p>

<ul>
<li>Dr. Stefan Fabricius<br>
    PROMASIM GmbH<br>
    Dorfstr. 34<br>
    CH-8835 Feusisberg/SZ<br>
    Switzerland<br>
    email: <a href=\"mailto:stefan.fabricius@promasim.ch\">stefan.fabricius@promasim.ch</a>
</ul>

</html>"));
      end Version_1_0;

      class Version_2_0 "Version 1.0 -> Version 2.0 (September 13, 2007)"
        extends Modelica.Icons.Info;
        annotation(
          Documentation(info = "<html>
<font color=red><b>SystemDynamics 2.0</b></font> constitutes a completely reworked release
of the <font color=red><b>SystemDynamics</b></font> library.  This version is based in part
on Version 1.0, and in part on a different and independently created version of a System Dynamics
library for <font color=red><b>Dymola/Modelica</b></font>, a version that had been
developed by Prof. Cellier and his students at the University of Arizona, and had
been around in a much reduced form since 2001.  That version of SystemDynamics was
coded in <font color=red><b>Dymola 4.0</b></font> and was without documentation.
The sample programs were stored in separate files.  That version was strictly meant to
be used by Dr. Cellier's students. <p>

<ul>
<li><font color=red><b>Conversion from Dymola 4.0:</b></font> The library has been
    upgraded to the current graphical interface of Dymola 6.1.</li>

<li><font color=red><b>Documentation:</b></font> Appropriate documentation has been
    added to all modules.</li>

<li><font color=red><b>Examples:</b></font> An enhanced set of examples has been added to the
    library for improved documentation.</li>

</ol>
</html>", revisions = ""));
      end Version_2_0;

      class Version_2_1 "Version 2.0 -> Version 2.1 (October 16, 2013)"
        extends Modelica.Icons.Info;
        annotation(
          Documentation(info = "<html>
<p><span style=\"color: red;\"><strong>SystemDynamics 2.1</strong></span> is a reworked release of the <span style=\"color: red;\"><strong>SystemDynamics 2.0</strong></span> library.  This version is based on Version 2.0 that was developed by Prof. Cellier and his students, and have been primarily updated in order for it to work with MSL 3.2.1. The diagrams has been corrected from the old graphical definitions and some icons have been added.</p>
<ul>
<li><font color=red><b>Conversion from MSL 2.2.1:</b></font> The library has been upgraded to MSL 3.2.1, including redefined connectors</li>
<li>Added a unique package icon</li>
<li>Added a pseudo number generator component</li>
</ol>
</ul>
</html>", revisions = ""));
      end Version_2_1;
      annotation(
        Documentation(info = "<html><p>This section explains the major improvements made to the library from one version to the next:</p>
<p>&nbsp;</p>
<ol>
<li><a href=\"Modelica://SystemDynamics.UsersGuide.Versions.Version_1_0\">old -&gt; Version 1.0</a> (April 9, 2002) </li>
<li><a href=\"Modelica://SystemDynamics.UsersGuide.Versions.Version_2_0\">Version 1.0 -&gt; Version 2.0</a> (September 13, 2007) </li>
<li><a href=\"Modelica://SystemDynamics.UsersGuide.Versions.Version_2_1\">Version 2.0 -&gt; Version 2.1</a> (June 5, 2013) </li>
</ol> </html>", revisions = ""));
    end Versions;
    annotation(
      DocumentationClass = true,
      Documentation(info = "<html>
<h4><font color=\"#008000\" size=5>Users Guide of Package SystemDynamics</font></h4>
<p>
Library <b>SystemDynamics</b> is a <b>free</b> Modelica package providing components to model mass and information flows in continuous-time systems using the System Dynamics methodology. This package contains the <b>user’s  guide</b> to the library, and has the following content:
</p>
<ol>
<li><a href=\"Modelica://SystemDynamics.UsersGuide.Overview\">Overview of library</a>
       gives an overview of the library.
<li><a href=\"Modelica://SystemDynamics.UsersGuide.Versions\">Release Notes</a>
       offers a historic perspective on the development of this library.
</ol>
</html>", revisions = ""));
  end UsersGuide;