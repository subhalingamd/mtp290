function ar = sim(f,a,b,n)
    %SIM Summary of this function goes here
    %   Detailed explanation goes here
    
    h=(b-a)/(2*n);
    x=(a:h:b);
    y=f(x);
    i=2;
    y_=0;
    while i<=length(x)
        y_=y_+f(x(i));
        i=i+2;
    end
    ar=h*(2*sum(y)-y(1)-y(end)+2*y_)/3;

end

