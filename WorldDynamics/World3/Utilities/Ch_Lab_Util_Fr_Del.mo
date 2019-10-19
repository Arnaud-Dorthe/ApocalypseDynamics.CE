        block Ch_Lab_Util_Fr_Del "Change in delayed labor utilization fraction"
          extends Interfaces.Nonlin_2;
          parameter Real labor_util_fr_del_time(unit = "yr") = 2 "Labor utilization fraction delay time";
          output Real labor_util_fr "Labor utilization fraction";
          output Real labor_util_fr_del "Delayed labor utilization fraction";
          output Real chg_lab_util_fr_del(unit = "1/yr") "Change in delayed labor utilization fraction";
        equation
          labor_util_fr = u1;
          labor_util_fr_del = u2;
          chg_lab_util_fr_del = (labor_util_fr - labor_util_fr_del) / labor_util_fr_del_time;
          y = chg_lab_util_fr_del;
          annotation(
            Documentation(info = "<html>
This function is described on p.241 of <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>.
</html>"));
        end Ch_Lab_Util_Fr_Del;