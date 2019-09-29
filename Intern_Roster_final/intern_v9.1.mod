/*********************************************
 * OPL 12.8.0.0 Model
 * Author: chirs + kipp
 * Creation Date: 19 Mar 2019 at 5:03:48 pm
 *********************************************/
 
//Just Clinical Competency
  
range Week = 1..54;
range Intern = 1..11;
range Rotation = 1..17;

dvar boolean  x[Intern][Rotation][Week];

dvar boolean  D[Week];

dvar boolean  y1[Intern][Week];
dvar boolean  y2[Intern][Week];
dvar boolean  y3[Intern][Week];
dvar boolean  y4[Intern][Week];
dvar boolean  y5[Intern][Week];
dvar boolean  y6[Intern][Week];
dvar boolean  y7[Intern][Week];
dvar boolean  y8[Intern][Week];
dvar boolean  y9[Intern][Week];
dvar boolean  y11[Intern][Week];
dvar boolean  y12[Intern][Week];


dvar boolean  L1[Week];
dvar boolean  L2[Week];
dvar boolean  L3[Week];

dvar boolean  s[Intern];

int       M = 1000;

dexpr int z = sum(i in Intern, j in Rotation, k in Week) x[i][j][k];

minimize z;


subject to{

//let Rotation 17 be Weeks 1-4 when Interns 7-11 have not yet begun and
// Weeks 51-54 when Intern 1-6 have finished

forall(i in 1..6)
  sum(k in 51..54)x[i][17][k] ==4;
  
forall(i in 7..11)
  sum(k in 1..4)x[i][17][k] ==4;

forall(i in 1..6)
  sum(k in 1..50)x[i][17][k] ==0;
  
forall(i in 7..11)
  sum(k in 5..54)x[i][17][k] ==0;
  
//Orientation Constraints

forall(i in 1..6)
  sum(k in 1..4)x[i][5][k] ==1;
  
forall(i in 7..11)
  sum(k in 5..8)x[i][5][k] ==1;
  
forall(i in 1..6)
  sum(k in 1..4)x[i][9][k] ==1;  

forall(i in 7..11)
  sum(k in 5..8)x[i][9][k] ==1;
  
forall(i in 1..6)
  sum(k in 1..4)x[i][10][k] ==2;
  
forall(i in 7..11)
  sum(k in 5..8)x[i][10][k] ==2;

///Intern Physical Constraint (can only be in one place at a time)
forall(i in Intern, k in Week)
  sum(j in Rotation)x[i][j][k] <= 1;

///Intern Rotation Completiion Constraint (everyone must do one of the rotations) 

//CPD-G (j=1)  
forall(i in Intern)
  sum(k in Week)x[i][1][k] == 8;

//CPD-V (j=2)  
forall(i in Intern)
  sum(k in Week)x[i][2][k] == 3;

//AP (j=3) 
forall(i in Intern)
  sum(k in 1..49)x[i][3][k] == 4;

//MIC (j=4)
forall(i in Intern)
  sum(k in 1..49)x[i][4][k] == 4;

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
  sum(k in 1..43)x[i][9][k] == 5;

//DISP (j=10)  
forall(i in Intern)
  sum(k in Week)x[i][10][k] == 5;

//CPC (j=11)  
forall(i in Intern)
  sum(k in Week)x[i][11][k] == 4;

//QUM (j=12)  
forall(i in Intern)
  sum(k in 1..30)x[i][12][k] == 2;
  
//H (j=13)  
forall(i in Intern)
  sum(k in 1..30)x[i][13][k] == 1;

//Clinical Competency
forall(i in Intern)
  sum(k in 1..27, j in 1..2)x[i][j][k] + sum(k in 1..27, j in 6..8)x[i][j][k] + sum(k in 1..27)x[i][11][k] >=3;

///Intern Rotation Capacity Constraint

//CPD-G (j=1)  
forall(k in Week)
  sum(i in Intern)x[i][1][k] <= 2;
  
  ///PAIRING OF GEN MED:
forall(k in Week)
  2 - (sum(i in 1..10)x[i][1][k]) <= M*D[k];
forall(i in 1..10, k in Week)
  x[i][1][k] <= M*(1-D[k]);
  
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
forall(k in 1..8)
  sum(i in Intern)x[i][5][k] <= 2;
forall(k in 9..30)
  sum(i in Intern)x[i][5][k] <= 1;

//CPCa (j=6)  
forall(k in Week)
  sum(i in Intern)x[i][6][k] <= 1;  

//CPM (j=7)   
forall(k in Week)
  sum(i in Intern)x[i][7][k] <= 1;

//CPK (j=8)  
forall(k in Week)
  sum(i in Intern)x[i][8][k] <= 1;

//IP (j=9) 
forall(k in Week)
  sum(i in Intern)x[i][9][k] <= 2;

//DISP (j=10)    
forall(k in Week)
  sum(i in Intern)x[i][10][k] <= 3;

//CPC (j=11)  
forall(k in Week)
  sum(i in Intern)x[i][11][k] <= 5;

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
  8 -(sum(a in 0..7)x[i][1][k + a]) <= M*(1-y1[i][k]);

//CPD-V (j=2)  
forall(i in Intern)
  sum(k in 1..52)y2[i][k] ==1;
forall(i in Intern, k in 1..52)
  3 -(sum(a in 0..2)x[i][2][k + a]) <= M*(1-y2[i][k]);

//AP (j=3) 
forall(i in Intern)
  sum(k in 1..51)y3[i][k] ==1;
forall(i in Intern, k in 1..51)
  4 -(sum(a in 0..3)x[i][3][k + a]) <= M*(1-y3[i][k]);

//MIC (j=4)    
forall(i in Intern)
  sum(k in 1..26)y4[i][k] ==1;
forall(i in Intern, k in 1..26)
  2 -(sum(a in 0..1)x[i][4][k + a]) <= M*(1-y4[i][k]);
forall(i in Intern)
  sum(k in 28..48)y4[i][k] ==1;
forall(i in Intern, k in 28..48)
  2 -(sum(a in 0..1)x[i][4][k + a]) <= M*(1-y4[i][k]);

//Stopping 4 weeks in a row:
forall(i in Intern)
  x[i][4][28] <= M*s[i];
forall(i in Intern)
  x[i][4][27] <= M*(1-s[i]);
    

//MCH (j=5)  
forall(i in Intern)
  sum(k in 1..53)y5[i][k] ==1;
forall(i in Intern, k in 1..53)
  2 -(sum(a in 0..1)x[i][5][k + a]) <= M*(1-y5[i][k]);

//CPCa (j=6)  
forall(i in Intern)
  sum(k in 1..52)y6[i][k] ==1;
forall(i in Intern, k in 1..52)
  3 -(sum(a in 0..2)x[i][6][k + a]) <= M*(1-y6[i][k]);

//CPM (j=7)
forall(i in Intern)
  sum(k in 1..52)y7[i][k] ==1;
forall(i in Intern, k in 1..52)
  3 -(sum(a in 0..2)x[i][7][k + a]) <= M*(1-y7[i][k]);

//CPK (j=8)  
forall(i in Intern)
  sum(k in 1..52)y8[i][k] ==1;
forall(i in Intern, k in 1..52)
  3 -(sum(a in 0..2)x[i][8][k + a]) <= M*(1-y8[i][k]);

//IP (j=9) 
forall(i in Intern)
  sum(k in 1..51)y9[i][k] ==1;
forall(i in Intern, k in 1..51)
  4 -(sum(a in 0..3)x[i][9][k + a]) <= M*(1-y9[i][k]);

//CPC (j=11)  
forall(i in Intern)
  sum(k in 1..51)y11[i][k] ==1;
forall(i in Intern, k in 1..51)
  4 -(sum(a in 0..3)x[i][11][k + a]) <= M*(1-y11[i][k]);

//QUM (j=12)
forall(i in Intern)
  sum(k in 1..29)y12[i][k] ==1;
forall(i in Intern, k in 1..29)
  2 - (sum(a in 0..1)x[i][12][k + a]) <= M*(1-y12[i][k]);

//Intern Leave Constraints

//"A holiday around April and a holiday around August"

//Week 1
sum(i in Intern)x[i][14][21] == 11;

//Week 2
sum(k in 37..38)L2[k] ==1;
forall(k in 37..38)
  sum(i in Intern)x[i][15][k] == 6*L2[k];
sum(k in 37..38)L3[k] ==1;  
forall(k in 37..38)
  sum(i in Intern)x[i][16][k] == 5*L3[k];


//Avoidance Constraint (no one week rotations during seminar weeks/public holidays) - up until Week 30

//Dec25, Dec26
forall(i in Intern)
  x[i][13][4] ==0;

//Jan1
forall(i in Intern)
  x[i][13][5] ==0;

//13an27
forall(i in Intern)
  x[i][13][9] ==0;  

//Seminar1
forall(i in Intern)
  x[i][13][11] ==0;

//Mar9(LabourDay)
forall(i in Intern)
  x[i][13][15] ==0;

//Apr10(GoodFriday)
forall(i in Intern)
  x[i][13][19] ==0;
  
//Apr13(EasterMonday)
forall(i in Intern)
  x[i][13][20] ==0;

//Seminar2
forall(i in Intern)
  x[i][13][26] ==0;

//Jun8(QueensBirthday)
forall(i in Intern)
  x[i][13][28] ==0;

//Seminar3
forall(i in Intern)
  x[i][13][33] ==0;

//Seminar4+PotentialGrandFinalFriday
forall(i in Intern)
  x[i][13][43] ==0;

//PotentialGrandFinalFriday
forall(i in Intern)
  x[i][13][44] ==0;

//Nov3(MelbCup)
forall(i in Intern)
  x[i][13][49] ==0;

}