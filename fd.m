function [ t,y_o ] = fd( y,h_o,k_o,t_b )
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
q = round((t_b*k)+1);
res(q,:)=y;
y_new =y;
% [U,S,V] = svd(equ);
% T=S;
% T(find(S~=0)) = 1./S(find(S~=0));
% svdInvA = V * T' * U';
% [Q,R] = qr(equ);
% InvR =  inv(R'*R)*R';
% qrInvA =InvR*Q';
  for i=1:q-1
     y=inv(equ)*y;
     res(q-i,:)=y;
  end

for m=q+1:k
    y_new = equ*y_new;
    res(m,:) = y_new;
end

t = w;
y_o = res;

end

