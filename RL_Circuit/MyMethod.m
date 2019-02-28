%tf:final value
%ti and ii: initial conditions 
%Vin: function of t
%R,L: constnts
%h: step-size
%Using endpoints method

function [t, vout] = MyMethod(func,Vin, tf, ti, ii, R, L, h)
N = round((tf-ti)/h);       %set size of arrays

i=zeros(1,N); t=zeros(1,N);       %set up arrays
t(1)=ti;i(1)=ii;      %initialise arrays
Vin_t = feval(Vin,ti);
vout(1) = 3.5*exp(-ti^2/0.00015) - R*ii;

    for j=1:N-1 
        
        ttemp=t(j); itemp=i(j); 
        k1 = feval(func, ttemp, itemp,Vin_t);
        f1 = ttemp + 3*h/4;
        f2 = itemp + 3*k1*h/4;
        k2 = feval(func, f1, f2,Vin_t);
        i(j+1) = i(j) + h*(k1/3+2*k2/3);
        t(j+1) = ti + j*h;
        Vin_t = feval(Vin,ttemp);
        vout(j+1) = Vin_t - R*itemp;                   %Calculate vout
        %plot(t,i,'r');
        
    end
           
end