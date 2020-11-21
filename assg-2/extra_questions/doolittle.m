function [L,U] = doolittle(A)
    %DOOLITTLE Summary of this function goes here
    % Obtain Doolittle's factorization for 3x3 matrix A
    % 
    % Input
    %  - A : The matrix for which factorisation has to be done
    %
    % Output
    %  - L : The Lower-Triangular matrix part of the factorisation
    %  - U : The Upper-Triangular matrix part of the factorisation    

    % Initialise L and U
    L = eye(3);                  % Initialise it to I(3)
    U = zeros(3,3);              % Initialise it to 0(3,3) 
   
    % The first row of U is same as A
    for i=1:3
        U(1,i)=A(1,i);
    end
    
    % Update first column of L based on A and U
    L(2,1)=A(2,1)/U(1,1);   
    L(3,1)=A(3,1)/U(1,1);
    
    % Update second row of U based on A and L
    U(2,2)=A(2,2)-L(2,1)*U(1,2);
    U(2,3)=A(2,3)-L(2,1)*U(1,3);
    
    % Update L(3,2)
    L(3,2)=(A(3,2)-L(3,1)*U(1,2))/U(2,2);
    
    % Update U(3,3)
    U(3,3)=A(3,3)-L(3,1)*U(1,3)-L(3,2)*U(2,3);
  
end
