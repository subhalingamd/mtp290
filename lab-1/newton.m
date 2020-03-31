function c = newton(x0,eps,TOL)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
for i=1:TOL
y=f(x0);
dy=f1(x0);
if abs(dy)<eps
    error("BYE!")
end
if abs(y)<TOL
    break;
else
    x=x0-y/dy;
    x0=x;
end
end
x0
end

function y=f(x)
    y=x^3-7*x^2+14*x-6;
end
    
function y=f1(x)
    y=3*x^2-14*x+14;
end