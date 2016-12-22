function [t ,u] = mimilne( fun, t0, tfin, N, x0, par )
    % Cálculo del paso
    h = (tfin-t0)/N;
    % Generación del mallado
    t = t0:h:tfin;
    % Inicialización de la solución
    m = size(x0,1);
    u = zeros(m,N+1);
    % Inicialización del método con uno monopaso de orden 4 (RK)
    [t_dummy ,u_init] = mirk4( fun, t0, t0+3*h, 3, x0, par );
    for n=1:4
        u(:,n) = u_init(:,n);
    end
    % Cómputo soluciones
    for n=5:N+1
       u(:,n) = u(:,n-4) + ((4*h)/3)*( 2*feval(fun, t(n-1),u(:,n-1),par) ...
                - feval(fun, t(n-2), u(:,n-2), par) ...
                + 2*feval(fun, t(n-3), u(:,n-3), par) );  
    end
    