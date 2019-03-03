clear all; close all;
%initialise all the input parameters
tf = 0.008;
ti = 0;
ii = 0;
R = 0.5;
L = 0.0015;
h = 0.0005;

%---------------------inputs------------------------------
%Vin =  @(t) 3.5
%Vin =  @(t) 3.5*exp(-t^2/0.00015);
%Vin =  @(t) 3.5*exp(-t/0.00015);
%Vin =  @(t) 4*sin(2*pi*t/0.00015);
%Vin =  @(t) 4*sin(2*pi*t/0.000015);
%Vin =  @(t) 4*sin(2*pi*t/0.0004);
%Vin =  @(t) 4*sin(2*pi*t/0.0011);
%Vin =  @(t) 4*square(2*pi*t/0.00015);
%Vin =  @(t) 4*square(2*pi*t/0.000015);
%Vin =  @(t) 4*square(2*pi*t/0.0004);
%Vin =  @(t) 4*square(2*pi*t/0.0011);
%Vin =  @(t) 4*sawtooth(2*pi*t/0.00015);
%Vin =  @(t) 4*sawtooth(2*pi*t/0.000015);
%Vin =  @(t) 4*sawtooth(2*pi*t/0.0004);
%Vin =  @(t) 4*sawtooth(2*pi*t/0.0011);

%---------------------------------------------------------

%-------------------------open-ended----------------------

%---------------------------------------------------------

func = @(t,i) (1/L)*(Vin(t)-R*i);               %Li'(t)+Ri(t)=Vin(t)

[t1,vout1] = heun(func, Vin,tf, ti, ii, R, L,h);
[t2,vout2] = MyMethod(func,Vin, tf, ti, ii, R, L,h);
[t3,vout3] = midpoint(func,Vin, tf, ti, ii, R, L,h);

subplot(2,2,1);
plot(t1,vout1);   %plot vout of heun method
title('Vin=3.5,heun');
xlabel('t/s'),ylabel('Vout/V');

subplot(2,2,2);
plot(t2,vout2);      %plot vout of MyMethod
title('Vin=3.5,MyMethod');
xlabel('t/s'),ylabel('Vout/V');
%legend('heun','MyMethod','Location','southeast');

subplot(2,2,3);
plot(t3,vout3);      %plot vout of MyMethod
title('Vin=3.5,midpoint');
xlabel('t/s'),ylabel('Vout/V');

subplot(2,2,4);
plot(t1,vout1);
hold on;
plot(t2,vout2);

plot(t3,vout3);
hold off;
xlabel('t/s'),ylabel('Vout/V');
title('')
legend('heun','MyMethod','Midpoint','Location','southeast');


