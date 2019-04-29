/*********************************************
 * OPL 12.8.0.0 Model
 * Author: chirs + kipp
 * Creation Date: 19 Mar 2019 at 5:03:48 pm
 *********************************************/
 
range	Week = 1..54;
range	Intern = 1..11;
range	Rotation = 1..17;


dvar boolean	x[Intern][Rotation][Week];

dvar boolean	D[Week];

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


dvar boolean	L1[Week];
dvar boolean	L2[Week];
dvar boolean	L3[Week];




dexpr int	z = sum(i in Intern, j in Rotation, k in Week) x[i][j][k];

maximize z;


subject to{


///Intern Physical Constraint (can only be in one place at a time)
forall(i in Intern, k in Week)
  sum(j in Rotation)x[i][j][k] <= 1;

///Intern Rotation Completiion Constraint (everyone must do one of the rotations) 

//CPD-G (j=1)  
forall(i in Intern)
  sum(k in Week)x[i][1][k] == 8;

//CPD-V (j=2)  
forall(i in Intern)
  sum(k in Week)x[i][2][k] == 4;

//AP (j=3) 
forall(i in Intern)
  sum(k in Week)x[i][3][k] == 4;

//MIC (j=4)
forall(i in Intern)
  sum(k in Week)x[i][4][k] == 4;

//MCH (j=5)
forall(i in Intern)
  sum(k in 1..30)x[i][5][k] == 3;

//CPCa (j=6)
forall(i in Intern)
  sum(k in Week)x[i][6][k] == 3;

//CPM (j=7)  
forall(i in Intern)
  sum(k in Week)x[i][7][k] == 3;

//CPK (j=8)  
forall(i in Intern)
  sum(k in Week)x[i][8][k] == 3;

//IP (j=9)  
forall(i in Intern)
  sum(k in Week)x[i][9][k] == 5;

//DISP (j=10)  
forall(i in Intern)
  sum(k in Week)x[i][10][k] == 5;

//CPC (j=11)  
forall(i in Intern)
  sum(k in 26..54)x[i][11][k] >= 4;

//QUM (j=12)  
forall(i in Intern)
  sum(k in 1..26)x[i][12][k] == 1;
  
//H (j=13)  
forall(i in Intern)
  sum(k in 1..26)x[i][13][k] == 1;



///Intern Rotation Capacity Constraint

//CPD-G (j=1)  
forall(k in Week)
  sum(i in Intern)x[i][1][k] <= 2;
  

//CPD-V (j=2)  
forall(k in Week)
  sum(i in Intern)x[i][2][k] <= 1;  

//AP (j=3)   
forall(k in Week)
  sum(i in Intern)x[i][3][k] <= 1;  

//MIC (j=4)  
forall(k in Week)
  sum(i in Intern)x[i][4][k] <= 1;
  
//MCH (j=5)
forall(k in 1..4)
  sum(i in 1..6)x[i][5][k] <= 2;  
forall(k in 5..8)
  sum(i in Intern)x[i][5][k] <= 2;
forall(k in 9..54)
  sum(i in Intern)x[i][5][k] <= 1;

//CPCa (j=6)  
forall(k in Week)
  sum(i in Intern)x[i][6][k] <= 1;  

//CPM (j=7)   
forall(k in Week)
  sum(i in Intern)x[i][7][k] <= 3;

//CPK (j=8)  
forall(k in Week)
  sum(i in Intern)x[i][8][k] <= 1;

//IP (j=9) 
forall(k in Week)
  sum(i in Intern)x[i][9][k] <= 2;

//DISP (j=10)    
forall(k in 1..4)
  sum(i in 1..6)x[i][10][k] <= 3;  
forall(k in 5..8)
  sum(i in Intern)x[i][10][k] <= 3;
forall(k in 9..54)
  sum(i in Intern)x[i][10][k] <= 2;

//CPC (j=11)  
forall(k in Week)
  sum(i in Intern)x[i][11][k] <= 4;

//QUM (j=12)    
forall(k in Week)
  sum(i in Intern)x[i][12][k] <= 1;

//H (j=13)  
forall(k in Week)
  sum(i in Intern)x[i][13][k] <= 1;


//Intern Rotation Duration Constraint

//CPD-G (j=1)  
forall(i in Intern)
  sum(k in 1..47)y1[i][k] ==1;
forall(i in Intern, k in 1..47)
  8 -(sum(a in 0..7)x[i][1][k + a]) <= 8*(1-y1[i][k]);

//CPD-V (j=2)  
forall(i in Intern)
  sum(k in 1..51)y2[i][k] ==1;
forall(i in Intern, k in 1..51)
  4 -(sum(a in 0..3)x[i][2][k + a]) <= 4*(1-y2[i][k]);

//AP (j=3) 
forall(i in Intern)
  sum(k in 1..51)y3[i][k] ==1;
forall(i in Intern, k in 1..51)
  4 -(sum(a in 0..3)x[i][3][k + a]) <= 4*(1-y3[i][k]);

//MIC (j=4)    

forall(i in Intern)
  sum(k in 1..25)y4[i][k] ==1;
forall(i in Intern, k in 1..25)
  2 -(sum(a in 0..1)x[i][4][k + a]) <= 2*(1-y4[i][k]);
forall(i in Intern)
  sum(k in 27..53)y4[i][k] ==1;
forall(i in Intern, k in 27..53)
  2 -(sum(a in 0..1)x[i][4][k + a]) <= 2*(1-y4[i][k]);

//MCH (j=5)  
forall(i in Intern)
  sum(k in 1..53)y5[i][k] ==1;
forall(i in Intern, k in 1..53)
  2 -(sum(a in 0..1)x[i][5][k + a]) <= 2*(1-y5[i][k]);


//CPCa (j=6)  
forall(i in Intern)
  sum(k in 1..52)y6[i][k] ==1;
forall(i in Intern, k in 1..52)
  3 -(sum(a in 0..2)x[i][6][k + a]) <= 3*(1-y6[i][k]);

//CPM (j=7)
forall(i in Intern)
  sum(k in 1..52)y7[i][k] ==1;
forall(i in Intern, k in 1..52)
  3 -(sum(a in 0..2)x[i][7][k + a]) <= 3*(1-y7[i][k]);

//CPK (j=8)  
forall(i in Intern)
  sum(k in 1..52)y8[i][k] ==1;
forall(i in Intern, k in 1..52)
  3 -(sum(a in 0..2)x[i][8][k + a]) <= 3*(1-y8[i][k]);

//IP (j=9) 
forall(i in Intern)
  sum(k in 1..40)y9[i][k] ==1;
forall(i in Intern, k in 1..40)
  4 -(sum(a in 0..3)x[i][9][k + a]) <= 4*(1-y9[i][k]);

//DISP (j=10)    
forall(i in Intern)
  sum(k in 1..52)y10[i][k] ==1;
forall(i in Intern, k in 1..52)
  3 -(sum(a in 0..2)x[i][10][k + a]) <= 3*(1-y10[i][k]);

//CPC (j=11)  
forall(i in Intern)
  sum(k in 1..51)y11[i][k] ==1;
forall(i in Intern, k in 1..51)
  4 -(sum(a in 0..3)x[i][11][k + a]) <= 4*(1-y11[i][k]);

}