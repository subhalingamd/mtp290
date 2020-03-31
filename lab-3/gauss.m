function [X] = gauss(A,B)
    %GAUSS Summary of this function goes here
    %   Detailed explanation goes here
    [m,n]=size(A);
    Y=[A,B];
    for i=1:n
        for j=i+1:m
            f=-Y(j,i)/Y(i,i);
            Y(j,:)=Y(j,:)+f*Y(i,:);
        end
    end
    X=back_sub(Y(:,1:n),Y(:,n+1));
end

