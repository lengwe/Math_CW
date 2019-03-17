%tf:final value
%ti and ii: initial conditions 
%Vin: function of t
%R,L: constnts
%h: step-size
%Using endpoints method

function [t, vout] = midpoint(func,Vin, tf, ti, ii, R, L, h)

N = round((tf-ti)/h);       %set size of arrays

vout=zeros(1,N);
 i=zeros(1,N); t=zeros(1,N);       %set up arrays
 t(1)=ti;i(1)=ii;      %initialise arrays
Vin_t = feval(Vin,ti)
vout(1) = Vin_t - R*ii;

    for j=1:N-1 
        ttemp=t(j); itemp=i(j); 
        k1 = feval(func, ttemp, itemp);
        x_midpoint = ttemp + 0.5*h;
        y_midpoint = itemp + 0.5*h*k1;
        k2 = feval(func, x_midpoint, y_midpoint);

        i(j+1) = i(j) + h*k2;
        t(j+1) = ti + j*h;
        vout(j+1) = Vin(t(j+1)) - R*i(j+1);                   %Calculate vout
    end
end
