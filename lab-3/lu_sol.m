function [X] = lu_sol(A,B)
    %LU_SOL Summary of this function goes here
    %   Detailed explanation goes here
    [L,U]=lu_d(A);
    X=for_sub(L,B);
    X=back_sub(U,X);
end

