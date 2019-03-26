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


dvar boolean	y1[Intern][Week];
dvar boolean	y2[Intern][Week];
dvar boolean	y3[Intern][Week];
dvar boolean	y4[Intern][Week];
dvar boolean	y5[Intern][Week];
dvar boolean	y6[Intern][Week];
dvar boolean	y7[Intern][Week];
dvar boolean	y8[Intern][Week];
dvar boolean	y9[Intern][Week];
dvar boolean	y10[Intern][Week];
dvar boolean	y11[Intern][Week];

int				M = 1000;

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

sum(k in 1..47)y1[1][k] ==1;
sum(k in 1..47)y1[2][k] ==1;
sum(k in 1..47)y1[3][k] ==1;
sum(k in 1..47)y1[4][k] ==1;
sum(k in 1..47)y1[5][k] ==1;
sum(k in 1..47)y1[6][k] ==1;
sum(k in 1..47)y1[7][k] ==1;
sum(k in 1..47)y1[8][k] ==1;
sum(k in 1..47)y1[9][k] ==1;
sum(k in 1..47)y1[10][k] ==1;
sum(k in 1..47)y1[11][k] ==1;


forall(i in Intern, k in 1..47)
  8 -(sum(a in 0..7)x[i][1][k + a]) <= M*(1-y1[i][k]);
forall(i in Intern, k in 1..47)
  x[i][1][k] <= M*y1[i][k];
  
sum(k in 1..51)y2[1][k] ==1;
sum(k in 1..51)y2[2][k] ==1;
sum(k in 1..51)y2[3][k] ==1;
sum(k in 1..51)y2[4][k] ==1;
sum(k in 1..51)y2[5][k] ==1;
sum(k in 1..51)y2[6][k] ==1;
sum(k in 1..51)y2[7][k] ==1;
sum(k in 1..51)y2[8][k] ==1;
sum(k in 1..51)y2[9][k] ==1;
sum(k in 1..51)y2[10][k] ==1;
sum(k in 1..51)y2[11][k] ==1;
 
forall(i in Intern, k in 1..51)
  4 -(sum(a in 0..3)x[i][2][k + a]) <= M*(1-y2[i][k]);
forall(i in Intern, k in 1..51)
  x[i][2][k] <= M*y2[i][k];
  
sum(k in 1..51)y3[1][k] ==1;
sum(k in 1..51)y3[2][k] ==1;
sum(k in 1..51)y3[3][k] ==1;
sum(k in 1..51)y3[4][k] ==1;
sum(k in 1..51)y3[5][k] ==1;
sum(k in 1..51)y3[6][k] ==1;
sum(k in 1..51)y3[7][k] ==1;
sum(k in 1..51)y3[8][k] ==1;
sum(k in 1..51)y3[9][k] ==1;
sum(k in 1..51)y3[10][k] ==1;
sum(k in 1..51)y3[11][k] ==1;

 
forall(i in Intern, k in 1..51)
  4 -(sum(a in 0..3)x[i][3][k + a]) <= M*(1-y3[i][k]);
forall(i in Intern, k in 1..51)
  x[i][3][k] <= M*y3[i][k];

sum(k in 1..51)y4[1][k] ==1;
sum(k in 1..51)y4[2][k] ==1;
sum(k in 1..51)y4[3][k] ==1;
sum(k in 1..51)y4[4][k] ==1;
sum(k in 1..51)y4[5][k] ==1;
sum(k in 1..51)y4[6][k] ==1;
sum(k in 1..51)y4[7][k] ==1;
sum(k in 1..51)y4[8][k] ==1;
sum(k in 1..51)y4[9][k] ==1;
sum(k in 1..51)y4[10][k] ==1;
sum(k in 1..51)y4[11][k] ==1;

forall(i in Intern, k in 1..51)
  4 -(sum(a in 0..3)x[i][4][k + a]) <= M*(1-y4[i][k]);
forall(i in Intern, k in 1..51)
  x[i][4][k] <= M*y4[i][k];
  
sum(k in 1..53)y5[1][k] ==1;
sum(k in 1..53)y5[2][k] ==1;
sum(k in 1..53)y5[3][k] ==1;
sum(k in 1..53)y5[4][k] ==1;
sum(k in 1..53)y5[5][k] ==1;
sum(k in 1..53)y5[6][k] ==1;
sum(k in 1..53)y5[7][k] ==1;
sum(k in 1..53)y5[8][k] ==1;
sum(k in 1..53)y5[9][k] ==1;
sum(k in 1..53)y5[10][k] ==1;
sum(k in 1..53)y5[11][k] ==1;

forall(i in Intern, k in 1..53)
  2 -(sum(a in 0..1)x[i][5][k + a]) <= M*(1-y5[i][k]);
forall(i in Intern, k in 1..53)
  x[i][5][k] <= M*y5[i][k];

