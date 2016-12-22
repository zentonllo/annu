close all;
clear all;
par = [];


%datos entrada Van der Pol
% fun=@funcvanderpol; x0=[0.1;0.2]; tinic=0; tfin=10; N=1000; par = [1; 1]; 
% jac = @jac_vanderpol; itmax = 30000;

% datos entrada Ecuación rígida
% fun=@funcecrigida; x0=0; tinic=0; tfin=(pi/2); N=75; par = [];
% jac = @jac_ecrigida; itmax = 30000;

% Datos entrada Ecuación péndulo
%  fun=@funcpendulo; x0=[pi/2 ; 0]; tinic = 0; tfin = 50; N = 5000; 
% M l g b
%  par = [0; 1; 9.8; 0]; 

% Datos entrada Ecuación péndulo linearizado
% fun=@funcpendulolin; x0=[pi; 0]; tinic = 0; tfin = 50; N = 5000; 
% M g l b
% par = [0; 1; 9.8; 0]; 

% Datos entrada sistema Lorenz
% fun=@funclorenz; x0=[1; 0; 2]; tinic = 0; tfin = 50; N = 5000;
% p sigma beta
% par = [28; 10; (8/3)];

% Datos entrada Adam Bashforth 4 pasos
% fun=@funclorenz; x0=[1; 0; 2]; tinic = 0; tfin = 50; N = 5000;
% p sigma beta
% par = [28; 10; (8/3)];

% Métodos adaptativos
% fun=@funclorenz; x0=[1; 0; 2]; tinic = 0; tfin = 50;
% p sigma beta
% par = [28; 10; (8/3)];
% h0 = 1e-5; hmin = 10e-5; TOL = 10e-3;

 fun=@funcvanderpol; x0=[0.1;0.2]; tinic=0; tfin=10; par = [1; 1]; 
 h0 = 1e-5; hmin = 10e-5; TOL = 10e-3;

