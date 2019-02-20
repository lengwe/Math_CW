%initialise all the input parameters
tf = 1
ti = 0
ii = 0
R = 0.5
L = 0.0015
h = 0.005
c = 0.00015
V = 3.5
%Vin = @(t) V*exp(-t^2/c);        %function of t
Vin = 3.5

[t,vout] = heun(Vin, tf, ti, ii, R, L,h);
