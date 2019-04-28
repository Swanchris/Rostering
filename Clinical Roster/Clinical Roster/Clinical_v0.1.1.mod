/*********************************************
 * OPL 12.8.0.0 Model
 * Author: asus
 * Creation Date: 23 Apr 2019 at 8:37:29 pm
 *********************************************/
  //Parameters
  
 range				Pharm = 1..42;
 range				Job = 1..37;
 range				Week = 1..52;
 range				Day = 1..5;
 
  //Decision Variables
  
 dvar boolean		y[Pharm][Job][Week][Day];
 
  //Objective Function
  
 //dexpr int			z = sum(j in Job, w in Week, d in Day) y[42][j][w][d];
 //minimize z;


//Rotation Satisfaction

//Special Medicine
dexpr int			S1_1 = sum(w in Week, d in Day) y[1][1][w][d];

dexpr int			S1_2 = sum(w in Week, d in Day) y[2][1][w][d];

dexpr int			S2_1 = sum(w in Week, d in Day) y[3][2][w][d];

dexpr int			S2_2 = sum(w in Week, d in Day) y[4][2][w][d];

dexpr int			S3 = sum(w in Week, d in Day) y[5][3][w][d];

dexpr int			S4 = sum(w in Week, d in Day) y[6][4][w][d];

dexpr int			S5 = sum(w in Week, d in Day) y[7][5][w][d];

dexpr int			S6 = sum(w in Week, d in Day) y[8][6][w][d];

dexpr int			S7 = sum(w in Week, d in Day) y[10][7][w][d];

dexpr int			S8 = sum(w in Week, d in Day) y[9][8][w][d];



//General Medicine



//Digestive Health
dexpr int			D17 = sum(w in Week, d in Day) y[26][17][w][d];

dexpr int			D18 = sum(w in Week, d in Day) y[27][18][w][d];

dexpr int			D19_1 = sum(w in Week, d in Day) y[24][19][w][d];

dexpr int			D19_2 = sum(w in Week, d in Day) y[25][19][w][d];

dexpr int			D20 = sum(w in Week, d in Day) y[28][20][w][d];

dexpr int			D21 = sum(w in Week, d in Day) y[32][21][w][d];

dexpr int			D22 = sum(w in Week, d in Day) y[29][22][w][d];


dexpr int			R = S1_1 + S1_2 + S2_1 + S2_2 + S3 + S4 + S5 + S6 + S7 + S8 + D17 + D18 + D19_1 + D19_2 +
					D20 + D21 + D22;

