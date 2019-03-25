/*********************************************
 * OPL 12.8.0.0 Model
 * Author: chirs + kipp
 * Creation Date: 19 Mar 2019 at 5:03:48 pm
 *********************************************/
/*********************************************
 * OPL 12.8.0.0 Model
 * Author: asus
 * Creation Date: 19 Mar 2019 at 12:47:30 pm
 *********************************************/
range	Week = 1..54;
range	Intern = 1..11;
range	Rotation = 1..16;


dvar boolean	x[Intern][Rotation][Week];
//dvar boolean	w[Intern][Rotation][Week];

dvar boolean	y1;
dvar boolean	y2;
dvar boolean	y3;
dvar boolean	y4;
dvar boolean	y5;
dvar boolean	y6;
dvar boolean	y7;
dvar boolean	y8;
dvar boolean	y9;
dvar boolean	y10;
dvar boolean	y11;
int				M = 100;

dexpr int	z = sum(i in Intern, j in Rotation, k in Week) x[i][j][k];

maximize z;


subject to{

//forall(i in Intern, j in Rotation, k in Week)
//  x[i][j][k] == w[i][j][k];


///Intern Physical Constraint (can only be in one place at a time)
forall(i in Intern, k in Week)
  sum(j in Rotation)x[i][j][k] <= 1;

///Intern Rotation Completiion Constraint (everyone must do one of the rotations) 
forall(i in Intern)
  sum(k in Week)x[i][1][k] >= 8;
  
forall(i in Intern)
  sum(k in Week)x[i][2][k] >= 4;
  
forall(i in Intern)
  sum(k in Week)x[i][3][k] == 4;
  
forall(i in Intern)
  sum(k in Week)x[i][4][k] >= 4;  
  
forall(i in Intern)
  sum(k in Week)x[i][5][k] >= 2;
  
forall(i in Intern)
  sum(k in Week)x[i][6][k] >= 3;
  
forall(i in Intern)
  sum(k in Week)x[i][7][k] >= 3;
  
forall(i in Intern)
  sum(k in Week)x[i][8][k] >= 2;
  
forall(i in Intern)
  sum(k in Week)x[i][9][k] >= 4;
  
forall(i in Intern)
  sum(k in Week)x[i][10][k] >= 3;
  
forall(i in Intern)
  sum(k in Week)x[i][11][k] >= 5;
  
forall(i in Intern)
  sum(k in Week)x[i][12][k] == 1;
  
forall(i in Intern)
  sum(k in Week)x[i][13][k] == 1;
  
forall(i in Intern)
  sum(k in Week)x[i][14][k] == 1;
  
forall(i in Intern)
  sum(k in Week)x[i][15][k] == 1;
  
forall(i in Intern)
  sum(k in Week)x[i][16][k] == 1;


///Intern Rotation Capacity Constraint
forall(k in Week)
  sum(i in Intern)x[i][1][k] <= 2;
  
forall(k in Week)
  sum(i in Intern)x[i][2][k] <= 1;  
  
forall(k in Week)
  sum(i in Intern)x[i][3][k] <= 1;  
  
forall(k in Week)
  sum(i in Intern)x[i][4][k] <= 1;
  
forall(k in Week)
  sum(i in Intern)x[i][5][k] <= 1;
  
forall(k in Week)
  sum(i in Intern)x[i][6][k] <= 1;  
  
forall(k in Week)
  sum(i in Intern)x[i][7][k] <= 11;
  
forall(k in Week)
  sum(i in Intern)x[i][8][k] <= 11;
  
forall(k in Week)
  sum(i in Intern)x[i][9][k] <= 2;
  
forall(k in Week)
  sum(i in Intern)x[i][10][k] <= 11;
  
forall(k in Week)
  sum(i in Intern)x[i][11][k] <= 11;
  
forall(k in Week)
  sum(i in Intern)x[i][12][k] <= 1;
  
forall(k in Week)
  sum(i in Intern)x[i][13][k] <= 1;

//Intern Rotation Duration Constraint





}