function [t ,u] = mieulertr( fun, t0, tfin, N, x0, par )
    % C�lculo del paso
    h = (tfin-t0)/N;
    % Generaci�n del mallado
    t = t0:h:tfin;
    % Inicializaci�n de la soluci�n
    m = size(x0,1);
    u = zeros(m,N+1);
    u(:,1) = x0;

    
    %M�todo de predicci�n correcci�n
    for n=2:N+1 
        %Predictor: Euler
        u(:,n) = u(:,n-1) + h*feval(fun, t(n-1), u(:,n-1), par);
        
        %Corrector: Trapecio
        cte = u(:,n-1) + (h/2)*feval(fun, t(n-1), u(:,n-1), par);
        u(:,n) = cte + (h/2)*feval(fun, t(n), u(:,n), par);
           
          % Por si quisi�ramos m�s iteraciones
%         for j=1:20
%           u(:,n) = cte + (h/2)*feval(fun, t(n), u(:,n), par);
%         end
        
    end