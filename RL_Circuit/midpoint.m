%tf:final value
%ti and ii: initial conditions 
%Vin: function of t
%R,L: constnts
%h: step-size
%Using endpoints method

function [t, vout] = midpoint(func,Vin, tf, ti, ii, R, L, h)

N = round((tf-ti)/h);       %set size of arrays

i=zeros(1,N); t=zeros(1,N);       %set up arrays
t(1)=ti;i(1)=ii;      %initialise arrays
Vin_t = feval(Vin,ti);
vout(1) = Vin_t - R*ii;

    for j=1:N-1 

        ttemp=t(j); itemp=i(j); 
        k1 = feval(func, ttemp, itemp,Vin_t);
        %f1 = ttemp + 3*h/4;
        x_midpoint = ttemp + 0.5*h;
        %f2 = itemp + 3*k1*h/4;
        y_midpoint = itemp + 0.5*h*k1;
        %k2 = feval(func, f1, f2,Vin_t);
        k2 = feval(func, x_midpoint, y_midpoint,Vin_t);
        %i(j+1) = i(j) + h*(k1/3+2*k2/3);
        i(j+1) = i(j) + h*k2;
        t(j+1) = ti + j*h;
        Vin_t = feval(Vin,ttemp);
        vout(j+1) = Vin_t - R*itemp;                   %Calculate vout
        %plot(t,i,'r');

    end
end
