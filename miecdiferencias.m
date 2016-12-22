function y = miecdiferencias(x0,x1,N)
    y = zeros(N+1,1);
    y(1) = x0;
    y(2) = x1;
    for i=3:(N+1)
        y(i) = feval('funcecdif', y((i-2):(i-1)) );
        % También se puede pasar [y(i-2); y(i-1)] a feval como argumento
    end
    figure(1);
    x_axis = 0:N;
    plot(x_axis, y);
    figure(2);
    y_axis = x0 + ( x1 .* (3 .^ x_axis) );
    plot(x_axis, y_axis );

