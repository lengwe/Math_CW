k_o =1/40000;
h_o =1/20;
k = 1/k_o;
h = 1/h_o;
k = k+1;
h = h+1;
v = k_o/(h_o*h_o);
U = zeros(h,1);
w = zeros(1,k);
for m =1:h
    U(m,1) = (m-1)/(h-1);
end
for m =1:k
    w(1,m) = (m-1)/(k-1);
end
y_fun=2*U;%test funtion
equ = zeros(h,h);
equ = equ + eye(h,h)*(1-2*v);
res = zeros(k,h);
res1= zeros(k,h);
for i=1:h-1
    equ(i+1,i)=v;
    equ(i,i+1)=v;
end
[c,S,V] = svd(equ);
T=S;
T(find(S~=0)) = 1./S(find(S~=0));
svdInvA = V * T' * c';
[Q,R] = qr(equ);
InvR =  inv(R'*R)*R';
qrInvA =InvR*Q';
inv_equ = pinv(equ);
t_b=0.001;
q = round((t_b*k)+1);
res(q,:)=y_fun;
y_new = y_fun;
for op=1:q-1
     y_new = svdInvA  * y_new;
     res(q-op,:)= y_new;
end
for m=q+1:k
    y_fun = equ * y_fun;
    res(m,:)= y_fun;
end
mesh(U,w,res)

