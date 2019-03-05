/*********************************************
 * OPL 12.8.0.0 Model
 * Author: Christopher
 * Creation Date: 10 Nov 2018 at 3:57:17 pm
 *********************************************/

///


///List of Interns
{string}	Intern = ...;
///List of Rotations
{string}	Rotation = ...;
///List of Weeks
{string}	Week = ...;

///Duration of Rotations
int	Duration[Rotation] = ...;

///Decision Variables
dvar boolean x[Intern][Rotation][Week];
dvar int z;

///Objective Function
maximize z;
  
///Constraints
  
subject to{


///pseudo objective function
forall(i in Intern, j in Rotation, k in Week)
  sum(i in Intern, j in Rotation, k in Week) x[i][j][k] == z;

///Intern Physical Constraint (can only be in one place at a time)
forall(i in Intern, k in Week)
  sum(j in Rotation)x[i][j][k] <= 1;

///Intern Rotation Completiion Constraint (everyone must do one of the rotations) 
forall(i in Intern, j in Rotation)
  sum(k in Week)x[i][j][k] >= 1;
  
///Intern Rotation Capacity Constraint
forall(k in Week)
  sum(i in Intern)x[i]["CPD-G"][k] <= 2;
forall(k in Week)
  sum(i in Intern)x[i]["CPD-V"][k] <= 1;  
forall(k in Week)
  sum(i in Intern)x[i]["AP"][k] <= 1;  
forall(k in Week)
  sum(i in Intern)x[i]["MIC"][k] <= 1;
forall(k in Week)
  sum(i in Intern)x[i]["MCH"][k] <= 1;
forall(k in Week)
  sum(i in Intern)x[i]["CPCa"][k] <= 1;  
forall(k in Week)
  sum(i in Intern)x[i]["CPM"][k] <= 11;
forall(k in Week)
  sum(i in Intern)x[i]["CPK"][k] <= 11;
forall(k in Week)
  sum(i in Intern)x[i]["IP"][k] <= 2;
forall(k in Week)
  sum(i in Intern)x[i]["DISP"][k] <= 11;
forall(k in Week)
  sum(i in Intern)x[i]["CPC"][k] <= 11;
forall(k in Week)
  sum(i in Intern)x[i]["QUM"][k] <= 1;
forall(k in Week)
  sum(i in Intern)x[i]["H"][k] <= 1;
forall(k in Week)
  sum(i in Intern)x[i]["A/L_1"][k] == 11;
forall(k in Week)
  sum(i in Intern)x[i]["A/L_2.1"][k] == 6;
forall(k in Week)
  sum(i in Intern)x[i]["A/L_2.2"][k] == 5;
  
  
///Intern Rotation Duration Constraint (How long the rotation goes for)  
forall(i in Intern)
  sum(j in Rotation, k in Week) Duration[j]*x[i][j][k] >= 47;
  
///Intern Leave Constraint
forall(i in Intern)
  sum(k in Week) x[i]["A/L_1"][k] ==1;
forall(i in Intern)
  sum(k in Week) x[i]["A/L_2.1"][k] ==1;
forall(i in Intern)
  sum(k in Week) x[i]["A/L_2.2"][k] ==1;



}