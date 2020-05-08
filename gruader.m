function yprima=gruader(t,y,M,F1,F2,F3) %recibe tiempo, vector de derivadas(6), Fuerzas externas(3)
Lb=10;    % largo viga
Mb=100;    % masa pequeña
Lf=10;
Mf=100;% masa carro
g=9.8;  % gravedad
palfa=100;
pbeta=100;
pr=100;

ib=Mb*(3*(y(5)^2)+3*y(5)*Lb+Lb^2)/3;
%vector y tiene 6 componentes
 
yprima(1)=y(2); %theta punto
yprima(2)=(F1+((y(2)^2)*palfa)-2*Mb*y(2)*(y(5)*y(6)+3*y(6)*Lb)-((Mf*Lf^2)/3)*y(4)^2 *sin(y(1))*cos(y(1))-M*(y(5)+Lb)*y(4)*sin(y(1))*cos(y(1))-ib*y(4)^2 *sin(y(1))*cos(y(1))-g*(0.5*Lf*Mf*cos(y(1))+cos(y(1))*Mb*(y(5)+Lb*0.5)+cos(y(1))*M*(y(5)+Lb))) / (((Mf*Lf^2)/3)+M*((y(5)+Lb)^2)+ib) ; %theta dos puntos
yprima(3)=y(4); %sigma punto
yprima(4)=(F2+ (pbeta*y(4)^2) + ((Mf*Lf^2)*2*cos(y(1))*sin(y(1))*y(4))+(M*((y(5)+Lb)^2) +Lb +ib)*(2*cos(y(1))*sin(y(1))*y(4))-(cos(y(1))^2) * y(4)*(6*y(5)*y(6)+3*y(6)*Lb+2*y(6)*(y(5)+Lb))) / (((Mf*Lf^2) /3)*(cos(y(1))^2)+(cos(y(1))^2)*(M*((y(6)+Lb)^2) +ib)) ;        %sigma dos puntos
yprima(5)=y(6); %r punto
yprima(6)=(F3+(y(6)^2)*pr - (  M*(y(5)+Lb)*y(2)+M*(y(5)+Lb)*cos(y(1))^2 * y(4)^2  +  (Mb/3)*(6*y(5)+3*Lb)*(0.5*cos(y(1))^2+0.5*y(2)^2)-sin(y(1))*Mb-sin(y(1))*M ))/(M+Mb); %r dos puntos
yprima=yprima'