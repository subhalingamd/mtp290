function c = newton(x0,eps,TOL)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here

y=f(x0);
dy=f1(x0);
i=1;
while i<TOL && abs(y)>eps
    if abs(dy)<eps
        error("der is 0")
    end
    x=x0-y/dy;
    x0=x;
    y=f(x0);
    dy=f1(x0);
    i=i+1;
end
x0
end

function y=f(x)
  y=x^2-6*x-7;
end
    
function y=f1(x)
    y=2*x-6;
end