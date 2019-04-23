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
 
 
 //Objective Function
 
dexpr int	z = sum(i in Pharmacist, j in Weekday, k in Job) y[i][j][k];

 maximize z;
 
 //Constraints
 
 subject to{
 
 //Every full-time staff memeber (EFT = 1) requires 1 ADO per calender month
 
forall(i in 3..9)
   sum(j in 1..21) y[i][j][17] ==1;
   
forall(i in 3..9)
   sum(j in 22..41) y[i][j][17] ==1;
   
forall(i in 3..9)
   sum(j in 42..61) y[i][j][17] ==1;
   
forall(i in 3..9)
   sum(j in 62..80) y[i][j][17] ==1;
   
forall(i in 3..9)
   sum(j in 81..103) y[i][j][17] ==1;
   
forall(i in 3..9)
   sum(j in 104..122) y[i][j][17] ==1;
   

//Physical Limitation Constraint

forall(i in Pharmacist, j in Weekday)
  sum(k in 1..24) y[i][j][k] <= 1;

//Job Completion Constraint

forall(j in Weekday, k in 1..8)
  sum(i in Pharmacist) y[i][j][k] == 1;
  
  

//Individual Rotation Constraint

///for i = 3

////Weekdays [1,21]

sum(j in 1..21) y[3][j][3] <= 20;


////Weekdays [22,41]

sum(j in 22..41) y[3][j][3] <= 19;


////Weekdays [42,61]

sum(j in 42..61) y[3][j][3] <= 19;


////Weekdays [62,80]

sum(j in 62..80) y[3][j][3] <= 18;


////Weekdays [81,103]

sum(j in 81..103) y[3][j][3] <= 22;


////Weekdays [104,122]

sum(j in 104..122) y[3][j][3] <= 18;


///for i = 4

////Weekdays [1,21]

sum(j in 1..21) y[4][j][4] <= 20;


////Weekdays [22,41]

sum(j in 22..41) y[4][j][4] <= 19;


////Weekdays [42,61]

sum(j in 42..61) y[4][j][4] <= 19;


////Weekdays [62,80]

sum(j in 62..80) y[4][j][4] <= 18;


////Weekdays [81,103]

sum(j in 81..103) y[4][j][4] <= 22;


////Weekdays [104,122]

sum(j in 104..122) y[4][j][4] <= 18;



///for i = 5

////Weekdays [1,21]

sum(j in 1..21) y[5][j][5] <= 20;


////Weekdays [22,41]

sum(j in 22..41) y[5][j][5] <= 19;


////Weekdays [42,61]

sum(j in 42..61) y[5][j][5] <= 19;


////Weekdays [62,80]

sum(j in 62..80) y[5][j][5] <= 18;


////Weekdays [81,103]

sum(j in 81..103) y[5][j][5] <= 22;


////Weekdays [104,122]

sum(j in 104..122) y[5][j][5] <= 18;



///for i = 6

////Weekdays [1,21]

sum(j in 1..21) y[6][j][6] <= 20;


////Weekdays [22,41]

sum(j in 22..41) y[6][j][6] <= 19;


////Weekdays [42,61]

sum(j in 42..61) y[6][j][6] <= 19;


////Weekdays [62,80]

sum(j in 62..80) y[6][j][6] <= 18;


////Weekdays [81,103]

sum(j in 81..103) y[6][j][6] <= 22;


////Weekdays [104,122]

sum(j in 104..122) y[6][j][6] <= 18;


///for i = 7

////Weekdays [1,21]

sum(j in 1..21) y[7][j][7] <= 20;


////Weekdays [22,41]

sum(j in 22..41) y[7][j][7] <= 19;


////Weekdays [42,61]

sum(j in 42..61) y[7][j][7] <= 19;


////Weekdays [62,80]

sum(j in 62..80) y[7][j][7] <= 18;


////Weekdays [81,103]

sum(j in 81..103) y[7][j][7] <= 22;


////Weekdays [104,122]

sum(j in 104..122) y[7][j][7] <= 18;



 
 
 
} 