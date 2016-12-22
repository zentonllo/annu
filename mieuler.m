function [t ,u] = mieuler( fun, t0, tfin, N, x0, par )
    % Cálculo del paso
    h = (tfin-t0)/N;
    % Generación del mallado
    t = t0:h:tfin;
    % Inicialización de la solución
    m = size(x0,1);
    u = zeros(m,N+1);
    u(:,1) = x0;
    % Bucle (método de Euler)
    for n=2:N+1 
        u(:,n) = u(:,n-1) + h*feval(fun, t(n-1), u(:,n-1), par); 
    end
    
    
   