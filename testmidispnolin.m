mispracticas

[t, u] = midispnolin(tinic, tfin, N, x0, TOL, ffxfy);

misgraficasdisp

%%% Pinta tambi�n solucion exacta y diferencia con la solucion aproximada
%%% (se necesita la funci�n an�nima solex, que consta de un par�metro t)
figure(2);
plot( t , solex(t) );
title('Gr�fica de la solucion exacta')
figure(3);
plot( t , abs( u(1,:) - solex(t) ) );
title('Gr�fica con la diferencia de la solucion exacta y la aproximada')