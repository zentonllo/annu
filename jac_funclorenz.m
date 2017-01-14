function res=jac_funclorenz(t,z,par)
    p = par(1);
    sigma = par(2);
    beta = par(3);
    res=[-sigma, sigma , 0 ; p - z(3) , -1 , -z(1) ; z(2), z(1) , -beta];