function [t ,u] = mieuler( fun, t0, tfin, N, x0, par )
    % C�lculo del paso
    h = (tfin-t0)/N;
    % Generaci�n del mallado
    t = t0:h:tfin;
    % Inicializaci�n de la soluci�n
    m = size(x0,1);
    u = zeros(m,N+1);
    u(:,1) = x0;
    % Bucle (m�todo de Euler)
    for n=2:N+1 
        u(:,n) = u(:,n-1) + h*feval(fun, t(n-1), u(:,n-1), par); 
    end
    
    
   