function res = jac_funcpendulolin(t,z,par)
    M=par(1);
    l=par(2);
    g=par(3);
    b=par(4);
    res=[0, 1 ; -(g/l), -2*b];