maximize R;
 
  //Constraints
 
 subject to{
 
 
 //ADOs
 
 //p = 2
   sum(w in 1..4, d in 2..4) y[2][32][w][d] ==1;   
   sum(w in 5..8, d in 2..4) y[2][32][w][d] ==1;
   sum(w in 9..12, d in 2..4) y[2][32][w][d] ==1;
   sum(w in 13..16, d in 2..4) y[2][32][w][d] ==1;
   sum(w in 17..20, d in 2..4) y[2][32][w][d] ==1;
   sum(w in 21..24, d in 2..4) y[2][32][w][d] ==1;
   sum(w in 25..28, d in 2..4) y[2][32][w][d] ==1;
   sum(w in 29..32, d in 2..4) y[2][32][w][d] ==1;
   sum(w in 33..36, d in 2..4) y[2][32][w][d] ==1;
   sum(w in 37..40, d in 2..4) y[2][32][w][d] ==1;
   sum(w in 41..44, d in 2..4) y[2][32][w][d] ==1;
   sum(w in 45..48, d in 2..4) y[2][32][w][d] ==1;
   sum(w in 49..52, d in 2..4) y[2][32][w][d] ==1;
 
 //p in 5..9
 forall(p in 5..9)
   sum(w in 1..4, d in 1..5) y[p][32][w][d] ==1;   
 forall(p in 5..9)
   sum(w in 5..8, d in 1..5) y[p][32][w][d] ==1;
 forall(p in 5..9)
   sum(w in 9..12, d in 1..5) y[p][32][w][d] ==1;
 forall(p in 5..9)
   sum(w in 13..16, d in 1..5) y[p][32][w][d] ==1;
 forall(p in 5..9)
   sum(w in 17..20, d in 1..5) y[p][32][w][d] ==1;
 forall(p in 5..9)
   sum(w in 21..24, d in 1..5) y[p][32][w][d] ==1;
 forall(p in 5..9)
   sum(w in 25..28, d in 1..5) y[p][32][w][d] ==1;
 forall(p in 5..9)
   sum(w in 29..32, d in 1..5) y[p][32][w][d] ==1;
 forall(p in 5..9)
   sum(w in 33..36, d in 1..5) y[p][32][w][d] ==1;
 forall(p in 5..9)
   sum(w in 37..40, d in 1..5) y[p][32][w][d] ==1;
 forall(p in 5..9)
   sum(w in 41..44, d in 1..5) y[p][32][w][d] ==1;
 forall(p in 5..9)
   sum(w in 45..48, d in 1..5) y[p][32][w][d] ==1;
 forall(p in 5..9)
   sum(w in 49..52, d in 1..5) y[p][32][w][d] ==1;
 
 //p in 12..22
 forall(p in 12..22)
   sum(w in 1..4, d in 1..5) y[p][32][w][d] ==1;   
 forall(p in 12..22)
   sum(w in 5..8, d in 1..5) y[p][32][w][d] ==1;
 forall(p in 12..22)
   sum(w in 9..12, d in 1..5) y[p][32][w][d] ==1;
 forall(p in 12..22)
   sum(w in 13..16, d in 1..5) y[p][32][w][d] ==1;
 forall(p in 12..22)
   sum(w in 17..20, d in 1..5) y[p][32][w][d] ==1;
 forall(p in 12..22)
   sum(w in 21..24, d in 1..5) y[p][32][w][d] ==1;
 forall(p in 12..22)
   sum(w in 25..28, d in 1..5) y[p][32][w][d] ==1;
 forall(p in 12..22)
   sum(w in 29..32, d in 1..5) y[p][32][w][d] ==1;
 forall(p in 12..22)
   sum(w in 33..36, d in 1..5) y[p][32][w][d] ==1;
 forall(p in 12..22)
   sum(w in 37..40, d in 1..5) y[p][32][w][d] ==1;
 forall(p in 12..22)
   sum(w in 41..44, d in 1..5) y[p][32][w][d] ==1;
 forall(p in 12..22)
   sum(w in 45..48, d in 1..5) y[p][32][w][d] ==1;
 forall(p in 12..22)
   sum(w in 49..52, d in 1..5) y[p][32][w][d] ==1;

 //p in 26..35
 forall(p in 26..35)
   sum(w in 1..4, d in 1..5) y[p][32][w][d] ==1;   
 forall(p in 26..35)
   sum(w in 5..8, d in 1..5) y[p][32][w][d] ==1;
 forall(p in 26..35)
   sum(w in 9..12, d in 1..5) y[p][32][w][d] ==1;
 forall(p in 26..35)
   sum(w in 13..16, d in 1..5) y[p][32][w][d] ==1;
 forall(p in 26..35)
   sum(w in 17..20, d in 1..5) y[p][32][w][d] ==1;
 forall(p in 26..35)
   sum(w in 21..24, d in 1..5) y[p][32][w][d] ==1;
 forall(p in 26..35)
   sum(w in 25..28, d in 1..5) y[p][32][w][d] ==1;
 forall(p in 26..35)
   sum(w in 29..32, d in 1..5) y[p][32][w][d] ==1;
 forall(p in 26..35)
   sum(w in 33..36, d in 1..5) y[p][32][w][d] ==1;
 forall(p in 26..35)
   sum(w in 37..40, d in 1..5) y[p][32][w][d] ==1;
 forall(p in 26..35)
   sum(w in 41..44, d in 1..5) y[p][32][w][d] ==1;
 forall(p in 26..35)
   sum(w in 45..48, d in 1..5) y[p][32][w][d] ==1;
 forall(p in 26..35)
   sum(w in 49..52, d in 1..5) y[p][32][w][d] ==1;

//p = 36

   sum(w in 1..4, d in 3..5) y[36][32][w][d] ==1;   
   sum(w in 5..8, d in 3..5) y[36][32][w][d] ==1;
   sum(w in 9..12, d in 3..5) y[36][32][w][d] ==1;
   sum(w in 13..16, d in 3..5) y[36][32][w][d] ==1;
   sum(w in 17..20, d in 3..5) y[36][32][w][d] ==1;
   sum(w in 21..24, d in 3..5) y[36][32][w][d] ==1;
   sum(w in 25..28, d in 3..5) y[36][32][w][d] ==1;
   sum(w in 29..32, d in 3..5) y[36][32][w][d] ==1;
   sum(w in 33..36, d in 3..5) y[36][32][w][d] ==1;
   sum(w in 37..40, d in 3..5) y[36][32][w][d] ==1;
   sum(w in 41..44, d in 3..5) y[36][32][w][d] ==1;
   sum(w in 45..48, d in 3..5) y[36][32][w][d] ==1;
   sum(w in 49..52, d in 3..5) y[36][32][w][d] ==1;

 //p in 37..41
 forall(p in 37..41)
   sum(w in 1..4, d in 1..5) y[p][32][w][d] ==1;   
 forall(p in 37..41)
   sum(w in 5..8, d in 1..5) y[p][32][w][d] ==1;
 forall(p in 37..41)
   sum(w in 9..12, d in 1..5) y[p][32][w][d] ==1;
 forall(p in 37..41)
   sum(w in 13..16, d in 1..5) y[p][32][w][d] ==1;
 forall(p in 37..41)
   sum(w in 17..20, d in 1..5) y[p][32][w][d] ==1;
 forall(p in 37..41)
   sum(w in 21..24, d in 1..5) y[p][32][w][d] ==1;
 forall(p in 37..41)
   sum(w in 25..28, d in 1..5) y[p][32][w][d] ==1;
 forall(p in 37..41)
   sum(w in 29..32, d in 1..5) y[p][32][w][d] ==1;
 forall(p in 37..41)
   sum(w in 33..36, d in 1..5) y[p][32][w][d] ==1;
 forall(p in 37..41)
   sum(w in 37..40, d in 1..5) y[p][32][w][d] ==1;
 forall(p in 37..41)
   sum(w in 41..44, d in 1..5) y[p][32][w][d] ==1;
 forall(p in 37..41)
   sum(w in 45..48, d in 1..5) y[p][32][w][d] ==1;
 forall(p in 37..41)
   sum(w in 49..52, d in 1..5) y[p][32][w][d] ==1;





//Physical Limitation Constraint
forall(p in 1..41, w in Week, d in Day)
  sum(j in 1..30) y[p][j][w][d] <=1;



//ADO Limitation Constraint
forall(w in Week, d in Day)
  sum(p in 1..12) y[p][32][w][d] <=1;
forall(w in Week, d in Day)
  sum(p in 13..23) y[p][32][w][d] <=1;
forall(w in Week, d in Day)
  sum(p in 24..33) y[p][32][w][d] <=1;
forall(w in Week, d in Day)
  sum(p in 34..41) y[p][32][w][d] <=1;

//Job Completion Constraint
forall(w in Week, d in Day, j in 1..6)
  sum(p in Pharm) y[p][j][w][d] ==1;

forall(w in Week)
  sum(p in Pharm) y[p][7][w][3] ==1;
forall(w in Week)
  sum(p in Pharm) y[p][7][w][5] ==1;
  
forall(w in Week, d in Day, j in 8..21)
  sum(p in Pharm) y[p][j][w][d] ==1;

forall(w in Week, d in 1..4)
  sum(p in Pharm) y[p][22][w][d] ==1;

forall(w in Week, d in Day, j in 23..30)
  sum(p in Pharm) y[p][j][w][d] ==1;

//Part Timer Restrictions

//p = 1
sum(j in 1..30, w in Week, d in 2..4) y[1][j][w][d] ==0;

//p = 2
sum(j in 1..30, w in Week) y[2][j][w][1] ==0;
sum(j in 1..30, w in Week) y[2][j][w][5] ==0;

//p = 3
sum(j in 1..30, w in Week) y[3][j][w][1] ==0;
sum(j in 1..30, w in Week) y[3][j][w][3] ==0;
sum(j in 1..30, w in Week) y[3][j][w][4] ==0;

//p = 4
sum(j in 1..30, w in Week) y[4][j][w][2] ==0;
sum(j in 1..30, w in Week) y[4][j][w][5] ==0;

//p = 10
sum(j in 1..30, w in Week, d in 1..3) y[10][j][w][d] ==0;

//p = 11
sum(j in 1..30, w in Week, d in 3..4) y[11][j][w][d] ==0;
sum(j in 1..30, w in Week) y[11][j][w][5] ==0;

//p = 23
sum(j in 1..30, w in Week) y[23][j][w][1] ==0;
sum(j in 1..30, w in Week) y[23][j][w][3] ==0;
sum(j in 1..30, w in Week) y[23][j][w][5] ==0;

//p = 24
sum(j in 1..30, w in Week, d in 2..3) y[24][j][w][d] ==0;

//p = 25
sum(j in 1..30, w in Week) y[25][j][w][1] ==0;
sum(j in 1..30, w in Week) y[25][j][w][4] ==0;
sum(j in 1..30, w in Week) y[25][j][w][5] ==0;

//p = 36
sum(j in 1..30, w in Week, d in 1..2) y[36][j][w][d] ==0;



//Non full time jobs

//j=7 (TB/HIV Clinics)
sum(p in Pharm, w in Week, d in 1..2) y[p][7][w][d] ==0;
sum(p in Pharm, w in Week) y[p][7][w][4] ==0;

//j=22 (AAC)
sum(p in Pharm, w in Week) y[p][22][w][5] ==0;


  
 }