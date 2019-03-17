%tf:final value
%ti and ii: initial conditions 
%Vin: function of t
%R,L: constnts
%h: step-size

function [t, vout] = heun(func,Vin, tf, ti, ii, R, L, h)

N = round((tf-ti)/h,0);       %set size of arrays

vout=zeros(1,N);
i=zeros(1,N); t=zeros(1,N);       %set up arrays

Vin_t = feval(Vin,ti);
vout(1) = Vin_t - R*ii;

t(1)=ti;i(1)=ii;      %initialise arrays
    for  j=1:N-1        %loop for N steps?
        ttemp=t(j); itemp=i(j);       
        grad1 = feval(func, ttemp, itemp);      %gradient at t
        ip = itemp+h*grad1;                  %calculate i-predictor 
        grad2 = feval(func, ttemp+h, ip);   %calculate gradient at t+h
        grad_ave = (grad1 + grad2)/2;       %average gradient over [t,t+h]
        i(j+1)=itemp + h*grad_ave;         %next value of i calculated from previous values of i and t
        t(j+1)=ttemp + h;
        %Vin_t = feval(Vin,ttemp);
        vout(j+1) = Vin(t(j+1)) - R*i(j+1);                   %Calculate vout
        %plot(t,i,'r');
    end
end


