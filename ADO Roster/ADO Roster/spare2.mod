/*********************************************
 * OPL 12.8.0.0 Model
 * Author: asus
 * Creation Date: 1 Apr 2019 at 5:25:43 pm
 *********************************************/

 range	Pharmacist = 1..9;
 range	Weekday = 1..122;
 range	Job = 1..24;
 
 //Decision Variables
 
 dvar boolean	y[Pharmacist][Weekday][Job];
 
 dvar boolean	C1[Weekday];
 
 dvar boolean	C2[Weekday];

dvar boolean	C3[Weekday];



 
 //Objective Function
 
dexpr int	z = sum(i in Pharmacist, j in Weekday, k in Job) y[i][j][k];

 maximize z;
 
 //Constraints
 
 subject to{
 
 //Every full-time staff memeber (EFT = 1) requires 1 ADO per calender month
 


//Physical Limitation Constraint

forall(i in Pharmacist, j in Weekday)
  sum(k in 1..24) y[i][j][k] <= 1;

//Job Completion Constraint

forall(j in Weekday, k in 1..8)
  sum(i in Pharmacist) y[i][j][k] == 1;

  
//Late Shift/Leave/Time in Lieu/etc


///for i = 1 (Two part-timers);

sum(j in 3..4) C1[j] ==2;
sum(j in 3..4) y[1][j][18] ==2;

C1[28] ==1;
//y[1][28][18] == 1;

C1[35] ==1;
//y[1][35][18] ==1;

C1[71] ==1;
y[1][71][18]==1;

sum(j in 86..87) C1[j] ==2;
//sum(j in 86..87) y[1][j][18] ==2;

C1[90] ==1;
//y[1][90][18] ==1;


////Total Days Off:

sum(j in Weekday) C1[j] == 8;


///for i = 2 (Two part-timers);

sum(j in 1..2) C2[j] ==2;
//sum(j in 1..2) y[2][j][18] ==2;

sum(j in 23..24) C2[j] ==2;
//sum(j in 23..24) y[2][j][18] ==2;

C2[26] == 1;
//y[2][26][24] ==1;

sum(j in 28..29) C2[j] ==2;
//sum(j in 28..29) y[2][j][22] ==2;

C2[32] == 1;
//y[2][32][22] == 1;

C2[39] == 1;
//y[2][39][18] == 1;

sum(j in 42..44) C2[j] == 3;
//sum(j in 42..44) y[2][j][18] == 3;

C2[47] == 1;
//y[2][47][18] == 1;

////Total Days Off:

sum(j in Weekday) C2[j] == 13;

///for i = 3;

sum(j in 15..17) C3[j] == 3;
//sum(j in 15..17) y[3][j][20] == 3;

C3[22] == 1;
//y[3][22][20] == 1;

sum(j in 99..108) C3[j] == 10;
//sum(j in 99..108) y[3][j][20] == 10;

////Total Days Off:

sum(j in Weekday) C3[j] == 14;



//Individual Rotation Constraint

///for i = 1 (Two part-timers);

forall(j in Weekday)
  y[1][j][1] <= 1 - C1[j];
  
forall(j in Weekday)
  y[1][j][1] >= 1 - C1[j];



///for i = 2 (Two part-timers);

forall(j in Weekday)
  y[2][j][2] <= 1 - C2[j];
  
forall(j in Weekday)
  y[2][j][2] >= 1 - C2[j];

///for i = 3;

forall(j in Weekday)
  y[3][j][3] <= 1 - C3[j];
  
forall(j in Weekday)
  y[3][j][3] >= 1 - C3[j];



}
   
