function [t ,u, numfun] = mitrap( fun, t0, tfin, N, x0, jac, itmax, par )
    % Cálculo del paso
    h = (tfin-t0)/N;
    % Generación del mallado
    t = t0:h:tfin;
    % Inicialización de la solución
    m = size(x0,1);
    u = zeros(m,N+1);
    u(:,1) = x0;
    
    numfun = 0;
    
    % Bucle (método del trapecio)
    for n=2:N+1 
        
        cte = u(:,n-1) + (h/2)*feval(fun, t(n-1), u(:,n-1), par);
        numfun = numfun + 1;
        z = u(:,n-1);
        w = zeros(m,1);
        it = 0;
        while (it ~= itmax && norm(w) >= (h^3) )
            
            DG = eye(m) - (h/2)*feval(jac,t(n),z);
            G = z - cte - (h/2)*feval(fun, t(n),z, par);
            numfun = numfun + 1;
            w = DG\G;
            z = z - w;
            it = it + 1;
            
        end
        
        u(:,n) = cte + (h/2)*feval(fun, t(n), z, par); 
        numfun = numfun + 1;
    end