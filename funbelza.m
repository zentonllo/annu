function f=funbelza(t,x,par)
    alpha = par(1);
    beta = par(2);
    gamma = par(3);
    delta = par(4);
    
    f = [alpha*(x(2)-x(1)*x(2)+x(1)-beta*(x(1)^2)); (1/alpha)*(gamma*x(3)-x(2)-x(1)*x(2)) ; delta*(x(1)-x(3)) ];