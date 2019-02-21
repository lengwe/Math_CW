%tf:final value
%ti and ii: initial conditions 
%Vin: function of t
%R,L: constnts
%h: step-size
%Using endpoints method

function [t, vout] = MyMethod(func, tf, ti, ii, R, L, h)
N = round((tf-ti)/h);       %set size of arrays

i=zeros(1,N); t=zeros(1,N);       %set up arrays
t(1)=ti;i(1)=ii;      %initialise arrays

    for j=1:N-1 
        
        ttemp=t(j); itemp=i(j); 
        k1 = h * feval(func, ttemp, itemp);
        f1 = ttemp(j) + 2*h/3;
        f2 = itemp(j) + 2*k1/3;
        k2 = h * feval(func, f1, f2);
        i(j+1) = i(j) + 1/4*(k1+3*k2);
        t(j+1) = ti + i*h;
        
        vout = 3.5 - R*i;
        plot(t,vout,'b'),xlabel('t/s'),ylabel('Vout/V'),title('Vin=3.5, using MyMethod');
    end

end