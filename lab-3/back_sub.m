function [X] = back_sub(A,B)
    %FOR_SUB Summary of this function goes here
    %   Detailed explanation goes here
    [m,n]=size(A);
    for i=n:-1:1
        sum=0;
        for j=n:-1:i+1
            sum=sum+A(i,j)*X(j);
        end
        X(i)=(B(i)-sum)/A(i,i);
    end
    X
end

