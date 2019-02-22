%initialise all the input parameters
tf = 0.03
ti = 0
ii = 0
R = 0.5
L = 0.0015
h = 0.001


%Vin = 3.5
%Vin =  @(t) 3.5*exp(-t^2/0.00015);
%Vin =  @(t) 3.5*exp(-t/0.00015);
func = @(t,i) (1/L)*(3.5-R*i);               %Li'(t)+Ri(t)=Vin(t)

N = round((tf-ti)/h);       %set size of arrays

i=zeros(1,N); t=zeros(1,N);       %set up arrays
t(1)=ti;i(1)=ii;      %initialise arrays
vout = 0;

    for j=1:N-1 
        
        ttemp=t(j); itemp=i(j); 
        k1 = feval(func, ttemp, itemp);
        f1 = ttemp + 3*h/4;
        f2 = itemp + 3*k1*h/4;
        k2 = feval(func, f1, f2);
        i(j+1) = i(j) + h*(k1/3+2*k2/3);
        t(j+1) = ti + j*h;
        
        vout = 3.5 - R*i;
        
        plot(t,vout,'b'),xlabel('t/s'),ylabel('Vout/V'),title('Vin=3.5, using MyMethod');
    end
    