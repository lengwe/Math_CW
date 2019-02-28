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
func = @(t,i,Vin) (1/L)*(Vin - R*i);

[t1,vout1] = heun(func, Vin, tf, ti, ii, R, L,h);
[t2,vout2] = MyMethod(func, Vin, tf, ti, ii, R, L,h);
[t3,vout3] = midpoint(func, Vin, tf, ti, ii, R, L,h);
exact = @(t,Vin) Vin - 3.5;            %exact solution of ODE
%----------Ploting exact solution and three methods together------------
figure (1);
plot(t, exact);
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
error_heun = exact - vout1;
error_MyMethod = exact - vout2;
error_Midpoint= exact - vout3;
figure (1);
plot(t1,error_heun);
hold on;
plot(t2,error_MyMethod);
hold on;
plot(t3,error_Midpoint);
hold off;
xlabel('t/s'),ylabel('Error'),title('Error function');
legend('error_heun','error_MyMethod','error_Midpoint','Location','northeast');

%--------------------Ploting order of the error-----------------
figure(3);
for i=3:5
    h = 2^(-i);            %varing value of h
    [t1,vout1] = heun(func, Vin, tf, ti, ii, R, L,h);
    [t2,vout2] = MyMethod(func, Vin, tf, ti, ii, R, L,h);
    [t3,vout3] = midpoint(func, Vin, tf, ti, ii, R, L,h);
    error_order_heun = max(abs(exact - vout1));
    error_order_MyMethod = max(abs(exact - vout2));
    error_order_Midpoint= max(abs(exact - vout3));
    plot(log(h),log(error_order_heun));
    hold on;
    plot(log(h),log(error_order_MyMethod));
    hold on;
    plot(log(h),log(error_order_Midpoint));
end

xlabel('log(h)'),ylabel('error'),title('Orders of error');
legend('error_order_heun','error_order_MyMethod','error_order_Midpoint','Location','northeast');
