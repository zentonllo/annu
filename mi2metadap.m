% M�todo 1 --> Interno (menor orden)
% M�todo 2 --> Externo (mayor orden)
function [t ,u, H, ERROR, rechazo] = mi2metadap( fun, t0, tfin, x0, h0, hmin, TOL, phi_metodo1, phi_metodo2, orden1, orden2, par )

 % Inicializaci�n de paso y nodo inicial
    t(1) = t0;
    h = h0;
    n = 1;
    
    %Paso m�ximo
    hmax = tfin - t0;


    %Factores limitantes para corregir el paso
    fac = 0.9;
    facmax = 5;
    
    % Inicializaci�n de la soluci�n
    m = size(x0,1);
    u(:,1) = x0;
    

    rechazo = 0;
    
    while ( t(n) < tfin )
        
        phi_aux1 = feval(phi_metodo1, fun, t(n), u(:,n), h, par);
        phi_aux2 = feval(phi_metodo2, fun, t(n), u(:,n), h, par);
        

        ERR = norm( (phi_aux2 - phi_aux1), inf );
        
        if (ERR < TOL) 
            
            u(:,n+1) = u(:,n) + h .* phi_aux1;
            t(n+1) = t(n) + h;
            H(n) = h;
            ERROR(n) = ERR;
            n = n + 1; 
        elseif ( h < hmin)
            disp('Error! El paso tentativo es menor que el paso m�nimo');
            disp('Paso m�nimo: ');
            disp(num2str(hmin));
            disp('Paso tentativo: ');
            disp(num2str(h));
            exit(-1);
        else 
            rechazo = rechazo + 1;
        end
        
        % Actualizaci�n al paso �ptimo
        h = min(hmax, h*min(facmax, fac*((TOL/ERR)^(1/4)) ));

    end 