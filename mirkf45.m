function [t ,u, H, ERROR, rechazo] = mirkf45( fun, t0, tfin, x0, h0, hmin, TOL, par )
    
    % Inicialización de paso y nodo inicial
    t(1) = t0;
    h = h0;
    n = 1;
    
    %Paso máximo
    hmax = tfin - t0;


    %Factores limitantes para corregir el paso
    fac = 0.9;
    facmax = 5;
    
    % Inicialización de la solución
    m = size(x0,1);
    u(:,1) = x0;
    K = zeros(m,6);
   
    
    % Coeficientes de Runge-Kutta-Fehlberg
    a = [ 0 0 0 0 0 0; 
          (1/4) 0 0 0 0 0; 
          (3/32) (9/32) 0 0 0 0; 
          (1932/2197) (-7200/2197) (7296/2197) 0 0 0; 
          (439/216) (-8) (3680/513) (-845/4104) 0 0; 
          (-8/27) 2 (-3544/2565) (1859/4104) (-11/40) 0];
    b1 = [(25/216) 0  (1408/2565) (2197/4104) (-1/5) 0 ];
    b2 = [(16/135) 0 (6656/12825) (28561/56430) (-9/50) (2/55)];
    diffB = b2 - b1;
    c = [0 (1/4) (3/8) (12/13) 1 (1/2)]; 
     

    rechazo = 0;
    
    while ( t(n) < tfin )
        
        for i=1:6
            tmp = zeros(m,1);
            for j=1:6
                tmp = tmp + a(i,j) .* K(:,j);
            end
            K(:,i) = feval(fun, t(n)+ h*c(i), u(:,n) + h .* tmp, par);
        end
        
        tmp = zeros(m,1);
        for j=1:6
            tmp = tmp + diffB(j) .* K(:,j);
        end
        ERR = norm( tmp, inf );
        
        if (ERR < TOL) 
            tmp = zeros(m,1);
            for j=1:6
                tmp = tmp + b1(j) .* K(:,j);
            end
            u(:,n+1) = u(:,n) + h .* tmp;
            t(n+1) = t(n) + h;
            H(n) = h;
            ERROR(n) = ERR;
            n = n + 1; 
        elseif ( h < hmin)
            disp('Error! El paso tentativo es menor que el paso mínimo');
            disp('Paso mínimo: ');
            disp(num2str(hmin));
            disp('Paso tentativo: ');
            disp(num2str(h));
            exit(-1);
        else 
            rechazo = rechazo + 1;
        end
        
        % Actualización al paso óptimo
        h = min(hmax, h*min(facmax, fac*((TOL/ERR)^(1/4)) ));
        
    end
    