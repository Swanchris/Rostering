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
 
 dvar boolean	C1[Weekday];
 dvar boolean	C2[Weekday];
 dvar boolean	C3[Weekday];
 dvar boolean	C4[Weekday];
 dvar boolean	C5[Weekday];
 dvar boolean	C6[Weekday];
 dvar boolean	C7[Weekday];
 dvar boolean	C9[Weekday];
 
 
 
 //Objective Function
 
dexpr int	z = sum(i in Pharmacist, j in Weekday, k in Job) y[i][j][k];

 maximize z;
 
 //Constraints
 
 subject to{
 
 //Every full-time staff memeber (EFT = 1) requires 1 ADO per calender month
 
forall(i in 3..8)
   sum(j in 1..21) y[i][j][19] ==1;
   
forall(i in 3..8)
   sum(j in 22..41) y[i][j][19] ==1;
   
forall(i in 3..8)
   sum(j in 42..61) y[i][j][19] ==1;
   
forall(i in 3..8)
   sum(j in 62..80) y[i][j][19] ==1;
   
forall(i in 3..8)
   sum(j in 81..103) y[i][j][19] ==1;
   
forall(i in 3..8)
   sum(j in 104..122) y[i][j][19] ==1;
   

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
y[1][28][18] == 1;

C1[35] ==1;
y[1][35][18] ==1;

C1[71] ==1;
y[1][71][18]==1;

sum(j in 86..87) C1[j] ==2;
sum(j in 86..87) y[1][j][18] ==2;

C1[90] ==1;
y[1][90][18] ==1;


////Total Days Off:

sum(j in Weekday) C1[j] == 8;


///for i = 2 (Two part-timers);

sum(j in 1..2) C2[j] ==2;
sum(j in 1..2) y[2][j][18] ==2;

sum(j in 23..24) C2[j] ==2;
sum(j in 23..24) y[2][j][18] ==2;

C2[26] == 1;
y[2][26][24] ==1;

sum(j in 28..29) C2[j] ==2;
sum(j in 28..29) y[2][j][22] ==2;

C2[32] == 1;
y[2][32][22] == 1;

C2[39] == 1;
y[2][39][18] == 1;

sum(j in 42..44) C2[j] == 3;
sum(j in 42..44) y[2][j][18] == 3;

C2[47] == 1;
y[2][47][18] == 1;

////Total Days Off:

sum(j in Weekday) C2[j] == 13;


///for i = 3;

sum(j in 15..17) C3[j] == 3;
sum(j in 15..17) y[3][j][20] == 3;

C3[22] == 1;
y[3][22][20] == 1;

sum(j in 99..108) C3[j] == 10;
sum(j in 99..108) y[3][j][20] == 10;

////Total Days Off:

sum(j in Weekday) C3[j] == 14;


///for i = 4;

sum(j in 67..71) C4[j] == 5;
sum(j in 67..71) y[4][j][20] == 5;

////Total Days Off:

sum(j in Weekday) C4[j] == 5;


///for i = 5;

sum(j in 84..88) C5[j] == 5;
sum(j in 84..88) y[5][j][20] == 5;

////Total Days Off:

sum(j in Weekday) C5[j] == 5;


///for i = 6;

sum(j in 52..64) C6[j] == 13;
sum(j in 52..64) y[6][j][18] == 13;

sum(j in 72..75) C6[j] == 4;
sum(j in 72..75) y[6][j][20] ==4;

////Total Days Off:

sum(j in Weekday) C6[j] == 17;


///for i = 7;

sum(j in 4..8) C7[j] == 5;
sum(j in 4..8) y[7][j][20] == 5;

////Total Days Off:

sum(j in Weekday) C7[j] == 5;


///for i = 8;

sum(j in 9..13) y[8][j][20] == 5;

sum(j in 31..32) y[8][j][21] ==2;


///for i = 9;

C9[13] ==1;
y[9][13][18] ==1;

C9[113] ==1;
y[9][113][22] ==1;

C9[117] ==1;
y[9][117][22] ==1;

C9[118] ==1;
y[9][118][22] ==1;

C9[122] ==1;
y[9][122][22] ==1;

////Total Days Off:

sum(j in Weekday) C9[j] == 5;





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


  
  
///for i = 4;

forall(j in Weekday)
  y[4][j][4] <= 1 - C4[j];
  
forall(j in Weekday)
  y[4][j][4] >= 1 - C4[j];





///for i = 5;

forall(j in Weekday)
  y[5][j][5] <= 1 - C5[j];
  
forall(j in Weekday)
  y[5][j][5] >= 1 - C5[j];


  
  
///for i = 6;

forall(j in Weekday)
  y[6][j][6] <= 1 - C6[j];
  
forall(j in Weekday)
  y[6][j][6] >= 1 - C6[j];

 
  

///for i = 7;

forall(j in Weekday)
  y[7][j][7] <= 1 - C7[j];
  
forall(j in Weekday)
  y[7][j][7] >= 1 - C7[j];


///for i = 9;

forall(j in Weekday)
  y[9][j][8] <= 1 - C9[j];
  
forall(j in Weekday)
  y[9][j][8] >= 1 - C9[j];
 
  
}