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