
m = size(x0,1);
figure(1);
if (m == 1)
    plot(t,u);
elseif (m == 2)
    subplot(2,1,1);
    plot(t,u(1,:),'r');
    title('Gráfica de las componentes')
    subplot(2,1,2);
    plot(t,u(2,:),'g');
    pause(5);
    figure(2);
    plot(u(1,:),u(2,:));
    title('Gráfica de la trayectoria')
else
    subplot(3,1,1);
    plot(t,u(1,:),'r');
    title('Gráfica de las componentes')
    subplot(3,1,2);
    plot(t,u(2,:),'g');
    subplot(3,1,3);
    plot(t,u(3,:),'b');
    pause(5);
    figure(2);
    plot3(u(1,:),u(2,:),u(3,:));
    title('Gráfica de la trayectoria')
end