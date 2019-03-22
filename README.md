# Deployment programs for OpenOCL

The programs generate the archives to ship OpenOCL including CasADi and Ipopt.
The binaries are shipped together with the source code and the LICENSE files.

A README.txt is created to inform users about use and licenses.


Deployments script requires curl.

```
sh deploy_openocl_v3-41.sh
```
Software in OpenOCL:

* casadi, LGPL 3

Software included in casadi?   

* ipopt Eclipse Public License - v 1.0, several
* blasfeo GPL 3 with the Classpath Exception
* hpmpc LGPL 3
* qpoases, LGPL 3
* sundials cvodes/idas BSD 3-Clause License
* lapack BSD 3-Clause License modified
* HSL for ipopt/ ma27 
* bonmin Eclipse Public License - v 1.0
* CSparse LGPL 2.1
* OpenBLAS BSD 3-Clause License
* Mumps CeCILL-C
* Metis Apache License, Version 2.0
* sIPOPT (merged with ipopt)
* SWIG GPL 3, multiple, LICENSE-UNIVERSITIES 

Software interfaced but not included in casadi?   

* slicot, GPL 3
* cplex
* gurobi 
* worhp 
* knitro
* snopt

# (Scientific) Attribution

## Casadi
If you use CasADi in your academic work, please cite the following paper:

@Article{Andersson2018,
  Author = {Joel A E Andersson and Joris Gillis and Greg Horn
            and James B Rawlings and Moritz Diehl},
  Title = {{CasADi} -- {A} software framework for nonlinear optimization
           and optimal control},
  Journal = {Mathematical Programming Computation},
  Year = {In Press, 2018},
}

## Blasfeo

the original BLASFEO paper describes the BLASFEO API and the beckend (comprising the panel-major matrix format): 
G. Frison, D. Kouzoupis, T. Sartor, A. Zanelli, M. Diehl, BLASFEO: basic linear algebra subroutines for embedded optimization. ACM Transactions on Mathematical Software (TOMS), 2018. 
(arXiv preprint https://arxiv.org/abs/1704.02457 )

## hpmpc

## Qpoases
If you use qpOASES within your scientific work, we strongly encourage you to cite at least one of the following publications.

@ARTICLE{Ferreau2014,
author = {H.J. Ferreau and C. Kirches and A. Potschka and H.G. Bock and M. Diehl},
title = {{qpOASES}: A parametric active-set algorithm for quadratic programming},
journal = {Mathematical Programming Computation},
year = {2014},
volume = {6},
number = {4},
pages = {327--363},
keywords = {qpOASES, parametric quadratic programming, active set method,
            model predictive control}
}

## Sundials

## Lapack
Like all software, it is copyrighted. It is not trademarked, but we do ask the following:
If you modify the source for these routines we ask that you change the name of the routine and comment the changes made to the original.
We will gladly answer any questions regarding the software. If a modification is done, however, it is the responsibility of the person who modified the routine to provide support.

## HSL for ipopt

A condition of the licence is that HSL is cited in any resulting publications or presentations: 
"HSL. A collection of Fortran codes for large scale scientific computation. http://www.hsl.rl.ac.uk/"

## Bonmin
Description of the underlying algorithms in Bonmin can be found in: P. Bonami, L.T. Biegler, A.R. Conn, G. Cornuejols, I.E. Grossmann, C.D. Laird, J. Lee, A. Lodi, F. Margot, N.Sawaya and A. Waechter, An Algorithmic Framework for Convex Mixed Integer Nonlinear Programs. Discrete Optimization. 5(2):186-204, 2008.
Third Party required code

Bonmin needs a few external packages which are not included in the Bonmin package. The reason why they are not included in the package is that they have licenses which are incompatible with the CPL under which Bonmin is distributed. You should pay attention to the particular licenses of each of them before downloading them.
Lapack (Linear Algebra PACKage)
Blas (Basic Linear Algebra Subroutines)
A sparse linear solver. Either 1.HSL (Harwell Subroutine Library)
the sparse linear solver MA27, or MA57
optionally (but strongly recommended) MC19 to enable automatic scaling in Ipopt.
or MUMPS

## Csparse

CSPARSE: a Concise Sparse matrix package.
Copyright (c) 2006, Timothy A. Davis.
http://www.cise.ufl.edu/research/sparse/CSparse

## OpenBLAS

## Mumps:
[1] P. R. Amestoy, I. S. Duff, J. Koster and J.-Y. L'Excellent, A fully asynchronous multifrontal solver using distributed dynamic scheduling, SIAM Journal of Matrix Analysis and Applications, Vol 23, No 1, pp 15-41 (2001).
[2] P. R. Amestoy, A. Guermouche, J.-Y. L'Excellent and S. Pralet, Hybrid scheduling for the parallel solution of linear systems. Parallel Computing Vol 32 (2), pp 136-156 (2006).

## Metis

How to cite METIS?
“A Fast and Highly Quality Multilevel Scheme for Partitioning Irregular Graphs”. George Karypis and Vipin Kumar. SIAM Journal on Scientific Computing, Vol. 20, No. 1, pp. 359—392, 1999.

## SWIG

SWIG Copyright and Authors
Copyright (c) 1995-2011 The SWIG Developers
Copyright (c) 2005-2006 Arizona Board of Regents (University of Arizona).
Copyright (c) 1998-2005 University of Chicago.
Copyright (c) 1995-1998 The University of Utah and the Regents of the University of California

