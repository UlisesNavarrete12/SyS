%% Pr�ctica 2: Se�ales en tiempo continuo
%
%
%% Descripci�n general de MATLAB
%
% <html> <iframe width="560" height="315" src="https://www.youtube.com/embed/YF_32dT2fNU" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
% </html>
%
% <https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-094-introduction-to-matlab-january-iap-2010/lecture-notes/MIT6_094IAP10_lec01.pdf Documento>
%% Crear documento con publish
% Ayuda en linea para publicar <https://www.mathworks.com/help/matlab/matlab_prog/marking-up-matlab-comments-for-publishing.html Publish>
%% Creaci�n de vectores
% Creamos  vectores (fila)
t1= -10:5; % El punto y coma es para que el resultado no sea desplegado
t2=-2:0.01:15; 
%%
% Para saber las dimensiones 
size(t1)
size(t2)
%% Operaci�n elemento a elemento y matricial
% Las operaciones elemento a elemento nos ayudan a evaluar funciones para
% valores de su dominio al mismo tiempo, el sigueinte c�digo genera error  
%%
% 
%   t1*t1
%       
% En cambio el sigueinte codigo es correcto
t1.*t1
 
%% Crear funciones
% 
% Las funciones en MATLAB tienen la siguiente sintaxis
%
%   function [sal1,sal2,sal3]=nombreFuncion(ent1,ent2,ent3)
%       %codigo de la funcion 
%   end
% 
% Algunas notas sobre las funciones
% 
% * El archivo debe guardarse como  nombreFuncion.m
% * Debes de estar trabajando en el directorio donde este tu funci�n para
% poder ocuparla, o agregar el directorio
% * Las salidas y las entradas son opcionales, en este sentido, hay 4 tipos 
% funciones: con entradas y salidas, con salidas sin entrada, con entrada
% sin salidas, sin entradas y sin salidas
%
% �Podr�as escribir varias funciones en el mismo archivo y ocupar unas
% funciones dentro de otras?
 
%% Algunas funciones implementadas
%
%   help sin
%   help cos
%   help exp
%   help abs
%   help angle
%   help pi
%   help plot
%   help square
%   help sinc
%   help rectpuls
%   help tripuls
%   help sawtooth
%   help heaviside
%   help dirac
%
% Entonces si ejecutamos alguna de las intrucciones anteriores se
% desplegara una breve descripci�n de la instrucci�n solicitada, si se
% quiere una descripci�n m�s completa tendr�a que ejecutarse _doc sinc_  
% (por ejemplo)o directamente en la ayuda.
%
help sinc
 
%%
% Como ya tenemos declarado un vecto de valores podr�amos intentar con 
%
sinc(t1)
%% Funciones anonimas
% Observemos el siguiente c�digo
%%
% 
f = @(t) exp(-t).*t+exp(-t).*cos(2*t);
u = @(t) t>=0;
p = @(t) (t>=0) & (t<1);
 
%% Gr�ficas: plot, subplot, plot3, edici�n con GUI, generar c�digo de gr�fica
 
plot([1,3],[5,-4])
 
%%
 
figure
plot(t1,sinc(t1))
 
%%
 
figure
plot(t2,sinc(t2))
 
%%
 
figure
t4=-100:0.1:100;
plot(t4,t4.^3,'LineWidth',2)
grid on
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';
ax.Box = 'off';
title('Gr�fica de la se�al f(t)=t^3 ')
 
%%
 
figure
t3=-100:0.1:100;
plot3(t3,cos(t3),sin(t3),'LineWidth',2)
grid on
xlabel('Dominio t')
ylabel('Re')
zlabel('Im')
title('Gr�fica de la se�al f(t)=e^{tj} ')
 
%%
 
figure
subplot(2,3,1)
plot(0:0.01:5,f(0:0.01:5))
 
subplot(2,3,2)
plot(t1,u(t1))
 
subplot(2,3,5)
plot(t2,p(t2))
 
%%
 
figure()
plot(t2,u(t2))
 
%%
 
figure()
plot(t1,p(t1))
grid on
axis([-12 10, -1, 2])
 
%%
 
figure()
subplot(1,2,1)
plot(t1,p(t1))
grid on
axis([-12 10, -1, 2])
 
subplot(1,2,2)
plot(t2,p(t2))
grid on
axis([-12 10, -1, 2])
%%
% Entonces veamos que sucede con lo siguiente
t=-10:0.001:10;
figure
subplot(2,1,1)
plot(t,p(t))
grid on
axis([-10, 10 -0.5 1.5]) 
 
