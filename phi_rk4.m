function val = phi_rk4(fun, t, x, h, par)

    k1 = feval(fun, t, x, par);
    k2 = feval(fun, t + (h/2), x + (k1/2)*h, par );
    k3 = feval(fun, t + (h/2), x + (k2/2)*h, par );
    k4 = feval(fun, t + h, x + k3*h, par);
    
    val = (1/6)*(k1 + (2*k2) + (2*k3) + k4);

end