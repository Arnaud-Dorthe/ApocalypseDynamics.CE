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