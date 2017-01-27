function [t, u] = midispnolin(tinic, tfin, N, x0, TOL, ffxfy) 
    
    a = x0(1);
    b = x0(2);
   
    k = 1;
    s(1) = (b-a)/(tfin - tinic);
    
    [t, sol] = mirk4( @fundispnolin, tinic, tfin, N, [a; s(1); 0; 1] , ffxfy );
   
    error = sol(1,N+1) - b;

    while ( error >= TOL ) 
        
    s(k+1) = s(k) - ((sol(1,N+1)-b)/sol(3,N+1));
    k = k + 1;
    [~, sol] = mirk4( @fundispnolin, tinic, tfin, N, [a; s(k); 0; 1] , ffxfy );
   
    error = sol(1,N+1) - b;
    
    end 
    
  
    u = [sol(1,:); sol(2,:)];