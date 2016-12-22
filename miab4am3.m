function [t ,u] = miab4am3( fun, t0, tfin, N, x0, par )
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
    
    % Corregimos el último valor dado (predicho) por Runge-Kutta
     u(:,4) = u(:,3) + (h/24)*( 9*feval(fun, t(4),u(:,4),par) ...
                 + 19*feval(fun, t(3), u(:,3), par) ...
                 - 5*feval(fun, t(2), u(:,2), par) ...
                 + feval(fun, t(1), u(:,1), par));
    
    
    for n=5:N+1
        
       % Predictor: Adam-Bashforth 4 pasos
       u(:,n) = u(:,n-1) + (h/24)*(55*feval(fun, t(n-1),u(:,n-1),par) ...
                - 59*feval(fun, t(n-2), u(:,n-2), par) ...
                + 37*feval(fun, t(n-3), u(:,n-3), par) ...
                - 9*feval(fun, t(n-4), u(:,n-4), par) ); 
        
       % Corrector: Adams-Moulton 3 pasos
       u(:,n) = u(:,n-1) + (h/24)*( 9*feval(fun, t(n),u(:,n),par) ...
                + 19*feval(fun, t(n-1), u(:,n-1), par) ...
                - 5*feval(fun, t(n-2), u(:,n-2), par) ...
                + feval(fun, t(n-3), u(:,n-3), par));
       
       

    end