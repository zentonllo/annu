function [t ,u] = mirk4( fun, t0, tfin, N, x0, par )
    % Cálculo del paso
    h = (tfin-t0)/N;
    % Generación del mallado
    t = t0:h:tfin;
    % Inicialización de la solución
    m = size(x0,1);
    u = zeros(m,N+1);
    u(:,1) = x0;
    % Bucle (método de Runge-Kutta)
    for n=2:N+1 
        k1 = feval(fun, t(n-1), u(:,n-1), par);
        k2 = feval(fun, t(n-1) + (h/2), u(:,n-1) + (k1/2)*h, par );
        k3 = feval(fun, t(n-1) + (h/2), u(:,n-1) + (k2/2)*h, par );
        k4 = feval(fun, t(n-1) + h, u(:,n-1) + k3*h, par);
        u(:,n) = u(:,n-1) + (h/6)*(k1 + (2*k2) + (2*k3) + k4); 
    end
    
    
   