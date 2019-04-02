/*********************************************
 * OPL 12.8.0.0 Model
 * Author: asus
 * Creation Date: 1 Apr 2019 at 5:25:43 pm
 *********************************************/

 range	Pharmacist = 1..10;
 range	Weekday = 1..122;
 range	Job = 1..24;
 
 //Decision Variables
 
 dvar boolean	y[Pharmacist][Weekday][Job];
 
 dvar boolean	C1_Leave[Weekday];
 dvar boolean	C1_Late[Weekday];
 dvar boolean	C1_Lieu[Weekday];
 dvar boolean	C1_Long[Weekday];
 dvar boolean	C1_Prof[Weekday];
 dvar boolean	C1_Rost[Weekday];
 
 
 
 dvar boolean	C2_Leave[Weekday];
 dvar boolean	C2_Late[Weekday];
 dvar boolean	C2_Lieu[Weekday];
 dvar boolean	C2_Long[Weekday];
 dvar boolean	C2_Prof[Weekday];
 dvar boolean	C2_Rost[Weekday];

 dvar boolean	C3_Leave[Weekday];
 dvar boolean	C3_Late[Weekday];
 dvar boolean	C3_Lieu[Weekday];
 dvar boolean	C3_Long[Weekday];
 dvar boolean	C3_Prof[Weekday];
 dvar boolean	C3_Rost[Weekday];
 
 dvar boolean	C4_Leave[Weekday];
 dvar boolean	C4_Late[Weekday];
 dvar boolean	C4_Lieu[Weekday];
 dvar boolean	C4_Long[Weekday];
 dvar boolean	C4_Prof[Weekday];
 dvar boolean	C4_Rost[Weekday];
 

 dvar boolean	C5_Leave[Weekday];
 dvar boolean	C5_Late[Weekday];
 dvar boolean	C5_Lieu[Weekday];
 dvar boolean	C5_Long[Weekday];
 dvar boolean	C5_Prof[Weekday];
 dvar boolean	C5_Rost[Weekday];
 
 dvar boolean	C6_Leave[Weekday];
 dvar boolean	C6_Late[Weekday];
 dvar boolean	C6_Lieu[Weekday];
 dvar boolean	C6_Long[Weekday];
 dvar boolean	C6_Prof[Weekday];
 dvar boolean	C6_Rost[Weekday];
 
 dvar boolean	C7_Leave[Weekday];
 dvar boolean	C7_Late[Weekday];
 dvar boolean	C7_Lieu[Weekday];
 dvar boolean	C7_Long[Weekday];
 dvar boolean	C7_Prof[Weekday];
 dvar boolean	C7_Rost[Weekday];
 
 dvar boolean	C10_Leave[Weekday];
 dvar boolean	C10_Late[Weekday];
 dvar boolean	C10_Lieu[Weekday];
 dvar boolean	C10_Long[Weekday];
 dvar boolean	C10_Prof[Weekday];
 dvar boolean	C10_Rost[Weekday];
 
 //Objective Function
 
dexpr int	z = sum(i in Pharmacist, j in Weekday, k in Job) y[i][j][k];

 maximize z;
 
 //Constraints
 
 subject to{
 
 //Every full-time staff memeber (EFT = 1) requires 1 ADO per calender month
 
forall(i in 3..9)
   sum(j in 1..21) y[i][j][19] ==1;
   
forall(i in 3..9)
   sum(j in 22..41) y[i][j][19] ==1;
   
forall(i in 3..9)
   sum(j in 42..61) y[i][j][19] ==1;
   
forall(i in 3..9)
   sum(j in 62..80) y[i][j][19] ==1;
   
forall(i in 3..9)
   sum(j in 81..103) y[i][j][19] ==1;
   
forall(i in 3..9)
   sum(j in 104..122) y[i][j][19] ==1;
   

//Physical Limitation Constraint

forall(i in Pharmacist, j in Weekday)
  sum(k in 1..24) y[i][j][k] <= 1;

//Job Completion Constraint

forall(j in Weekday, k in 1..8)
  sum(i in Pharmacist) y[i][j][k] == 1;



  
//Late Shift/Leave/Time in Lieu/etc


///for i = 1 (Two part-timers);

sum(j in 3..4) C1_Leave[j] ==2;
sum(j in 3..4) y[1][j][1] ==2;
C1_Leave[28] ==1;
y[1][28][1] ==1;
C1_Leave[35] ==1;
y[1][35][1] ==1;
C1_Leave[71] ==1;
y[1][71][1] ==1;
sum(j in 86..87) C1_Leave[j] ==2;
sum(j in 86..87) y[1][j][1] ==2;
C1_Leave[90] ==1;
y[1][90][1] ==1;
////Total Days Off:

sum(j in Weekday) C1_Leave[j]  == 8;





//Individual Rotation Constraint

///for i = 1 (Two part-timers);

forall(j in Weekday)
  y[1][j][1] <= 1 - C1_Leave[j];
  
forall(j in Weekday)
  y[1][j][1] >= 1 - C1_Leave[j];

forall(j in Weekday)
  y[1][j][18] <= C1_Leave[j];

forall(j in Weekday)
  y[1][j][18] >= C1_Leave[j];


}  
