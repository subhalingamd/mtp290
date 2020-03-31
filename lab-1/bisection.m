function r = bisection(a,b,TOL,maxiter)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
    i=0;
    while b-a>=TOL && i<=maxiter
        c=(a+b)/2;
        if f(c)==0
            break;      
        end
        if f(a)*f(c)<0
            b=c;
        else
            a=c;            
        end
        i=i+1;
    end
[c,i]
%f(0.5859)

end


function y=f(x)
    y=x^2-5*x+6;
    %y=x^3-7*x^2+14*x-6;
end

