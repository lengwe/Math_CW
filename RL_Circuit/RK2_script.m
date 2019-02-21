%initialise all the input parameters
tf = 1
ti = 0
ii = 0
R = 0.5
L = 0.0015
h = 0.005


%Vin = 3.5
%Vin =  @(t) 3.5*exp(-t^2/0.00015);
%Vin =  @(t) 3.5*exp(-t/0.00015);
func = @(t,i) (1/L)*(3.5-R*i);               %Li'(t)+Ri(t)=Vin(t)

%[t,vout] = heun(func, tf, ti, ii, R, L,h);
[t,vout] = MyMethod(func, tf, ti, ii, R, L,h);   
