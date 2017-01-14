function res=jac_funcduffing(t,z,par)
    alpha=par(1);
    res=[0,1; -3*(z(1)^2) + 1, -alpha];
