mispracticas

%phi_metodo = @phi_euler;
%orden = 1;

phi_metodo = @phi_rk4;
orden  = 4;

[t ,u, H, ERROR, rechazo] = mimetadap( fun, tinic, tfin, x0, h0, hmin, TOL, phi_metodo, orden, par );


misgraficasadap
