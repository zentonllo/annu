close all;
clear all;
par = [];


%datos entrada Van der Pol
% fun=@funcvanderpol; x0=[0.1;0.2]; tinic=0; tfin=10; N=1000; par = [1; 1]; 
% jac = @jac_vanderpol; itmax = 30000;

% datos entrada Ecuaci�n r�gida
% fun=@funcecrigida; x0=0; tinic=0; tfin=(pi/2); N=75; par = [];
% jac = @jac_ecrigida; itmax = 30000;

% Datos entrada Ecuaci�n p�ndulo
%  fun=@funcpendulo; x0=[pi/2 ; 0]; tinic = 0; tfin = 50; N = 5000; 
% M l g b
%  par = [0; 1; 9.8; 0]; 

% Datos entrada Ecuaci�n p�ndulo linearizado
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

%%%%%%%%%%%%%%%%%% M�TODOS ADAPTATIVOS %%%%%%%%%%%%%%%%%%%%%

 
% fun=@funclorenz; x0=[1; 0; 2]; tinic = 0; tfin = 50;
% p sigma beta
% par = [28; 10; (8/3)];
 % Con tolerancia m�s peque�a no funciona
% h0 = 1e-5; hmin = 10e-5; TOL = 10e-1;

% fun=@funcvanderpol; x0=[0.1;0.2]; tinic=0; tfin=10; par = [1; 1]; 
% h0 = 1e-5; hmin = 10e-5; TOL = 10e-3;


%%%% Test2mimetadap.m (Estimacion del error en dos m�todos monopaso de distinto orden)  %%%%%%%
% phi_metodo1 = @phi_euler;
% orden1 = 1;
% phi_metodo2 = @phi_rk4;
% orden2 = 4;
%%%%%%%%%%%%%%%

%%% Testmimetadap.m (Estimaci�n del error en dos pasos sucesivos o M�todo de Richardson) %%%%%%%%%
%phi_metodo = @phi_euler;
%orden = 1;

% phi_metodo = @phi_rk4;
% orden  = 4;
%%%%%%%%%%%%%%%%

%%% Los 3 m�todos adaptativos implementados tienen comentado un bloque
%%% de codigo que permite controlar funciones no acotadas

%%% Pr�ctica 23 (Funciones no acotadas) %%%%

% fun=@fun23_1; x0=1; tinic=0; tfin=2;
% fun=@fun23_2; x0=1; tinic=0; tfin=2;

% Prueba con m�todos adaptativos 
% h0 = 1e-5; hmin = 10e-5; TOL = 10e-3;

% Prueba con paso constante
% N = 5000;

%%% Pr�ctica 24 %%%

% fun=@funcoscil; x0 = (1/exp(1)); tinic=0; tfin=8;
% Prueba con m�todos adaptativos
% h0 = 1e-5; hmin = 10e-5; TOL = 10e-5;

% Prueba con paso constante
% N = 5000;
 
%%%%%%%%%%%%%%% PROBLEMAS DE CONTORNO %%%%%%%%%%%%%%%%%%%%%%%

 % Metodo de disparo
 
 %%%%%%%%%%%%%% PR�CTICA 26 %%%%%%%%%%%%%%%%%
 %pqr = { @(t) 0*t, @(t) 4 + 0*t, @(t) -4*t }; x0=[0;2]; tinic=0; tfin=1; 
 %pqr = { @(t) 0*t, @(t) 4 + 0*t, @(t) -4*t }; x0=[-2;1]; tinic=0; tfin=5;
 %pqr = { @(t) 0*t, @(t) 4 + 0*t, @(t) -4*t }; x0=[-2;-1]; tinic=0; tfin=10;
 %pqr = { @(t) 0*t, @(t) 4 + 0*t, @(t) -4*t }; x0=[-2;-1]; tinic=0; tfin=10;
 
 %N = 5000;
 %C1 = 0;
 %C2 = 0;


