function [ t,y_o ] = fd( y,h_o,k_o,fun)
%k = 2500;
%h = 80;
k = 1/k_o;
h =1/h_o;
k = k+1;
h = h+1;
v = k_o/(h_o*h_o);
w = zeros(1,k);
for m =1:k
    w(1,m) = (m-1)/(k-1);
end
%y_fun=y;%test funtion
equ = zeros(h,h);
equ = equ + eye(h,h)*(1-2*v);
res = zeros(k,h);
for i=1:h-1
    equ(i+1,i)=v;
    equ(i,i+1)=v;
end

res(1,:)=y;

for m=2:k
    res(m,:) = res(m-1,:)*equ;
    res(m,1)=feval(fun,((m-1)*k_o));
    res(m,h)=feval(fun,((m-1)*k_o));
end

t = w;
y_o = res;

end

