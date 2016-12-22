mispracticas

phi_metodo1 = @phi_euler;
orden1 = 1;
phi_metodo2 = @phi_rk4;
orden2 = 4;

[t ,u, H, ERROR, rechazo] = mi2metadap( fun, tinic, tfin, x0, h0, hmin, TOL, phi_metodo1, phi_metodo2, orden1, orden2, par );


misgraficasadap