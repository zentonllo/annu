mispracticas

[t, u] = midispnolin(tinic, tfin, N, x0, TOL, ffxfy);

misgraficasdisp

%%% Pinta también solucion exacta y diferencia con la solucion aproximada
%%% (se necesita la función anónima solex, que consta de un parámetro t)
figure(2);
plot( t , solex(t) );
title('Gráfica de la solucion exacta')
figure(3);
plot( t , abs( u(1,:) - solex(t) ) );
title('Gráfica con la diferencia de la solucion exacta y la aproximada')