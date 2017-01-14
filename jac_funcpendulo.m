function res = jac_funcpendulo(t,z,par)
    M=par(1);
    l=par(2);
    g=par(3);
    b=par(4);
    res=[0,1 ; - (g/l)*cos(z(1)), -2*b ];