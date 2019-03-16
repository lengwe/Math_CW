% reference from http://www.mymathlib.com/diffeq/runge-kutta/runge_kutta_3_8.html
%
%yi+1 = yi + 1/8 ( k1 + 3 k2 + 3 k3 + k4 ),
%where
%k1 = hf(xi, yi),
%k2 = hf(xi + h / 3, yi + k1 / 3 ),
%k3 = hf(xi + 2 h / 3, yi - k1 / 3 + k2 ),
%k4 = hf(xi + h, yi + k1 - k2 + k3 ),
%and xi = x0 + i h

function [xii,yii] = RK4second(xi,yi,t,h,f1,f2)

 k1 = h*f2(xi, yi, t);
 k2 = h*f2(xi+h/3, yi+k1/3, t);
 k3 = h*f2(xi+2*h/3, yi-k1/3+k2, t);
 k4 = h*f2(xi+h, yi+k1-k2+k3, t);
 
 yii = yi + 1/8*(k1 + 3*k2 + 3*k3 + k4);
 xii = xi + h*f1(xi, yi, t);
 
end
