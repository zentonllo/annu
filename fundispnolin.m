function dx=fundispnolin(t,x,ffxfy)
    dx=zeros(4,1);
    dx(1) = x(2);
    dx(2) = feval( ffxfy{1}, t, x(1), x(2) );
    dx(3) = x(4);
    dx(4) = feval (ffxfy{3}, t , x(1), x(2) )*x(4) ...
                + feval(ffxfy{2},t,x(1),x(2))*x(3);

