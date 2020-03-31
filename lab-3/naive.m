function [X] = naive(A,B)
    %NAIVE Summary of this function goes here
    %   Detailed explanation goes here
    X=pinv(A)*B;
end

