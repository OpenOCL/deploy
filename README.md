# Deployment programs for OpenOCL

The programs generate the archives to ship OpenOCL including CasADi and Ipopt.
The binaries are shipped together with the source code and the LICENSE files.

A README.txt is created to inform users about use and licenses.


Deployments script requires curl.

```
sh deploy_openocl_v3-41.sh
```


Software included in casadi?
blasfeo, hpmpc, qpoases, sundials cvodes/idas, lapack, HSL for ipopt/ ma27,  bonmin . 

Software not included in casadi?
slicot, cplex, gurobi, worhp, knitro, snopt
