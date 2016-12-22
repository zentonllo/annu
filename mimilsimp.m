function [t ,u] = mimilsimp( fun, t0, tfin, N, x0, par )
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
    
    % Corregimos el Runge-Kutta para x2 y x3
    u(:,3) = u(:,1) + (h/3)*(feval(fun,t(3),u(:,3),par) + 4*feval(fun,t(2),u(:,2),par) ... 
               + feval(fun, t(1), u(:,1), par));
    u(:,4) = u(:,2) + (h/3)*(feval(fun,t(4),u(:,4),par) + 4*feval(fun,t(3),u(:,3),par) ... 
               + feval(fun, t(2), u(:,2), par));       
    
    
    % Cómputo soluciones
    for n=5:N+1
        
       % Predictor: Método de Milne de 4 pasos
       u(:,n) = u(:,n-4) + ((4*h)/3)*( 2*feval(fun, t(n-1),u(:,n-1),par) ...
                - feval(fun, t(n-2), u(:,n-2), par) ...
                + 2*feval(fun, t(n-3), u(:,n-3), par) );  
            
      % Corrector: Método de Simpson de 2 pasos
      u(:,n) = u(:,n-2) + (h/3)*(feval(fun,t(n),u(:,n),par) + 4*feval(fun,t(n-1),u(:,n-1),par) ... 
               + feval(fun, t(n-2), u(:,n-2), par));
      
    end