sum(k in 1..52)y6[1][k] ==1;
sum(k in 1..52)y6[2][k] ==1;
sum(k in 1..52)y6[3][k] ==1;
sum(k in 1..52)y6[4][k] ==1;
sum(k in 1..52)y6[5][k] ==1;
sum(k in 1..52)y6[6][k] ==1;
sum(k in 1..52)y6[7][k] ==1;
sum(k in 1..52)y6[8][k] ==1;
sum(k in 1..52)y6[9][k] ==1;
sum(k in 1..52)y6[10][k] ==1;
sum(k in 1..52)y6[11][k] ==1;

forall(i in Intern, k in 1..52)
  3 -(sum(a in 0..2)x[i][6][k + a]) <= M*(1-y6[i][k]);
forall(i in Intern, k in 1..52)
  x[i][6][k] <= M*y6[i][k];

sum(k in 1..52)y7[1][k] ==1;
sum(k in 1..52)y7[2][k] ==1;
sum(k in 1..52)y7[3][k] ==1;
sum(k in 1..52)y7[4][k] ==1;
sum(k in 1..52)y7[5][k] ==1;
sum(k in 1..52)y7[6][k] ==1;
sum(k in 1..52)y7[7][k] ==1;
sum(k in 1..52)y7[8][k] ==1;
sum(k in 1..52)y7[9][k] ==1;
sum(k in 1..52)y7[10][k] ==1;
sum(k in 1..52)y7[11][k] ==1;

forall(i in Intern, k in 1..52)
  3 -(sum(a in 0..2)x[i][7][k + a]) <= M*(1-y7[i][k]);
forall(i in Intern, k in 1..52)
  x[i][7][k] <= M*y7[i][k];

sum(k in 1..53)y8[1][k] ==1;
sum(k in 1..53)y8[2][k] ==1;
sum(k in 1..53)y8[3][k] ==1;
sum(k in 1..53)y8[4][k] ==1;
sum(k in 1..53)y8[5][k] ==1;
sum(k in 1..53)y8[6][k] ==1;
sum(k in 1..53)y8[7][k] ==1;
sum(k in 1..53)y8[8][k] ==1;
sum(k in 1..53)y8[9][k] ==1;
sum(k in 1..53)y8[10][k] ==1;
sum(k in 1..53)y8[11][k] ==1;

forall(i in Intern, k in 1..53)
  2 -(sum(a in 0..1)x[i][8][k + a]) <= M*(1-y8[i][k]);
forall(i in Intern, k in 1..53)
  x[i][8][k] <= M*y8[i][k];
  
sum(k in 1..51)y9[1][k] ==1;
sum(k in 1..51)y9[2][k] ==1;
sum(k in 1..51)y9[3][k] ==1;
sum(k in 1..51)y9[4][k] ==1;
sum(k in 1..51)y9[5][k] ==1;
sum(k in 1..51)y9[6][k] ==1;
sum(k in 1..51)y9[7][k] ==1;
sum(k in 1..51)y9[8][k] ==1;
sum(k in 1..51)y9[9][k] ==1;
sum(k in 1..51)y9[10][k] ==1;
sum(k in 1..51)y9[11][k] ==1;

forall(i in Intern, k in 1..51)
  4 -(sum(a in 0..3)x[i][9][k + a]) <= M*(1-y9[i][k]);
forall(i in Intern, k in 1..51)
  x[i][9][k] <= M*y9[i][k];

sum(k in 1..52)y10[1][k] ==1;
sum(k in 1..52)y10[2][k] ==1;
sum(k in 1..52)y10[3][k] ==1;
sum(k in 1..52)y10[4][k] ==1;
sum(k in 1..52)y10[5][k] ==1;
sum(k in 1..52)y10[6][k] ==1;
sum(k in 1..52)y10[7][k] ==1;
sum(k in 1..52)y10[8][k] ==1;
sum(k in 1..52)y10[9][k] ==1;
sum(k in 1..52)y10[10][k] ==1;
sum(k in 1..52)y10[11][k] ==1;

forall(i in Intern, k in 1..52)
  3 -(sum(a in 0..2)x[i][10][k + a]) <= M*(1-y10[i][k]);
forall(i in Intern, k in 1..52)
  x[i][10][k] <= M*y10[i][k];

sum(k in 1..50)y11[1][k] ==1;
sum(k in 1..50)y11[2][k] ==1;
sum(k in 1..50)y11[3][k] ==1;
sum(k in 1..50)y11[4][k] ==1;
sum(k in 1..50)y11[5][k] ==1;
sum(k in 1..50)y11[6][k] ==1;
sum(k in 1..50)y11[7][k] ==1;
sum(k in 1..50)y11[8][k] ==1;
sum(k in 1..50)y11[9][k] ==1;
sum(k in 1..50)y11[10][k] ==1;
sum(k in 1..50)y11[11][k] ==1;

forall(i in Intern, k in 1..50)
  5 -(sum(a in 0..4)x[i][11][k + a]) <= M*(1-y11[i][k]);
forall(i in Intern, k in 1..50)
  x[i][11][k] <= M*y11[i][k];



}