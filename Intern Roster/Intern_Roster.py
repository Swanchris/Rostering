
# coding: utf-8

# # Intern Roster

# ## Introduction

# We have 11 interns. Let each intern be $i$.
# 
# We have 13 rotations.  Let each rotation be $j$.  There are also three annual leave rotations.  These shall be $j$ values 14, 15, 16.  Therefore the total is 16.
# 
# We have 54 weeks for the whole period of the roster.  Let each week be $k$.
# 
# |j|Rotation Label|Duration|Maximum Interns per week|
# |:-:|:-:|:-:|:-:|
# |1|CPD-G|8|2|
# |2|CPD-V|4|1|
# |3|AP|4|1|
# |4|MIC|4|1|
# |5|MCH|2|1|
# |6|CPCa|3|1|
# |7|CPM|3|no limit|
# |8|CPK|2|no limit|
# |9|IP|4|2|
# |10|DISP|3|no limit|
# |11|CPC|5|no limit|
# |12|QUM|1|1|
# |13|H|1|1|
# |14|A/L_1|1|11|
# |15|A/L_2.1|1|6|
# |16|A/L_2.2|1|5|
# 
# 

# ## Decision Variables

# $x_{jk}^i$
# 
# $C_{ij}$
# 
# $y_{j,k + \alpha}^i \quad$ where $\quad \alpha \in \mathbb{Z}$
# 
# $z_k$

# ## Objective Function

# $$ \text{max} \sum_i \; \sum_j \; \sum_k C_{ij}x_{jk}^i$$

# ## Constraints

# _Intern Rotation Completion Constraint_
# 
# Let $x_{jk}^i = 1$ if person $i$ is doing rotation $j$ for week $k$.
# 
# $$\sum_k x_{jk}^i \geq 1 \quad  \forall i ,\quad \forall j$$

# $x_{1,1}^1 + x_{1,2}^1 + \cdots + x_{1,54}^1  \geq 1$
# 
# $x_{1,1}^2 + x_{1,2}^2 + \cdots + x_{1,54}^2  \geq 1$
# 
# $\vdots$
# 
# $x_{1,1}^{11} + x_{1,2}^{11} + \cdots + x_{1,54}^{11}  \geq 1$
# 
# $\vdots$
# 
# $\vdots$
# 
# $x_{16,1}^{11} + x_{16,2}^{11} + \cdots + x_{16,54}^{11}  \geq 1$
# 
# 

#  _Intern Rotation Capacity Constraint_
# 
# $$\sum_{i}  x_{1,k}^i \leq 2  \quad  \; \forall k$$
# $$\sum_{i}  x_{2,k}^i \leq 1  \quad  \; \forall k$$
# $$\sum_{i}  x_{3,k}^i \leq 1  \quad  \; \forall k$$
# $$\sum_{i}  x_{4,k}^i \leq 1  \quad  \; \forall k$$
# $$\sum_{i}  x_{5,k}^i \leq 1  \quad  \; \forall k$$
# $$\sum_{i}  x_{6,k}^i \leq 1  \quad  \; \forall k$$
# $$\sum_{i}  x_{7,k}^i \geq 0  \quad  \; \forall k$$
# $$\sum_{i}  x_{8,k}^i \geq 0  \quad  \; \forall k$$
# $$\sum_{i}  x_{9,k}^i \leq 2  \quad  \; \forall k$$
# $$\sum_{i}  x_{10,k}^i \geq 0  \quad  \; \forall k$$
# $$\sum_{i}  x_{11,k}^i \geq 0  \quad  \; \forall k$$
# $$\sum_{i}  x_{12,k}^i \leq 1  \quad  \; \forall k$$
# $$\sum_{i}  x_{13,k}^i \leq 1  \quad  \; \forall k$$
# $$\sum_{i}  x_{14,k}^i = 11  \quad  \; \forall k$$
# $$\sum_{i=1}^6  x_{15,k}^i = 6  \quad  \; \forall k$$
# $$\sum_{i=7}^{11}  x_{16,k}^i = 5  \quad  \; \forall k$$

#  _Intern Rotation Duration Constraint_
# 
# $$\sum_{\alpha = 0}^7 y_{1,k + \alpha}^i = 8 \; \text{  if  }\; x_{1,k}^i = 1$$
# 
# $$\sum_{\alpha = 0}^3 y_{2,k + \alpha}^i = 4 \; \text{  if  }\; x_{2,k}^i = 1$$
# 
# $$\sum_{\alpha = 0}^3 y_{3,k + \alpha}^i = 4 \; \text{  if  }\; x_{3,k}^i = 1$$
# 
# $$\sum_{\alpha = 0}^3 y_{4,k + \alpha}^i = 4 \; \text{  if  }\; x_{4,k}^i = 1$$
# 
# $$\sum_{\alpha = 0}^1 y_{5,k + \alpha}^i = 2 \; \text{  if  }\; x_{5,k}^i = 1$$
# 
# $$\sum_{\alpha = 0}^2 y_{6,k + \alpha}^i = 3 \; \text{  if  }\; x_{6,k}^i = 1$$
# 
# $$\sum_{\alpha = 0}^2 y_{7,k + \alpha}^i = 3 \; \text{  if  }\; x_{7,k}^i = 1$$
# 
# $$\sum_{\alpha = 0}^1 y_{8,k + \alpha}^i = 2 \; \text{  if  }\; x_{8,k}^i = 1$$
# 
# $$\sum_{\alpha = 0}^3 y_{9,k + \alpha}^i = 4 \; \text{  if  }\; x_{9,k}^i = 1$$
# 
# $$\sum_{\alpha = 0}^2 y_{10,k + \alpha}^i = 3 \; \text{  if  }\; x_{10,k}^i = 1$$
# 
# $$\sum_{\alpha = 0}^4 y_{11,k + \alpha}^i = 5 \; \text{  if  }\; x_{11,k}^i = 1$$
# 
# $$ y_{12,k}^i = 1 \; \text{  if  }\; x_{12,k}^i = 1$$
# 
# $$ y_{13,k}^i = 1 \; \text{  if  }\; x_{13,k}^i = 1$$
# 
# $$ y_{14,k}^i = 1 \; \text{  if  }\; x_{14,k}^i = 1$$
# 
# $$ y_{15,k}^i = 1 \; \text{  if  }\; x_{15,k}^i = 1$$
# 
# $$ y_{16,k}^i = 1 \; \text{  if  }\; x_{16,k}^i = 1$$

# _Intern Leave Constraint_
# 
# $$\sum_i x_{14,k}^i = 11z_k \quad \text{if} \quad \sum_k z_k =1$$
# 
# $$\sum_i x_{15,k}^i = 6z_k \quad \text{if} \quad \sum_k z_k =1$$
# 
# $$\sum_i x_{16,k}^i = 5z_k \quad \text{if} \quad \sum_k z_k =1$$
