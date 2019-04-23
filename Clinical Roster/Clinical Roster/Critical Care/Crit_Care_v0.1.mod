/*********************************************
 * OPL 12.8.0.0 Model
 * Author: asus
 * Creation Date: 16 Apr 2019 at 2:06:19 pm
 *********************************************/

 /*********************************************
 * OPL 12.8.0.0 Model
 * Author: asus
 * Creation Date: 1 Apr 2019 at 5:25:43 pm
 *********************************************/

 range	Pharmacist = 1..8;
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

 
 
 
 //Objective Function
 
dexpr int	z = sum(j in Weekday, k in Job) y[8][j][k];

 minimize z;
 
 //Constraints
 
 subject to{
 
//Every full-time staff memeber (EFT = 1) requires 1 ADO per calender month
 
forall(i in 1..7)
   sum(j in 1..21) y[i][j][19] ==1;
   
forall(i in 1..7)
   sum(j in 22..41) y[i][j][19] ==1;
   
forall(i in 1..7)
   sum(j in 42..61) y[i][j][19] ==1;
   
forall(i in 1..7)
   sum(j in 62..80) y[i][j][19] ==1;
   
forall(i in 1..7)
   sum(j in 81..103) y[i][j][19] ==1;
   
forall(i in 1..7)
   sum(j in 104..122) y[i][j][19] ==1;
   

//Physical Limitation Constraint

forall(i in 1..7, j in Weekday)
  sum(k in 1..24) y[i][j][k] <= 1;
forall(j in Weekday)
  sum(i in 1..7) y[i][j][19] <= 1;

//Job Completion Constraint

forall(j in Weekday, k in 1..6)
  sum(i in Pharmacist) y[i][j][k] == 1;


//Skill Restriction - ICU

  
forall(k in 1..2)
  sum(i in 3..4, j in Weekday) y[i][j][k] ==0;
  
forall(k in 1..2)
  sum(j in Weekday) y[7][j][k] ==0;
  

  
//Late Shift/Leave/Time in Lieu/etc


///for i = 1 ;

sum(j in 32..39) C1[j] ==8;
sum(j in 32..39) y[1][j][18] ==8;

sum(j in 100..101) C1[j] ==2;
sum(j in 100..101) y[1][j][20] ==2;

////Total Days Off:

sum(j in Weekday) C1[j] == 24;


///for i = 2;

C2[42] ==1;
y[2][42][24] ==1;


////Total Days Off:

sum(j in Weekday) C2[j] == 7;


///for i = 3;



////Total Days Off:

sum(j in Weekday) C3[j] == 6;


///for i = 4;

sum(j in 43..54) C4[j] == 12;
sum(j in 43..54) y[4][j][18] ==12;

sum(j in 89..93) C4[j] ==5;
sum(j in 89..93) y[4][j][20] ==5;


////Total Days Off:

sum(j in Weekday) C4[j] == 23;


///for i = 5;

sum(j in 67..71) C5[j] ==5;
sum(j in 67..71) y[5][j][20] ==5;


////Total Days Off:

sum(j in Weekday) C5[j] == 11;


///for i = 6;

sum(j in 48..61) C6[j] ==14;
sum(j in 48..61) y[6][j][18] ==14;

sum(j in 79..82) C6[j] ==4;
sum(j in 79..82) y[6][j][20] ==4;

C6[77] ==1;
y[6][77][21] ==1;

////Total Days Off:

sum(j in Weekday) C6[j] == 25;


///for i = 7;


sum(j in 52..66) y[7][j][18] ==15;

y[7][78][21] ==1;


sum(j in 107..108) y[7][j][21] ==2;




//Individual Rotation Constraint

///for i = 1;

forall(j in Weekday)
  y[1][j][1] <= 1 - C1[j];
  
forall(j in Weekday)
  y[1][j][1] >= 1 - C1[j];


///for i = 2;

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

 
  
}