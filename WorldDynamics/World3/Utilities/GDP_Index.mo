        block GDP_Index "Gross domestic product index"
          extends Interfaces.Nonlin_1;
          output Real gdp_per_capita(unit = "dollar/yr") "Per capita gross domestic product";
          output Real gdp_index "Gross domestic product index";
        equation
          gdp_per_capita = u;
          gdp_index = (Modelica.Math.log10(gdp_per_capita) - Modelica.Math.log10(24.0)) / (Modelica.Math.log10(9508.0) - Modelica.Math.log10(24.0));
          y = gdp_index;
        end GDP_Index;