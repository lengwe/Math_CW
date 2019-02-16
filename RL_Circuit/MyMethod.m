%Using Euler's method 

function [t,vout] = euler(Vin, tf, ti, ii, R, L,h)

func = @(t,i) 1/L*(Vin - R*i);
N = round((tf-ti)/h);       %determine the size of the array 

ia=zeros(1,N); ta=zeros(1,N);       %set up arrays

ta(1)=ti;ia(1)=ii;                  %initialise arrays 
for j=1:N-1
    ia(j+1) = ia(j) + h*feval(funct, ta(j), ia(j));       %next value of i calculated from previous values of i and t
    ta(j+1) = ta(j) + h;            %increase x by stepsize
end
end