function res=jac_fundisplin1(t,z,pqr)
    res=[0,1; feval(pqr{2},t), feval(pqr{1},t)];