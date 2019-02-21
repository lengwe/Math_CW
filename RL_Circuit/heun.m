%tf:final value
%ti and ii: initial conditions 
%Vin: function of t
%R,L: constnts
%h: step-size

function [t, vout] = heun(func, Vin, tf, ti, ii, R, L,h)

N = round((tf-ti)/h);       %set size of arrays
%plot(ti,ii,'*');          %plot initial condition
%hold on;                %hold for more dat 

i=zeros(1,N); t=zeros(1,N);       %set up arrays

t(1)=ti;i(1)=ii;      %initialise arrays
    for  j=1:N-1        %loop for N steps?
        ttemp=t(j); itemp=i(j);       
        grad1 = feval(func, ttemp, itemp);      %gradient at t
        ip = itemp+h*grad1;                  %calculate i-predictor 
        grad2 = feval(func, ttemp+h, ip);   %calculate gradient at t+h
        grad_ave = (grad1 + grad2)/2;       %average gradient over [t,t+h]
        i(j+1)=itemp + h*grad_ave;         %next value of i calculated from previous values of i and t
        t(j+1)=ttemp + h;   
        vout = Vin - R*i;
        %plot(t,i,'r');
        plot(t,vout,'b');                     %plot vout 
  
    end
end






