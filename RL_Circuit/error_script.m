clear all; close all;
%initialise all the input parameters
tf = 0.005;
ti = 0;
ii = 0;
R = 0.5;
L = 0.0015;
h = 0.000001;
V = 6;
T = 0.00015;
a = 2*pi/T;
%ln(7/2) = log10 (7/2)/log10 (e);
Vin = @(t) V*cos(2*pi*t/T);
func = @(t,i) (1/L)*(Vin(t) - R*i);

[t1,vout1] = heun(func, Vin, tf, ti, ii, R, L,h);
[t2,vout2] = MyMethod(func, Vin, tf, ti, ii, R, L,h);
[t3,vout3] = midpoint(func, Vin, tf, ti, ii, R, L,h);
solution = @(t) (6*R/(R^2+a^2*L^2))*cos(a*t)+(6*L*a/(R^2+a^2*L^2))*sin(a*t)-(6*R/(R^2+a^2*L^2))*exp(-R*t/L);
exact = @(t) Vin(t) - R*solution(t);            %exact solution of ODE
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
i=1;
for j=15:25
    clear vout1 vout2 vout3;
    h = 2^(-j);            %varing value of h
    [t1,vout1] = heun(func, Vin, tf, ti, ii, R, L,h);
    [t2,vout2] = MyMethod(func, Vin, tf, ti, ii, R, L,h);
    [t3,vout3] = midpoint(func, Vin, tf, ti, ii, R, L,h);
    exact_value2 = feval(exact,t1);
    error_order_heun(i) = max(abs(exact_value2 - vout1));
    error_order_MyMethod(i) = max(abs(exact_value2 - vout2));
    error_order_Midpoint(i)= max(abs(exact_value2 - vout3));
    h_temp(i) = h;
    i=i+1;
end

figure(3);
loglog(h_temp,error_order_heun);
hold on;
loglog(h_temp,error_order_MyMethod);
hold on;
loglog(h_temp,error_order_Midpoint);
hold off;
xlabel('h'),ylabel('error'),title('Orders of error');
legend('error order heun','error order MyMethod','error order Midpoint','Location','northeast');
