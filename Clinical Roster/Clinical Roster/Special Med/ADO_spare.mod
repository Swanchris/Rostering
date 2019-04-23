/*********************************************
 * OPL 12.8.0.0 Model
 * Author: asus
 * Creation Date: 1 Apr 2019 at 6:12:07 pm
 *********************************************/

 //Individual Rotation Constraint

///for i = 3

////Weekdays [1,21]

sum(j in 1..21) C3[j] ==1;

forall(j in 1..21)
  y[3][j][3] == C3[j];
  
sum(j in 1..21) y[3][j][3] == 20;


////Weekdays [22,41]

sum(j in 22..41) C3[j] ==1;

forall(j in 22..41)
  y[3][j][3] == C3[j];
  
sum(j in 22..41) y[3][j][3] == 20;


////Weekdays [42,61]

sum(j in 42..61) C3[j] ==1;

forall(j in 42..61)
  y[3][j][3] == C3[j];
  
sum(j in 42..61) y[3][j][3] == 20;


////Weekdays [62,80]

sum(j in 62..80) C3[j] ==1;

forall(j in 62..80)
  y[3][j][3] == C3[j];
  
sum(j in 62..80) y[3][j][3] == 20;


////Weekdays [81,103]

sum(j in 81..103) C3[j] ==1;

forall(j in 81..103)
  y[3][j][3] == C3[j];
  
sum(j in 81..103) y[3][j][3] == 20;


////Weekdays [104,122]

sum(j in 104..122) C3[j] ==1;

forall(j in 104..122)
  y[3][j][3] == C3[j];
  
sum(j in 104..122) y[3][j][3] == 20;


///for i = 4

////Weekdays [1,21]

sum(j in 1..21) C4[j] ==1;

forall(j in 1..21)
  y[4][j][4] == C4[j];
  
sum(j in 1..21) y[4][j][4] == 20;


////Weekdays [22,41]

sum(j in 22..41) C4[j] ==1;

forall(j in 22..41)
  y[4][j][4] == C4[j];
  
sum(j in 22..41) y[4][j][4] == 20;


////Weekdays [42,61]

sum(j in 42..61) C4[j] ==1;

forall(j in 42..61)
  y[4][j][4] == C4[j];
  
sum(j in 42..61) y[4][j][4] == 20;


////Weekdays [62,80]

sum(j in 62..80) C4[j] ==1;

forall(j in 62..80)
  y[4][j][4] == C4[j];
  
sum(j in 62..80) y[4][j][4] == 20;


////Weekdays [81,103]

sum(j in 81..103) C4[j] ==1;

forall(j in 81..103)
  y[4][j][4] == C4[j];
  
sum(j in 81..103) y[4][j][4] == 20;


////Weekdays [104,122]

sum(j in 104..122) C4[j] ==1;

forall(j in 104..122)
  y[4][j][4] == C4[j];
  
sum(j in 104..122) y[4][j][4] == 20;



///for i = 5

////Weekdays [1,21]

sum(j in 1..21) C5[j] ==1;

forall(j in 1..21)
  y[5][j][5] == C5[j];
  
sum(j in 1..21) y[5][j][5] == 20;


////Weekdays [22,41]

sum(j in 22..41) C5[j] ==1;

forall(j in 22..41)
  y[5][j][5] == C5[j];
  
sum(j in 22..41) y[5][j][5] == 20;


////Weekdays [42,61]

sum(j in 42..61) C5[j] ==1;

forall(j in 42..61)
  y[5][j][5] == C5[j];
  
sum(j in 42..61) y[5][j][5] == 20;


////Weekdays [62,80]

sum(j in 62..80) C5[j] ==1;

forall(j in 62..80)
  y[5][j][5] == C5[j];
  
sum(j in 62..80) y[5][j][5] == 20;


////Weekdays [81,103]

sum(j in 81..103) C5[j] ==1;

forall(j in 81..103)
  y[5][j][5] == C5[j];
  
sum(j in 81..103) y[5][j][5] == 20;


////Weekdays [104,122]

sum(j in 104..122) C5[j] ==1;

forall(j in 104..122)
  y[5][j][5] == C5[j];
  
sum(j in 104..122) y[5][j][5] == 20;



///for i = 6

////Weekdays [1,21]

sum(j in 1..21) C5[j] ==1;

forall(j in 1..21)
  y[6][j][6] == C5[j];
  
sum(j in 1..21) y[6][j][6] == 20;


////Weekdays [22,41]

sum(j in 22..41) C5[j] ==1;

forall(j in 22..41)
  y[6][j][6] == C5[j];
  
sum(j in 22..41) y[6][j][6] == 20;


////Weekdays [42,61]

sum(j in 42..61) C5[j] ==1;

forall(j in 42..61)
  y[6][j][6] == C5[j];
  
sum(j in 42..61) y[6][j][6] == 20;


////Weekdays [62,80]

sum(j in 62..80) C5[j] ==1;

forall(j in 62..80)
  y[6][j][6] == C5[j];
  
sum(j in 62..80) y[6][j][6] == 20;


////Weekdays [81,103]

sum(j in 81..103) C5[j] ==1;

forall(j in 81..103)
  y[6][j][6] == C5[j];
  
sum(j in 81..103) y[6][j][6] == 20;


////Weekdays [104,122]

sum(j in 104..122) C5[j] ==1;

forall(j in 104..122)
  y[6][j][6] == C5[j];
  
sum(j in 104..122) y[6][j][6] == 20;


///for i = 7

////Weekdays [1,21]

sum(j in 1..21) C5[j] ==1;

forall(j in 1..21)
  y[7][j][7] == C5[j];
  
sum(j in 1..21) y[7][j][7] == 20;


////Weekdays [22,41]

sum(j in 22..41) C5[j] ==1;

forall(j in 22..41)
  y[7][j][7] == C5[j];
  
sum(j in 22..41) y[7][j][7] == 20;


////Weekdays [42,61]

sum(j in 42..61) C5[j] ==1;

forall(j in 42..61)
  y[7][j][7] == C5[j];
  
sum(j in 42..61) y[7][j][7] == 20;


////Weekdays [62,80]

sum(j in 62..80) C5[j] ==1;

forall(j in 62..80)
  y[7][j][7] == C5[j];
  
sum(j in 62..80) y[7][j][7] == 20;


////Weekdays [81,103]

sum(j in 81..103) C5[j] ==1;

forall(j in 81..103)
  y[7][j][7] == C5[j];
  
sum(j in 81..103) y[7][j][7] == 20;


////Weekdays [104,122]

sum(j in 104..122) C5[j] ==1;

forall(j in 104..122)
  y[7][j][7] == C5[j];
  
sum(j in 104..122) y[7][j][7] == 20;

 