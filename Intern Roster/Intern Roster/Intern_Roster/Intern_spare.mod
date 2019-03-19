/*********************************************
 * OPL 12.8.0.0 Model
 * Author: asus
 * Creation Date: 19 Mar 2019 at 5:21:11 pm
 *********************************************/
//Intern Rotation Duration Constraint
forall(i in Intern, k in 1..47)
  8 -(sum(a in 0..7)w[i][1][k + a]) <= M*y;
forall(i in Intern, k in 1..47)
  x[i][1][k] <= M*(1-y);
  
forall(i in Intern, k in 1..51)
  4 -(sum(a in 0..3)w[i][2][k + a]) <= M*y;
forall(i in Intern, k in 1..51)
  x[i][2][k] <= M*(1-y);
  
forall(i in Intern, k in 1..51)
  4 -(sum(a in 0..3)w[i][3][k + a]) <= M*y;
forall(i in Intern, k in 1..51)
  x[i][3][k] <= M*(1-y);

forall(i in Intern, k in 1..51)
  4 -(sum(a in 0..3)w[i][4][k + a]) <= M*y;
forall(i in Intern, k in 1..51)
  x[i][4][k] <= M*(1-y);

forall(i in Intern, k in 1..53)
  2 -(sum(a in 0..1)w[i][5][k + a]) <= M*y;
forall(i in Intern, k in 1..53)
  x[i][5][k] <= M*(1-y);

forall(i in Intern, k in 1..52)
  3 -(sum(a in 0..2)w[i][6][k + a]) <= M*y;
forall(i in Intern, k in 1..52)
  x[i][6][k] <= M*(1-y);

forall(i in Intern, k in 1..52)
  3 -(sum(a in 0..2)w[i][7][k + a]) <= M*y;
forall(i in Intern, k in 1..52)
  x[i][7][k] <= M*(1-y);

forall(i in Intern, k in 1..53)
  2 -(sum(a in 0..1)w[i][8][k + a]) <= M*y;
forall(i in Intern, k in 1..53)
  x[i][8][k] <= M*(1-y);

forall(i in Intern, k in 1..51)
  4 -(sum(a in 0..3)w[i][9][k + a]) <= M*y;
forall(i in Intern, k in 1..51)
  x[i][9][k] <= M*(1-y);

forall(i in Intern, k in 1..52)
  3 -(sum(a in 0..2)w[i][10][k + a]) <= M*y;
forall(i in Intern, k in 1..52)
  x[i][10][k] <= M*(1-y);

forall(i in Intern, k in 1..50)
  5 -(sum(a in 0..4)w[i][11][k + a]) <= M*y;
forall(i in Intern, k in 1..50)
  x[i][11][k] <= M*(1-y);
 