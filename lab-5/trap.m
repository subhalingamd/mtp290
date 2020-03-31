function ar = trap(f,a,b,n)
    %TRAP Summary of this function goes here
    %   Detailed explanation goes here
    
    h=(b-a)/n;
    x=(a:h:b);
    y=f(x);
    ar=0.5*h*(2*sum(y)-y(1)-y(end));

end

