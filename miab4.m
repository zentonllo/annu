function [t ,u] = miab4( fun, t0, tfin, N, x0, par )
    % C�lculo del paso
    h = (tfin-t0)/N;
    % Generaci�n del mallado
    t = t0:h:tfin;
    % Inicializaci�n de la soluci�n
    m = size(x0,1);
    u = zeros(m,N+1);
    % Inicializaci�n del m�todo con uno monopaso de orden 4 (RK)
    [t_dummy ,u_init] = mirk4( fun, t0, t0+3*h, 3, x0, par );
    for n=1:4
        u(:,n) = u_init(:,n);
    end
    % C�mputo soluciones
    for n=5:N+1
       u(:,n) = u(:,n-1) + (h/24)*(55*feval(fun, t(n-1),u(:,n-1),par) ...
                - 59*feval(fun, t(n-2), u(:,n-2), par) ...
                + 37*feval(fun, t(n-3), u(:,n-3), par) ...
                - 9*feval(fun, t(n-4), u(:,n-4), par) );  
    end
    
    
    
    
        
        
