clear all; close all;
%initialise all the input parameters
tf = 0.05;
ti = 0;
ii = 0;
R = 500;
L = 0.0015;
h = 0.000005;

%---------------------inputs------------------------------
Vin =  @(t) 3.5
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
%Vin =  @(t) 6*cos(2*pi*t/0.00015);
%Vin =  @(t) 4*sin(2*pi*t/0.5);
%---------------------------------------------------------
func = @(t,i) (1/L)*(Vin(t)-R*i);               %Li'(t)+Ri(t)=Vin(t)
figure (1);

[t1,vout1] = heun(func,Vin,tf, ti, ii, R, L,h);
[t2,vout2] = MyMethod(func,Vin, tf, ti, ii, R, L,h);
[t3,vout3] = midpoint(func,Vin, tf, ti, ii, R, L,h);

subplot(2,2,1);
plot(t1,vout1);   %plot vout of heun method
title('sine T = 0.5,heun');
xlabel('t/s'),ylabel('Vout/V');

subplot(2,2,2);
plot(t2,vout2);      %plot vout of MyMethod
title('sine T = 0.5,MyMethod');
xlabel('t/s'),ylabel('Vout/V');
%legend('heun','MyMethod','Location','southeast');

subplot(2,2,3);
plot(t3,vout3);      %plot vout of MyMethod
title('sine T = 0.5,midpoint');
xlabel('t/s'),ylabel('Vout/V');

subplot(2,2,4);
plot(t1,vout1);
hold on;
plot(t2,vout2);
plot(t3,vout3);
hold off;
xlabel('t/s'),ylabel('Vout/V');
title('Combined')
legend('heun','MyMethod','Midpoint','Location','southeast');
%--------------------------different period------------------
%--------this section is used to plot the signals at different time period-----------
% T1 = 15E-6;
% T2 = 150E-6;
% T3 = 400E-6;
% T4 = 1100E-6;

% Vin_1 =  @(t) 4*square(2*pi*t/T1);
% Vin_2 =  @(t) 4*square(2*pi*t/T2);
% Vin_3 =  @(t) 4*square(2*pi*t/T3);
% Vin_4 =  @(t) 4*square(2*pi*t/T4);

% func1 = @(t,i) (1/L)*(Vin_1(t)-R*i);
% func2 = @(t,i) (1/L)*(Vin_2(t)-R*i);
% func3 = @(t,i) (1/L)*(Vin_3(t)-R*i);
% func4 = @(t,i) (1/L)*(Vin_4(t)-R*i);

% [t1,vout1] = MyMethod(func1,Vin_1,tf, ti, ii, R, L,h);
% [t2,vout2] = MyMethod(func2,Vin_2,tf, ti, ii, R, L,h);
% [t3,vout3] = MyMethod(func3,Vin_3,tf, ti, ii, R, L,h);
% [t4,vout4] = MyMethod(func4,Vin_4,tf, ti, ii, R, L,h);

% figure (2);

% subplot(2,2,1);
% plot(t1,vout1);   %plot vout of heun method
% title('MyMethod,T = 15\mus');
% xlabel('t/s'),ylabel('Vout/V');

% subplot(2,2,2);
% plot(t2,vout2);      %plot vout of MyMethod
% title('MyMethod,T = 150\mus');
% xlabel('t/s'),ylabel('Vout/V');
% %legend('heun','MyMethod','Location','southeast');

% subplot(2,2,3);
% plot(t3,vout3);      %plot vout of MyMethod
% title('MyMethod,T = 400\mus');
% xlabel('t/s'),ylabel('Vout/V');

% subplot(2,2,4);
% plot(t4,vout4);
% hold off;
% xlabel('t/s'),ylabel('Vout/V');
% title('MyMethod,T = 1100\mus')



