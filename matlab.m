clear;
L = 1
T = 1
maxk=2500;
dt =T/maxk;
n =50;
dx = L/n;
cond =1/4;
b = 2*cond*dt/(dx*dx);

for i= 1:n+1
        x(i) = (i-1)*dx;
        u(i,1) = sin(2*pi*x(i));
end

for k = 1:maxk+1
          u(1,k) = 0;
          u(n+1,k) = 0.;
          time(k) = (k-1)*dt;
end

for k = 1:maxk
    for i =2:n;
        u(i,k+1) = u(i,k)+0.5*b*(u(i-1,k)+u(i+1,k)-2.*u(i,k));
    end
end


figure(1)
plot(x,u(:,1),'-',x,u(:,300),'-',x,u(:,600),'-')
title('temperature within the explicit method')
xlabel('X')
ylabel('T')


figure(2)
mesh(x,time,u')
title('temperature within the explicit method')
xlabel('X')
ylabel('Temperature')
    
       
