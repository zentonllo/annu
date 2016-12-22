function f=funcduffing(t,x,par)
    alpha = par(1);
    f = [x(2); -alpha*x(2) - (x(1)^3) + x(1)];