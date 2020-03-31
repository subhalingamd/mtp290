function X = leg(n,x)
    %LEG Summary of this function goes here
    %   Detailed explanation goes here
    
    X(1)=1;
    X(2)=x;
    for i=2:n
        X(i+1)=X(i)*(2*i+1)*x-X(i-1)*n;
    end
    X=X(1:n+1);
end

