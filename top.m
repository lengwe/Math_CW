clear all,format long e
k = 1/40000;
h = 1/20;
b = (1/h)+1;
U = zeros(b,1);
func = zeros(b,1);
m = round(b/2);
n = m+1;
for m =1:b
    U(m,1) = (m-1)*h;
end
% for i = 1:m
%     func(i,1)=2*U(i,1);
% end
% for l = n:b
%     func(l,1)=2-2*U(l,1);
% end
func = 1-U;
t_b =0.00005;
[t,y]=fd(func,h,k,t_b);
mesh(U,t,y)
% for i = 1:10
%     hold on
%     if i == 1
%         plot(U,y(i,:))
%     else
%         plot(U,y(20*i,:))
%     end
%     hold off
% end
