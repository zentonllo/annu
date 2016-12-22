function res = funcdeppresa(t,x,par)
    a=par(1);
    b=par(2);
    c=par(3);
    d=par(4);
    res =[ a*x(1) - b*x(1)*x(2) ; -c*x(2) + d*x(1)*x(2) ] ;