      block Change_In_Smooth "Smoothing rate"
        extends Interfaces.Nonlin_2;
        parameter Real averaging_time = 1 "Averaging time";
        output Real input_variable "Variable to be smoothed";
        output Real smooth_of_input "Smoothed variable";
        output Real smoothing_rate "Smoothing rate";
      equation
        input_variable = u1;
        smooth_of_input = u2;
        smoothing_rate = (input_variable - smooth_of_input) / averaging_time;
        y = smoothing_rate;
        annotation(
          Diagram);
      end Change_In_Smooth;