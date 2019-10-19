        block Poll_Intens_Ind "Pollution intensity index"
          extends Interfaces.Nonlin_3;
          output Real industrial_output(unit = "dollar/yr") "Industrial output";
          output Real ppoll_gen_ind(unit = "1/yr") "Persistent pollution index";
          output Real s_ppoll_gen_fact "Pollution generation factor";
          output Real poll_intens_ind(unit = "1/dollar") "Pollution intensity index";
        equation
          industrial_output = u1;
          ppoll_gen_ind = u2;
          s_ppoll_gen_fact = u3;
          poll_intens_ind = ppoll_gen_ind * s_ppoll_gen_fact / industrial_output;
          y = poll_intens_ind;
        end Poll_Intens_Ind;