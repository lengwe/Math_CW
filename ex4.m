k_o =1/5000;
h_o =1/50;

k = 1000;
h = 50;
v = k_o/(h_o*h_o);
U = zeros(h,1);
w = zeros(1,k);
for m =1:h
    U(m,1) = (m-1)/h;
end
for m =1:k
    w(1,m) = (m-1)/k;
end
y_fun=2*U;%test funtion
equ = zeros(h,h);
op =eye(h,h)*(1-2*v);
equ = equ + eye(h,h)*(1-2*v);
res = zeros(k,h);
for i=1:h-1
    equ(i+1,i)=v;
    equ(i,i+1)=v;
end
for m=1:k
    y_fun = equ*y_fun;
    res(m,:) = y_fun;
end

mesh(U,w,res)