subplot(2,1,2)
plot(t,p(t-2))
grid on
axis([-10, 10 -0.5 1.5]) 
 
 
%% Un poco de simb�lico
%
% Realizar las siguientes integrales
% 
% $$\int_a^bxe^{-x}dx,\;\;\int_0^2xe^{-x}dx,\;\;\int_0^\infty xe^{-x}dx$$
% 
 
syms a b  x 
Q=int(x*exp(-x),a,b)
subs(Q,{a,b},{0,2})
 
%%
% El sigueinte c�digo produce error 
%
%   subs(Q,{a,b},{0,inf})
% 
% Pero este c�digo no, �Por qu�?
 
Q=int(x*exp(-x),a,inf)
subs(Q,a,0)
 
close all
 
%% Observaciones
% Tener claro que esto no es absoluto, es una manera de implementaci�n en 
% MATLAB, es decir, la implementaci�n de las se�ales podr�a variar incluso
% en el mismo MATLAB, y por supuesto si se utiliza otro software
%% Notas 
% # Backgroun secci�n MB de Lathi
 
%% Entregables
% Se revisa una publicaci�n (html) de la pr�ctica. En este caso tendra que
% iniciar indicando el nombre de la pr�ctica y sus datos personales,
% equipos de dos o tres personas
% (Portada). El �ndice del contenido lo genera Publish (�ndice). Los
% objetivos son los sigueintes:
%
% * Manipulaci�n b�sica de MATLAB
% * Gr�ficas de se�ales reales y complejas continuas 
% * Transformaci�n de se�ales continuas (escalamientos y traslaciones)
% * Calculo de energ�a y potencia de se�ales continuas
%
% Como introducci�n investigue un poco de la historia del desarrollo de
% MATLAB, hable un poco sobre alternativas de software libre (Octave, Python)
% y porporcione enlaces (confiables) donde se pueda consultar informaci�n
% para comenzar a utilizar dichas herramientas
%
% Para el desarrollo se tienen que resolver cada uno de los siguientes
% problemas comenzando una nueva secci�n (para la publicaci�n) en cada uno de ellos.
%
% # Realiza las mismas operaciones que Lathi en las secciones M1.1 a M1.4
%  que se encuentra al final del cap�tulo 1 y antes de la secci�n de
%  problemas, cambie los _inline_ por funciones anonimas
% # Resuelve el problema 1.2.2 usando las herramientas del paso anterior.
% # Construya una funci�n que gr�fique funciones de
% $f:R\rightarrow R$ en el formato de su elecci�n y pruebe
% su c�digo para mostrar las gr�ficas de magnitud y fase para las f�rmulas 1, 2 y 3 de la 
% tabla que se encuentra en al secci�n de tranformada de Fourier de la
% siguiente p�gina <http://rafneta.github.io/Notas/NotasSyS/index.html> con
% valores de a=1/2 y n = 2. El rango de la varible se deja a criterio. 
% # Construya una funci�n que gr�fique funciones de
% $f:R\rightarrow R^2$ en el formato de su elecci�n y pruebe
% su c�digo para mostrar las gr�ficas de las f�rmulas 1, 2 y 3 de la 
% tabla que se encuentra en al secci�n de tranformada de Fourier de la
% siguiente p�gina <http://rafneta.github.io/Notas/NotasSyS/index.html> con
% valores de a=1/2 y n = 2. El rango de la varible se deja a criterio. 
% # Construya una app que permita
%
% - Gr�ficar se�ales en tiempo continuo reales, el usuario ingresa la
% definici�n de la se�al en el formato especifico
%
% - El usuario puede definir el intervalo de la gr�fica
%
% - El usuario puede seleccionar el tipo de transformaci�n (horizontal,
% vertical o combinaci�n) que desee realizar a la se�al, la app debera
% mostrar la grafica de esta transformaci�n. Puede consultar los 
% ejemplos preconstruidos que le puedan ser de utilidad.  
%
% - Se adjunta una imagen de la app a la pr�ctica, un enlace a la
%  app en MATLAB online (drive), y el archivo de la app.  
%
% No es necesario incluir conclusiones en esta pr�ctica, si lo considera
% necesario puede incluir ap�ndices, no olvide incluir sus referencias. 
%%
% El c�digo de esta publicaci�n lo puedes encontrar en el siguiente
% <https://www.dropbox.com/s/mjirzbpn79iy9px/p02sys20202.m?dl=0 enlace>