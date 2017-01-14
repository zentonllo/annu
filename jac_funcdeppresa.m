function res = jac_funcdeppresa(t,z,par)
    a=par(1);
    b=par(2);
    c=par(3);
    d=par(4);
    res=[ a - b*z(2), -b*z(1) ; d*z(2), -c + d*z(1) ];