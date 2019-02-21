%initialise all the input parameters
tf = 1
ti = 0
ii = 0
R = 0.5
L = 0.0015
h = 0.005
c = 0.00015
V = 3.5

Vin =  @(t) V*exp(-t^2/c);
%Vin = 3.5
func = @(t,i) 1/L*(V*exp(-t^2/c)-R*i);               %Li'(t)+Ri(t)=Vin(t)

[t,vout] = heun(func, Vin, tf, ti, ii, R, L,h);          
