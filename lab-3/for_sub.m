function [X] = for_sub(A,B)
    %FOR_SUB Summary of this function goes here
    %   Detailed explanation goes here
    [m,n]=size(A);
    for i=1:n
        sum=0;
        for j=1:i-1
            sum=sum+A(i,j)*X(j);
        end
       
        X(i)=(B(i)-sum)/A(i,i);
    end
end

