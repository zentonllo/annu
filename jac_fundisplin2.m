function res=jac_fundisplin2(t,z,pqr)
    res=[0,1; feval(pqr{2},t), feval(pqr{1},t)];