function [X,X_] = leg(n,x)
    %LEG Summary of this function goes here
    %   Detailed explanation goes here
    

    X(1)=1;
    X(2)=x;
    for i=1:n-1
        X(i+2)=(X(i+1)*(2*i+1)*x-X(i)*i)/(i+1);
    end
    X_(1)=0;
    X_(2)=1;
    for i=1:n-1
        X_(i+2)=X_(i)+(2*i+1)*X(i+1);
    end
    X=X(n+1)
    X_=X_(n+1)
end

