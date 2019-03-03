clear all; close all;
%initialise all the input parameters
tf = 1;
ti = 0;
ii = 0;
R = 0.5;
L = 0.0015;
h = 0.005;
c = 0.00015;
V = 6;
T = 0.00015;
%ln(7/2) = log10 (7/2)/log10 (e);
Vin = @(t) V*cos(2*pi*t/T );
func = @(t,i) (1/L)*(Vin(t) - R*i);

[t1,vout1] = heun(func, Vin, tf, ti, ii, R, L,h);
[t2,vout2] = MyMethod(func, Vin, tf, ti, ii, R, L,h);
[t3,vout3] = midpoint(func, Vin, tf, ti, ii, R, L,h);
exact = @(t) Vin(t) - 3.5;            %exact solution of ODE
%----------Ploting exact solution and three methods together------------
figure (1);
syms t;
fplot(t,exact, [ti tf]);
hold on;
plot(t1,vout1);
hold on;
plot(t2,vout2);
hold on;
plot(t3,vout3);
hold off;
xlabel('t/s'),ylabel('Vout/V'),title('Comparing exact solutions and numerical solutions');
legend('Exact','heun','MyMethod','midpoint','Location','northeast');
%-----------------------errors for three methods--------------------
figure(2);
exact_value = feval(exact,t1);
error_heun = exact_value - vout1;
error_MyMethod = exact_value - vout2;
error_Midpoint= exact_value - vout3;
plot(t1,error_heun);
hold on;
plot(t2,error_MyMethod);
hold on;
plot(t3,error_Midpoint);
hold off;
xlabel('t/s'),ylabel('Error'),title('Error function');
legend('error heun','error MyMethod','error Midpoint','Location','northeast');

%--------------------Ploting order of the error-----------------
figure(3);
for i=1:5
    h = 2^(-i);            %varing value of h
    [t1,vout1] = heun(func, Vin, tf, ti, ii, R, L,h);
    [t2,vout2] = MyMethod(func, Vin, tf, ti, ii, R, L,h);
    [t3,vout3] = midpoint(func, Vin, tf, ti, ii, R, L,h);
    exact_value2 = feval(exact,t1);
    error_order_heun(i) = max(abs(exact_value2 - vout1));
    error_order_MyMethod(i) = max(abs(exact_value2 - vout2));
    error_order_Midpoint(i)= max(abs(exact_value2 - vout3));
   
    h_temp(i) = h;
    
end

loglog(h_temp,error_order_heun);
hold on;
loglog(h_temp,error_order_MyMethod);
hold on;
loglog(h_temp,error_order_Midpoint);
xlabel('log(h)'),ylabel('error'),title('Orders of error');
legend('error order heun','error order MyMethod','error order Midpoint','Location','northeast');
