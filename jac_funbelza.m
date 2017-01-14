function res=jac_funbelza(t,z,par)
    alpha = par(1);
    beta = par(2);
    gamma = par(3);
    delta = par(4);
    
    res = [alpha*(1 - z(2) - 2*beta*z(1)), alpha*(1 - z(1)) , 0 ; -(1/alpha)*z(2) , (1/alpha)*(-1-z(1)) , (1/alpha)*gamma  ; delta , 0, -delta ];
