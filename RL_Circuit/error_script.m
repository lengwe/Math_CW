%initialise all the input parameters
tf = 1;
ti = 0;
ii = 0;
R = 0.5;
L = 0.0015;
h = 0.005;
c = 0.00015;
V = 3.5;
%ln(7/2) = log10 (7/2)/log10 (e);
func = @(t,i) (1/L)*(6*cos(2*pi*(20000/3))-R*i);

[t,vout] = heun(func, tf, ti, ii, R, L,h);
plot(t,vout,'b'),xlabel('t/s'),ylabel('Vout/V'),title('Vin=3.5');
hold on;

exact = exp((-1000*t+3*log(7/2))/3);            %exact solution of ODE
plot(t,exact,'r');      %plot approx and exact together
hold on;
error = exact - vout;
plot(t,error,'g');                  %error as function of x
legend('Approx.','Exact','Error','Location','southeast');
max_error = max(abs(error));

figure                  %another figure for varying the value of h
    for i=3:5
        h = 2^(-i);
        [ta,vout] = heun(func, tf, ti, ii, R, L,h);
        error = exact-vout;
        plot(log(h),log(error),'r');
        hold on;
    end