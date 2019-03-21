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

* ipopt, Eclipse Public License - v 1.0, several
* blasfeo, GPL 3 with the Classpath Exception
* hpmpc, LGPL 3
* qpoases, LGPL 3
* sundials cvodes/idas, BSD 3-Clause License
* lapack, BSD 3-Clause License modified
* HSL for ipopt/ ma27 
* bonmin, Eclipse Public License - v 1.0
* CSparse LGPL 2.1

Software not included in casadi?   

* slicot, GPL 3
* cplex
* gurobi 
* worhp 
* knitro
* snopt
