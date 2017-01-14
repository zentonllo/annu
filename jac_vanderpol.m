function res = jac_vanderpol(t,z,par)
    alpha = par(1);
    beta = par(2);
    res = [ 0, 1; (-2*alpha*z(1)*z(2)-1), alpha*(beta-(z(1)^2))  ];