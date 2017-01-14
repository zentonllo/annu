function res=jac_funccompet(t,z,par)
    a=par(1);
    b=par(2);
    c=par(3);
    d=par(4);
    e=par(5);
    f=par(6);
    
    res= [ a - b*z(2) - 2*e*z(1) , -b*z(1) ; d*z(2) , -c + d*z(1) - 2*f*z(2) ];