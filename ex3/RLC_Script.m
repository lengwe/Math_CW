function RLC_Script () 
close all;
clear;
clc;

%initailise parameters 

R = 250;   %resistance
C = 3e-6;  %capacitance
L = 650e-3;  %inductance

h = 0.0001; %stepsize
tf = 0.5;   %final time
N = round(tf/h);  %number of steps

q = zeros(1, N);   %charge
i = zeros(1, N);   %current dqc/dt
t = zeros(1, N);   %x-axis

q(1) = 500e-9;  %intial charge
i(1) = 0;     %zero initial current 
t(1) = 0;     %start at time 0

Vout = zeros(1, N); %output voltage
%input

%case 1
%5V dc
%  Vin = @(t)5*heaviside(t); 

%case 2
% impluse signal with delay
% Vin = @(t)5*heaviside(t)*exp(-(t*t)/(3e-6));

%case 3
%Square Wave with freq 5Hz, 100Hz, 500Hz
f=113.97;
Vin = @(t)5*square(2*pi*f*t);

%case 4 
%%Sine Wave with freq 5Hz, 100Hz, 500Hz
% f =500;
% Vin = @(t)5*sin(2*pi*f*t);

%coupled first order ODEs from calculation
f1 = @(q, i, t)i; 
f2 = @(q, i, t)(Vin(t) - R*i - q/C )/L; 

for k = 1 : N - 1
    t(k + 1) = t(k) + h;
    [q(k + 1), i(k + 1)] = RK4second(q(k), i(k), t(k), h, f1, f2); 
    Vout(k) = R*i(k);
end


plot(t,Vout);
hold on;
fplot(Vin,'--');
 xlim([0,0.1]);
 ylim([-10,10]);
xlabel('Time(s)');
ylabel('Vout(V)');
title('F = 113.97');
end