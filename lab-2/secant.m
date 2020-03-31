function c = secant(g0,g1,eps,TOL)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here

x(1)=g0;
x(2)=g1;
i=2;
while i-3<TOL && abs(f(x(i)))>eps
    i=i+1;
    x(i)=x(i-1)-(f(x(i-1)))*(x(i-1)-x(i-2))/(f(x(i-1))-f(x(i-2)));
end
x(i)
save("q1a_iter.mat","x");

end

function y=f(x)
  y=x*cos(x);
end


function y=f1(x)
  y=230*x^4+18*x^3+9*x^2-221*x-9;
end
