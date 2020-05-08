% CAIDA LIBRE DEL PENDULO
close all
clear
clc
 % fuerza externa en cero
y0=[pi/4 0 0 0 0 0]; % condiciones iniciales
dt=0.001;  % periodo del sistema
k=1;  
tmax=2;  % tiempo maximo de la simulacion

M1=100;
F1=300;
F2=0;
F3=10;

% inicializacion variables de salida
yt=zeros(fix(tmax/dt)+1,6);
tt=zeros(fix(tmax/dt)+1,1);

for t1=0:dt:tmax
    % integrador numerico
    [t,y]=ode23(@(t,y) gruader(t,y,M1,F1,F2,F3),[t1 t1+dt],y0);
    
    % toma ultimo valor del vector
    yt(k,:)=y(max(size(y)),:);
    if yt(k,1)<0, yt(k,1)=0; end;
    if yt(k,1)>0.5*pi, yt(k,1)=0.5*pi; end; 
    if yt(k,3)<0, yt(k,3)=yt(k,3)+2*pi; end;
    if yt(k,3)>2*pi, yt(k,3)=yt(k,3)-2*pi; end;
    if yt(k,5)<0, yt(k,5)=0; end;
    if yt(k,5)>9, yt(k,5)=9; end;
    % toma ultimo valor tiempo simulado
    tt(k,:)=t(max(size(y)));
    yt(k,3)=0;
    % guarda valor de variables para inicio periodo siguiente
    y0=yt(k,:);
   
    % incrementa periodo
    k=k+1;
    
   
end

%plot(tt,yt(:,3)*180/pi); xlabel('tiempo, segs'); ylabel('Theta, grados'); pause  
plot(tt,yt(:,1)*180/pi); xlabel('tiempo, segs'); ylabel('Theta, grados'); pause 
plot(tt,yt(:,5)); xlabel('tiempo, segs'); ylabel('x(t), metros');