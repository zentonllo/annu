function f=funclorenz(t,x,par)
    p = par(1);
    sigma = par(2);
    beta = par(3);
    f = [sigma*(x(2)-x(1)); p*x(1) - x(2) - x(1)*x(3) ; x(1)*x(2) - beta*x(3) ];