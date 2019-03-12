/*********************************************
 * OPL 12.8.0.0 Model
 * Author: kipphughes
 * Creation Date: 12 Mar 2019 at 1:29:06 pm
 *********************************************/
///Strings
{string}	pharm = ...;
{string}	job = ...;
{string}	day = ...;

///Decision Variables
dvar int z;
dvar boolean	y[pharm][job][day];
dvar boolean	x[pharm][job];

///Objective Function
maximize z;

///Constraints
subject to {
///objective function
forall(p in pharm, d in day)
  	sum(j in job) y[p][j][d] == z;

///job completion constraint
forall(j in job, d in day)
	sum(p in pharm) y[p][j][d] == 1;
	
///birthday constraint
y["KA"]["009"]["077"] == 1;
y["AA"]["009"]["043"] == 1;
y["JA"]["009"]["175"] == 1;
y["JD"]["009"]["123"] == 1;
y["SA"]["009"]["169"] == 1;

///ado constraint

///time in lieu constraint

}
