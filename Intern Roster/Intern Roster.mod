/*********************************************
 * OPL 12.8.0.0 Model
 * Author: Christopher
 * Creation Date: 10 Nov 2018 at 3:57:17 pm
 *********************************************/
{string}	Intern = ...;
{string}	Rotation = ...;
float+ 	Week = [1,2,3,4,5,6,7,8,9,10];
float+	Alpha = {1,8};

dvar boolean x[Intern][Rotation][Week];
dvar boolean y[Intern][Rotation][Week + Alpha];
dvar boolean z[Week];
int  C[Intern][Rotation];

maximize sum (i in Intern, j in Rotation, k in Week) C[Intern][Rotation]*x[Intern][Rotation][Week];
  
subject to{



}