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