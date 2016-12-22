function res = funcpendulo(t,x,par)
    M=par(1);
    l=par(2);
    g=par(3);
    b=par(4);
    res =[x(2); -2*b*x(2) - (g/l)*sin(x(1))+M] ;