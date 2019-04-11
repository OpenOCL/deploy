# Open Optimal Control Library

Dear User, 

You received a copy of OpenOCL in the form of ready to use binaries. OpenOCL is a free and open-source software that itself relies on and uses other open-source software. We would like to comply with the licenses of the included software, and we are trying to give attribution to the used software as much as we can. 

We would there like to ask you (as the user) to have a look at the attributions below, and recognize the work of the used software in OpenOCL, and cite the given papers in academic work.

You can find the source code of the included software in the folder *third_party*. You can find the license information at the top of each source file, or in a LICENSE or README file in directory.

Best
The OpenOCL developers

OpenOCL: Copyright 2019 Jonas Koenemann, University of Freiburg


## Attributions to the software used in OpenOCL

### CASADI 

Source-code in third_party/casadi

If you use CasADi in your academic work, please cite the following paper:
@Article{Andersson2018, Author = {Joel A E Andersson and Joris Gillis and Greg Horn and James B Rawlings and Moritz Diehl}, Title = {{CasADi} -- {A} software framework for nonlinear optimization and optimal control}, Journal = {Mathematical Programming Computation}, Year = {In Press, 2018}, }

### IPOPT

Source-code in third_party/ipopt

Since a lot of time and effort has gone into Ipopt's development, please cite the following publication if you are using Ipopt for your own research:
A. Wächter and L. T. Biegler, On the Implementation of a Primal-Dual Interior Point Filter Line Search Algorithm for Large-Scale Nonlinear Programming, Mathematical Programming 106(1), pp. 25-57, 2006 (preprint)

### BLASFEO

Source-code in third_party/blasfeo

The original BLASFEO paper describes the BLASFEO API and the beckend (comprising the panel-major matrix format): G. Frison, D. Kouzoupis, T. Sartor, A. Zanelli, M. Diehl, BLASFEO: basic linear algebra subroutines for embedded optimization. ACM Transactions on Mathematical Software (TOMS), 2018. (arXiv preprint https://arxiv.org/abs/1704.02457 )

### HPMPC

Source-code in third_party/hpmpc

### QPOASES

Source-code in third_party/qpoases

If you use qpOASES within your scientific work, we strongly encourage you to cite at least one of the following publications.

@ARTICLE{Ferreau2014, author = {H.J. Ferreau and C. Kirches and A. Potschka and H.G. Bock and M. Diehl}, title = {{qpOASES}: A parametric active-set algorithm for quadratic programming}, journal = {Mathematical Programming Computation}, year = {2014}, volume = {6}, number = {4}, pages = {327--363}, keywords = {qpOASES, parametric quadratic programming, active set method, model predictive control} }

### Sundials CVODES/IDAS

Source-code in third_party/sundials

### Lapack

Source-code in third_party/lapack

### HSL for ipopt

Source-code in third_party/hsl

A condition of the licence is that HSL is cited in any resulting publications or presentations: "HSL. A collection of Fortran codes for large scale scientific computation. http://www.hsl.rl.ac.uk/"

### Bonmin

Source-code in third_party/bonmin

Description of the underlying algorithms in Bonmin can be found in: P. Bonami, L.T. Biegler, A.R. Conn, G. Cornuejols, I.E. Grossmann, C.D. Laird, J. Lee, A. Lodi, F. Margot, N.Sawaya and A. Waechter, An Algorithmic Framework for Convex Mixed Integer Nonlinear Programs. Discrete Optimization. 5(2):186-204, 2008. Third Party required code

### Csparse

Source-code in third_party/csparse

### OpenBLAS

Source-code in third_party/openblas

### Mumps

Source-code in third_party/mumps

[1] P. R. Amestoy, I. S. Duff, J. Koster and J.-Y. L'Excellent, A fully asynchronous multifrontal solver using distributed dynamic scheduling, SIAM Journal of Matrix Analysis and Applications, Vol 23, No 1, pp 15-41 (2001). [2] P. R. Amestoy, A. Guermouche, J.-Y. L'Excellent and S. Pralet, Hybrid scheduling for the parallel solution of linear systems. Parallel Computing Vol 32 (2), pp 136-156 (2006).

### Metis 

Source-code in third_party/metis

### SWIG

Source-code in third_party/swig

How to cite METIS? “A Fast and Highly Quality Multilevel Scheme for Partitioning Irregular Graphs”. George Karypis and Vipin Kumar. SIAM Journal on Scientific Computing, Vol. 20, No. 1, pp. 359—392, 1999.
