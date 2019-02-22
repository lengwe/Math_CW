clear all; close all;
%initialise all the input parameters
tf = 0.5;
ti = 0;
ii = 0;
R = 0.5;
L = 0.0015;
h = 0.0001;


%Vin = 3.5
Vin =  @(t) 3.5*exp(-t^2/0.00015);
%Vin =  @(t) 3.5*exp(-t/0.00015);
func = @(t,i, Vin) (1/L)*(Vin-R*i);               %Li'(t)+Ri(t)=Vin(t)

[t,vout] = heun(func, Vin,tf, ti, ii, R, L,h);
%[t,vout] = MyMethod(func,Vin, tf, ti, ii, R, L,h);   
