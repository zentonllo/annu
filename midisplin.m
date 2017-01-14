function [t, u] = midisplin(tinic, tfin, N, C1, C2, x0, pqr) 
    
    a = x0(1);
    b = x0(2);
   
    % Caso 1 y 3
    if (C1 == 0) 
        [t, v1] = mirk4( @fundisplin1, tinic, tfin, N, [a; 0] , pqr );
        [~, v2] = mirk4( @fundisplin2, tinic, tfin, N, [0; 1] , pqr );
        

    % Casos 2 y 4
    elseif (C1 == 1)
        [t, v1] = mirk4( @fundisplin1, tinic, tfin, N, [0; a] , pqr );
        [~, v2] = mirk4( @fundisplin2, tinic, tfin, N, [1; 0] , pqr );
       
    end
    
    % Caso 1 y 3
    if (C2 == 0)
        if ( v2(1,N+1) ~= 0 ) 
            s = (b-v1(1,N+1))/v2(1,N+1);
        else 

            if ( v1(1,N+1) ~= b ) 
                disp('Error! El problema de disparo no tiene solucion!');
            else 
               disp('Hay infinitas soluciones! Se continua el programa con una solucion con s=0');
               s = 0;

            end

        end
    
    % Casos 2 y 4
    elseif (C2 == 1)
        if ( v2(2,N+1) ~= 0 ) 
            s = (b-v1(2,N+1))/v2(2,N+1);
        else 

            if ( v1(2,N+1) ~= b ) 
                disp('Error! El problema de disparo no tiene solucion!');
            else 
               disp('Hay infinitas soluciones! Se continua el programa con una solucion con s=0');
               s = 0;

            end

        end

    end
   
    u = v1 + s*v2;
