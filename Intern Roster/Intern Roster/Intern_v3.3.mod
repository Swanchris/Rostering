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
{string} Intern = ...;
{string} Rotation = ...;

int Duration[Rotation] = ...;
dvar boolean	x[Intern][Rotation];


dvar int	Total;

minimize Total;


subject to{

///Intern Rotation Capacity Constraint
forall(i in Intern)
  sum(j in Rotation)x[i][j] == 1;

//Intern Rotation Duration Constraint

forall(j in Rotation)
  sum(i in Intern)Duration[j]*x[i][j] <= Total;

}