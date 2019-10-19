        block HEF_Human_Ecological_Footprint "Human ecological footprint"
          extends Interfaces.Nonlin_3;
          output Real arable_land_in_Gha(unit = "Gha") "Arable land in Gigahectare";
          output Real urban_land_in_Gha(unit = "Gha") "Urban land in Gigahectare";
          output Real absorption_land_in_Gha(unit = "Gha") "Absorption land in Gigahectare";
          output Real hef_human_ecological_footprint(unit = "hectare") "Human ecological footprint";
        equation
          arable_land_in_Gha = u1;
          urban_land_in_Gha = u2;
          absorption_land_in_Gha = u3;
          hef_human_ecological_footprint = (arable_land_in_Gha + urban_land_in_Gha + absorption_land_in_Gha) / 1.91;
          y = hef_human_ecological_footprint;
        end HEF_Human_Ecological_Footprint;