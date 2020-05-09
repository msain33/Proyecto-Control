function yprima=gruader(t,y,M,F1,F2,F3) %recibe tiempo, vector de derivadas(6), Fuerzas externas(3)
La=10;    % largo flecha
Ma=100;    % masa flecha
Lb=10;  %largo brazo fijo   
Mb=100;% masa brazo fijo
g=9.8;  % gravedad
palfa=3000;%coeficiente de roce en alfa
pbeta=100;%coeficiente de roce en beta
pr=100;

ib=Ma*(3*(y(5)^2)+3*y(5)*La+La^2)/3;
%vector y tiene 6 componentes
 
yprima(1)=y(2); %theta punto
yprima(2)=(F1-(sign(y(2))*(y(2)^2)*palfa)-2*Ma*y(2)*(y(5)*y(6)+3*y(6)*La)-((Mb*Lb^2)/3)*y(4)^2 *sin(y(1))*cos(y(1))-M*(y(5)+La)*y(4)*sin(y(1))*cos(y(1))-ib*y(4)^2 *sin(y(1))*cos(y(1))-g*(0.5*Lb*Mb*cos(y(1))+cos(y(1))*Ma*(y(5)+La*0.5)+cos(y(1))*M*(y(5)+La))) / (((Mb*Lb^2)/3)+M*((y(5)+La)^2)+ib) ; %theta dos puntos
yprima(3)=y(4); %sigma punto
yprima(4)=(F2-(sign(y(4))*pbeta*y(4)^2) + ((Mb*Lb^2)*2*cos(y(1))*sin(y(1))*y(4))+(M*((y(5)+La)^2) +La +ib)*(2*cos(y(1))*sin(y(1))*y(4))-(cos(y(1))^2) * y(4)*(6*y(5)*y(6)+3*y(6)*La+2*y(6)*(y(5)+La))) / (((Mb*Lb^2) /3)*(cos(y(1))^2)+(cos(y(1))^2)*(M*((y(6)+La)^2) +ib)) ;        %sigma dos puntos
yprima(5)=y(6); %r punto
yprima(6)=(F3-(sign(y(6))*y(6)^2)*pr - (  M*(y(5)+La)*y(2)+M*(y(5)+La)*cos(y(1))^2 * y(4)^2  +  (Ma/3)*(6*y(5)+3*La)*(0.5*cos(y(1))^2+0.5*y(2)^2)-sin(y(1))*Ma-sin(y(1))*M ))/(M+Ma); %r dos puntos
yprima=yprima'